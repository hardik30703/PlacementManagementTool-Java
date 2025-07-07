package com.example.MCompProject.Service;

import com.example.MCompProject.Domain.*;
import com.example.MCompProject.Repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class SiteVisitService {
    @Autowired
    private StudentRepo studentRepo;

    @Autowired
    private StudentService studentService;

    @Autowired
    private ProviderRepo providerRepo;

    @Autowired
    private SiteVisitRepo siteVisitRepo;

    @Autowired
    private TutorTimeSlotRepo tutorTimeSlotRepo;

    @Autowired
    private ProviderAvailabilityRepo providerAvailabilityRepo;

    @Autowired
    private StudentAvailabilityRepo studentAvailabilityRepo;
    @Autowired
    private TutorService tutorService;


    public void saveTutorTimeSlot(TutorTimeSlot tutorTimeSlot) {
        tutorTimeSlotRepo.save(tutorTimeSlot);
    }

    public List<TutorTimeSlot> findTutorAvailabilityByCity(String city) {
        return tutorTimeSlotRepo.findByCity(city);
    }

    public List<TutorTimeSlot> findTutorAvailabilityByCityAndDate(String city, String date) {
        return tutorTimeSlotRepo.findByCityAndDate(city, date);
    }

    @Transactional
    public void deleteTutorAvailabilityByCityAndDate(String city, String date) {
        tutorTimeSlotRepo.deleteByCityAndDate(city, date);
    }

    public String findProviderCityById(int providerId) {
        Provider provider = providerRepo.findById(providerId);
        if (provider != null && provider.getProviderForms() != null) {
            return provider.getProviderForms().get(0).getCity();
        } else {
            return "";
        }
    }

    public String findStudentCityById(int studentId) {
        Student student = studentRepo.findById(studentId);
        if (student != null && student.getProviderForm() != null) {
            return student.getProviderForm().getCity();
        } else {
            return "";
        }
    }

    @Transactional
    public void saveStudentAvailability(int studentId, List<Integer> selectedSlots) {
        Optional<Student> studentOpt = Optional.ofNullable(studentRepo.findById(studentId));
        if (studentOpt.isPresent()) {
            Student student = studentOpt.get();

            // Delete existing availability entries for this student
            studentAvailabilityRepo.deleteByStudent(student);

            for (Integer slotId : selectedSlots) {
                StudentAvailability availability = new StudentAvailability(slotId, student);
                studentAvailabilityRepo.save(availability);
            }
        }
    }

    @Transactional
    public void saveProviderAvailability(int providerId, List<Integer> selectedSlots) {
        Optional<Provider> providerOpt = Optional.ofNullable(providerRepo.findById(providerId));
        if (providerOpt.isPresent()) {
            Provider provider = providerOpt.get();

            providerAvailabilityRepo.deleteByProvider(provider);

            for (Integer slotId : selectedSlots) {
                ProviderAvailability availability = new ProviderAvailability(slotId, provider);
                providerAvailabilityRepo.save(availability);
            }
        }
    }

    public List<SiteVisit> getSiteVisitsByCity(String city) {
        return siteVisitRepo.findByCity(city);
    }

    @Transactional
    public List<SiteVisit> generateScheduleForCity(String city) {
        // Fetch all existing SiteVisit entries for the specified city
        List<SiteVisit> existingSiteVisits = siteVisitRepo.findByCity(city);

        // Reset booked status of TutorTimeSlot entries
        for (SiteVisit siteVisit : existingSiteVisits) {
            TutorTimeSlot timeSlot = siteVisit.getTutorTimeSlot();
            timeSlot.setBooked(false);
            tutorTimeSlotRepo.save(timeSlot);
        }

        // Remove all existing SiteVisit entries for the specified city
        siteVisitRepo.deleteAll(existingSiteVisits);

        // Fetch all the availabilities for students and providers
        List<StudentAvailability> studentAvailabilities = studentAvailabilityRepo.findByCity(city);

        // Generate schedule ensuring at least a 30-minute break between visits of different providers
        List<SiteVisit> schedule = new ArrayList<>();
        Set<String> bookedPairs = new HashSet<>(); // To track booked student-provider pairs
        Set<Integer> bookedSlots = new HashSet<>(); // To track booked slots
        TutorTimeSlot previousBookedSlot = null; // Tracks the last booked slot to enforce breaks
        Integer previousProviderId = null; // Tracks the last booked provider ID
        Set<Student> unscheduledStudents = new HashSet<>(); // tracks unscheduled student-provider
        Set<Integer> notifiedStudents = new HashSet<>();
        Set<Integer> notifiedProviders = new HashSet<>();

        for (StudentAvailability studentAvailability : studentAvailabilities) {
            TutorTimeSlot studentSlot = tutorTimeSlotRepo.findById(studentAvailability.getSlotId()).orElseThrow();

            // Skip if the slot is already booked for the student
            if (bookedSlots.contains(studentSlot.getTTSId()) || studentSlot.isBooked()) {
                continue;
            }

            Provider provider = studentAvailability.getStudent().getProvider();

            // Ensure the provider is valid
            if (provider == null) {
                continue;
            }

            Integer providerId = provider.getProviderId();
            String pairKey = studentAvailability.getStudent().getStudentID() + "-" + providerId;

            // Ensure the slot matches availability conditions and prevent duplicate student-provider pair booking
            if (!bookedPairs.contains(pairKey)) {
                // Check for break enforcement if switching providers
                if (previousBookedSlot != null && !Objects.equals(previousProviderId, providerId)) {
                    DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
                    LocalTime previousEndTime = LocalTime.parse(previousBookedSlot.getEndTime(), timeFormatter);
                    LocalTime currentStartTime = LocalTime.parse(studentSlot.getStartTime(), timeFormatter);

                    long timeDifference = previousEndTime.until(currentStartTime, java.time.temporal.ChronoUnit.MINUTES);
                    if (timeDifference < 30) {
                        continue; // Skip this slot to enforce the break
                    }
                }

                //Book the site visit
                SiteVisit siteVisit = new SiteVisit(
                        studentSlot.getDate(),
                        studentSlot.getStartTime(),
                        studentSlot.getEndTime(),
                        studentAvailability.getStudent(),
                        provider,
                        studentSlot.getTutor()
                );

                siteVisit.setTutorTimeSlot(studentSlot);
                siteVisitRepo.save(siteVisit);
                schedule.add(siteVisit);

                // Update the booked slot and provider details
                studentSlot.setBooked(true);
                tutorTimeSlotRepo.save(studentSlot);

                bookedPairs.add(pairKey);
                bookedSlots.add(studentSlot.getTTSId());
                previousBookedSlot = studentSlot;
                previousProviderId = providerId;

                sendSiteVisitNotifications(Collections.singletonList(siteVisit));
                notifiedStudents.add(studentAvailability.getStudent().getStudentID());
                notifiedProviders.add(provider.getProviderId());
            } else {
                unscheduledStudents.add(studentAvailability.getStudent());
            }
        }

        // Notify unscheduled students and providers
        for (Student student : unscheduledStudents) {
            Provider provider = student.getProvider();
            Tutor tutor = tutorService.findTutorById(1);
            if (provider != null && !notifiedStudents.contains(student.getStudentID())
                    && !notifiedProviders.contains(provider.getProviderId())) {
                String emailBody = "We could not schedule a site visit for you. Please contact " + tutor.getEmail() + " to manually arrange one.";
                String emailTutor = "We could not schedule a site visit for Student:" + student.getFirstname() + " " + student.getLastname() + " and their corresponding Provider: " + student.getProviderForm().getNameoforganisation();
                studentService.sendEmail(student.getEmail(), "Site Visit Scheduling Update", emailBody);
                studentService.sendEmail(provider.getEmail(), "Site Visit Scheduling Update", emailBody);
                studentService.sendEmail(tutor.getEmail(), "Site Visit Scheduling Update", emailTutor);
            }
        }


        return schedule;
    }


    private void sendSiteVisitNotifications(List<SiteVisit> siteVisits) {
        // Create a map to group students by provider
        Map<Provider, List<SiteVisit>> providerSiteVisitsMap = new HashMap<>();

        for (SiteVisit siteVisit : siteVisits) {
            Provider provider = siteVisit.getProvider();
            providerSiteVisitsMap.putIfAbsent(provider, new ArrayList<>());
            providerSiteVisitsMap.get(provider).add(siteVisit);

            // Send email to the student
            Student student = siteVisit.getStudent();
            String studentEmail = student.getEmail();

            String studentMessage = String.format(
                    "Dear %s,\n\nYour site visit has been scheduled.\n\n" +
                            "Date: %s\nStart Time: %s\nEnd Time: %s\n\n" +
                            "Kind regards,\nUniversity of Leicester Placements Team",
                    student.getFirstname() + " " + student.getLastname(),
                    siteVisit.getDate(), siteVisit.getStartTime(), siteVisit.getEndTime()
            );

            studentService.sendEmail(studentEmail, "Site Visit Scheduled", studentMessage);
        }

        // Send a grouped email to each provider with details of all their students' site visits
        for (Map.Entry<Provider, List<SiteVisit>> entry : providerSiteVisitsMap.entrySet()) {
            Provider provider = entry.getKey();
            List<SiteVisit> visits = entry.getValue();

            String providerEmail = provider.getEmail();
            String providerName = (provider.getProviderForms() != null && !provider.getProviderForms().isEmpty())
                    ? provider.getProviderForms().get(0).getNameoforganisation()
                    : "Your Organization";

            StringBuilder providerMessage = new StringBuilder(String.format(
                    "Dear %s,\n\nHere are the site visits scheduled for your student(s):\n\n",
                    providerName
            ));

            for (SiteVisit siteVisit : visits) {
                Student student = siteVisit.getStudent();
                providerMessage.append(String.format(
                        "- Student: %s\n  Date: %s\n  Start Time: %s\n  End Time: %s\n\n",
                        student.getFirstname() + " " + student.getLastname(),
                        siteVisit.getDate(), siteVisit.getStartTime(), siteVisit.getEndTime()
                ));
            }

            providerMessage.append("Kind regards,\nUniversity of Leicester Placements Team");

            studentService.sendEmail(providerEmail, "Site Visit Schedule for Your Students", providerMessage.toString());
        }
    }


    public List<SiteVisit> findSiteVisitsByDateAndCity(String date, String city) {
        return siteVisitRepo.findByDateAndCity(date, city);
    }

    public List<String> getDatesByCity(String city) {
        return siteVisitRepo.findDistinctDatesByCity(city);
    }

    public List<SiteVisit> findSiteVisitsByDateAndCityOrderedByTime(String date, String city) {
        return siteVisitRepo.findByDateAndCityOrderedByTime(date, city);
    }

    public List<SiteVisit> findAllSiteVisitsOrderedByDateAndTime() {
        return siteVisitRepo.findAllByOrderByDateAscStartTimeAsc();
    }


}
