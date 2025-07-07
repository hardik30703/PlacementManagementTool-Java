package com.example.MCompProject.Controller;

import com.example.MCompProject.Domain.*;
import com.example.MCompProject.Repository.OnlineMeetingRepo;
import com.example.MCompProject.Service.ProviderService;
import com.example.MCompProject.Service.SiteVisitService;
import com.example.MCompProject.Service.StudentService;
import com.example.MCompProject.Service.TutorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Controller
public class TutorController {

    @Autowired
    TutorService tutorService;

    @Autowired
    StudentService studentService;

    @Autowired
    ProviderService providerService;

    @Autowired
    SiteVisitService siteVisitService;

    @Autowired
    private OnlineMeetingRepo onlineMeetingRepo;


    @GetMapping("/TutorDashboard")
    public String TutorDashboard() {
        return "TutorDashboard";
    }

    @GetMapping("/ViewStudents")
    public String showStudents(@RequestParam(required = false) String username, @RequestParam(required = false) String formStatus, Model model) {
        List<Student> students;

        // Fetch students based on the search criteria
        if (username != null && !username.isEmpty()) {
            students = new ArrayList<>();
            Student student = studentService.findByUsername(username);
            if (student != null) {
                students.add(student);
            }
        } else {
            students = studentService.getAllStudents();
        }

        // Apply filter criteria if provided
        if (formStatus != null && !formStatus.equals("all")) {
            students = students.stream()
                    .filter(student -> {
                        switch (formStatus) {
                            case "studentFormSubmitted":
                                return student.getStudentForm().isSubmitted();
                            case "studentAndProviderFormsSubmitted":
                                return student.getStudentForm().isSubmitted() && student.getProviderForm().isSubmitted();
                            case "decisionMade":
                                return student.getTutorForm() != null && student.getTutorForm().isSubmitted();
                            default:
                                return true;
                        }
                    })
                    .collect(Collectors.toList());
        }

        // Add discrepancies for each student to the model
        Map<Integer, Map<String, String>> discrepanciesMap = new HashMap<>();
        for (Student student : students) {
            Map<String, String> discrepancies = tutorService.compareForms(student.getStudentID());
            discrepanciesMap.put(student.getStudentID(), discrepancies);
        }
        model.addAttribute("discrepanciesMap", discrepanciesMap);

        model.addAttribute("students", students);
        return "ViewStudents";
    }


    @GetMapping("/SearchStudentUsernames")
    @ResponseBody
    public List<String> searchStudentUsernames(@RequestParam String username) {
        return studentService.findUsernamesByUsername(username);
    }

    @GetMapping("/ViewStudentForm/{studentId}")
    public String showStudentForm(Model model, @PathVariable int studentId) {
        StudentForm studentForm = studentService.findByStudentId(studentId);

        if (studentForm != null) {
            model.addAttribute("studentForm", studentForm);
        }

        return "ViewStudentForm";
    }

    @GetMapping("/ShowProviderForm/{studentId}")
    public String showProviderForm(Model model, @PathVariable int studentId) {
        Student student = studentService.findById(studentId);
        ProviderForm providerForm = student.getProviderForm();

        if (providerForm != null) {
            model.addAttribute("providerForm", providerForm);
        }

        return "ViewProviderForm";
    }

    @GetMapping("/ShowTutorForm/{studentId}")
    public String showTutorForm(Model model, @PathVariable int studentId) {
        Student student = studentService.findById(studentId);
        TutorForm tutorForm = student.getTutorForm();

        if (tutorForm == null) {
            tutorForm = new TutorForm();
            tutorForm.setStudent(student);
        }

        model.addAttribute("tutorForm", tutorForm);
        model.addAttribute("studentId", studentId);
        model.addAttribute("isSubmitted", tutorForm.isSubmitted());
        return "TutorForm";
    }

    @PostMapping("/blockStudent")
    public String blockStudent(@RequestParam int studentId) {
        Student student = studentService.findById(studentId);
        if (student != null) {
            student.setBlocked(!student.isBlocked());
            studentService.save(student);
        }
        return "redirect:/ViewStudents";
    }

    @PostMapping("/tutorForm")
    public String submitTutorForm(@ModelAttribute TutorForm tutorForm, @RequestParam int studentId) {
        Student student = studentService.findById(studentId);
        TutorForm existingTutorForm = student.getTutorForm();

        if (existingTutorForm == null) {
            existingTutorForm = new TutorForm();
            existingTutorForm.setStudent(student);
        }

        // Update the existing tutor form with new data
        existingTutorForm.setStudentname(tutorForm.getStudentname());
        existingTutorForm.setNameoforganisation(tutorForm.getNameoforganisation());
        existingTutorForm.setImpact(tutorForm.getImpact());
        existingTutorForm.setSamedetails(tutorForm.getSamedetails());
        existingTutorForm.setMeetrequirementshours(tutorForm.getMeetrequirementshours());
        existingTutorForm.setProviderconfirm(tutorForm.getProviderconfirm());
        existingTutorForm.setConfidenceonprovider(tutorForm.getConfidenceonprovider());
        existingTutorForm.setStudentvisa(tutorForm.getStudentvisa());
        existingTutorForm.setStudentvisacomply(tutorForm.getStudentvisacomply());
        existingTutorForm.setWorkingconditions(tutorForm.getWorkingconditions());
        existingTutorForm.setTraining(tutorForm.getTraining());
        existingTutorForm.setWorkfromhome(tutorForm.getWorkfromhome());
        existingTutorForm.setInternationalremoteworking(tutorForm.getInternationalremoteworking());
        existingTutorForm.setTravelissues(tutorForm.getTravelissues());
        existingTutorForm.setWorkinmultiplesites(tutorForm.getWorkinmultiplesites());
        existingTutorForm.setRisks(tutorForm.getRisks());
        existingTutorForm.setInappropriateaccommodation(tutorForm.getInappropriateaccommodation());
        existingTutorForm.setPrecautionarymeasures(tutorForm.getPrecautionarymeasures());
        existingTutorForm.setPersonalfactors(tutorForm.getPersonalfactors());
        existingTutorForm.setPublicliabilityinsurance(tutorForm.getPublicliabilityinsurance());
        existingTutorForm.setEmployerliabilityinsurance(tutorForm.getEmployerliabilityinsurance());
        existingTutorForm.setProfessionalindemnityinsurance(tutorForm.getProfessionalindemnityinsurance());
        existingTutorForm.setHealthandsafetypolicy(tutorForm.getHealthandsafetypolicy());
        existingTutorForm.setObjectionsofsitevisits(tutorForm.getObjectionsofsitevisits());
        existingTutorForm.setConfidentiality(tutorForm.getConfidentiality());
        existingTutorForm.setDecision(tutorForm.getDecision());
        existingTutorForm.setReason(tutorForm.getReason());
        existingTutorForm.setNameoftutor(tutorForm.getNameoftutor());
        existingTutorForm.setSignature(tutorForm.getSignature());
        existingTutorForm.setSupervisor(tutorForm.getSupervisor());
        existingTutorForm.setDirectorsignature(tutorForm.getDirectorsignature());

        boolean isApproved = "Placement request Authorised".equals(tutorForm.getDecision());
        boolean isRejected = "Placement request rejected (please provide reasons below)".equals(tutorForm.getDecision());
        boolean isOnHold = "Placement request on hold until further information is provided (please provide reasons below)".equals(tutorForm.getDecision());

        if (isApproved) {
            existingTutorForm.setSubmitted(true);
            student.setApproved(true);
            student.setRejectionCount(0);  // Reset rejection count on approval
        } else if (isRejected) {
            student.setRejectionCount(student.getRejectionCount() + 1);
            existingTutorForm.setSubmitted(false);
        } else {
            existingTutorForm.setSubmitted(false);
        }

        tutorService.saveForm(existingTutorForm);

        StudentForm studentForm = student.getStudentForm();
        if (studentForm != null) {
            if (isApproved) {
                studentForm.setStatus("Tutor approved the placement request.");
            } else if (isRejected) {
                studentForm.setStatus("Tutor rejected the placement request.");
                studentForm.setSubmitted(false);
                student.getProviderForm().setSubmitted(false);
            } else if (isOnHold) {
                studentForm.setStatus("Tutor put the placement request on hold. Awaiting further information.");
                studentForm.setSubmitted(false);
                student.getProviderForm().setSubmitted(false);
            }
            studentService.saveStudentForm(studentForm);
        }


        // Create the email content based on the decision
        String decisionMessage = isApproved ? "approved" : isRejected ? "rejected" : "put on hold";
        String content = "Hello " + tutorForm.getStudentname() + ",\n\nYour Placement Application has been " +
                decisionMessage + " by the Placement Tutor.";

        if (isRejected || isOnHold) {
            content += "\n\nReason: " + tutorForm.getReason();
        }

        content += "\n\nThank you for using our service.";

        // Send the decision email to the student
        studentService.sendEmail(student.getEmail(), "Placement Application Decision", content);

        return "redirect:/TutorDashboard";
    }


    @PostMapping("/saveTutorForm")
    public String saveTutorForm(@ModelAttribute TutorForm tutorForm, @RequestParam int studentId) {
        Student student = studentService.findById(studentId);
        TutorForm existingTutorForm = student.getTutorForm();

        if (existingTutorForm == null) {
            existingTutorForm = new TutorForm();
            existingTutorForm.setStudent(student);
        }

        // Update the existing tutor form with new data
        existingTutorForm.setStudentname(tutorForm.getStudentname());
        existingTutorForm.setNameoforganisation(tutorForm.getNameoforganisation());
        existingTutorForm.setImpact(tutorForm.getImpact());
        existingTutorForm.setSamedetails(tutorForm.getSamedetails());
        existingTutorForm.setMeetrequirementshours(tutorForm.getMeetrequirementshours());
        existingTutorForm.setProviderconfirm(tutorForm.getProviderconfirm());
        existingTutorForm.setConfidenceonprovider(tutorForm.getConfidenceonprovider());
        existingTutorForm.setStudentvisa(tutorForm.getStudentvisa());
        existingTutorForm.setStudentvisacomply(tutorForm.getStudentvisacomply());
        existingTutorForm.setWorkingconditions(tutorForm.getWorkingconditions());
        existingTutorForm.setTraining(tutorForm.getTraining());
        existingTutorForm.setWorkfromhome(tutorForm.getWorkfromhome());
        existingTutorForm.setInternationalremoteworking(tutorForm.getInternationalremoteworking());
        existingTutorForm.setTravelissues(tutorForm.getTravelissues());
        existingTutorForm.setWorkinmultiplesites(tutorForm.getWorkinmultiplesites());
        existingTutorForm.setRisks(tutorForm.getRisks());
        existingTutorForm.setInappropriateaccommodation(tutorForm.getInappropriateaccommodation());
        existingTutorForm.setPrecautionarymeasures(tutorForm.getPrecautionarymeasures());
        existingTutorForm.setPersonalfactors(tutorForm.getPersonalfactors());
        existingTutorForm.setPublicliabilityinsurance(tutorForm.getPublicliabilityinsurance());
        existingTutorForm.setEmployerliabilityinsurance(tutorForm.getEmployerliabilityinsurance());
        existingTutorForm.setProfessionalindemnityinsurance(tutorForm.getProfessionalindemnityinsurance());
        existingTutorForm.setHealthandsafetypolicy(tutorForm.getHealthandsafetypolicy());
        existingTutorForm.setObjectionsofsitevisits(tutorForm.getObjectionsofsitevisits());
        existingTutorForm.setConfidentiality(tutorForm.getConfidentiality());
        existingTutorForm.setDecision(tutorForm.getDecision());
        existingTutorForm.setReason(tutorForm.getReason());
        existingTutorForm.setNameoftutor(tutorForm.getNameoftutor());
        existingTutorForm.setSignature(tutorForm.getSignature());
        existingTutorForm.setSupervisor(tutorForm.getSupervisor());
        existingTutorForm.setDirectorsignature(tutorForm.getDirectorsignature());

        tutorService.saveForm(existingTutorForm);

        return "redirect:/ViewStudents";
    }

    @GetMapping("/ViewFlags/{studentId}")
    public String viewFlags(@PathVariable int studentId, Model model) {
        Map<String, String> discrepancies = tutorService.compareForms(studentId);

        Student student = studentService.findById(studentId);
        StudentForm studentForm = student.getStudentForm();
        ProviderForm providerForm = student.getProviderForm();

        model.addAttribute("discrepancies", discrepancies);
        model.addAttribute("student", student);
        model.addAttribute("studentForm", studentForm);
        model.addAttribute("providerForm", providerForm);
        return "ViewFlags";
    }

    @PostMapping("/resolveFlag")
    @ResponseBody
    public Map<String, Object> resolveFlag(@RequestBody Map<String, Object> request) {
        String field = (String) request.get("field");
        int studentID = (Integer) request.get("studentID");
        String source = (String) request.get("source");

        boolean success = tutorService.resolveFlag(field, studentID, source);

        Map<String, Object> response = new HashMap<>();
        response.put("success", success);
        return response;
    }

    @GetMapping("/viewStudentsMap")
    public String showApprovedStudents(Model model) {
        List<Student> allStudents = studentService.getAllStudents();
        List<Student> approvedStudents = new ArrayList<>();

        for (Student student : allStudents) {
            if (student.isApproved()) {
                approvedStudents.add(student);
            }
        }
        model.addAttribute("approvedStudents", approvedStudents);
        return "ViewStudentMap";
    }

    @GetMapping("/getApprovedStudents")
    @ResponseBody
    public List<Student> getApprovedStudents() {
        List<Student> allStudents = studentService.getAllStudents();
        List<Student> approvedStudents = new ArrayList<>();

        for (Student student : allStudents) {
            if (student.isApproved()) {
                approvedStudents.add(student);
            }
        }
        return approvedStudents;
    }

    @GetMapping("/ScheduleSiteVisit")
    public String showScheduleSiteVisit(@RequestParam(value = "city", required = false) String city, Model model) {
        List<String> cities = tutorService.getAllCitiesWithStudentsAndProviders(city);

        // Fetch dates for each city from the SiteVisit table
        Map<String, List<String>> datesByCity = new HashMap<>();
        for (String cityName : cities) {
            List<String> dates = siteVisitService.getDatesByCity(cityName);
            datesByCity.put(cityName, dates);
        }

        model.addAttribute("datesByCity", datesByCity);
        model.addAttribute("cities", cities);
        return "ViewSiteVisitStudents";
    }

    @GetMapping("/SearchCity")
    @ResponseBody
    public List<String> searchCity(@RequestParam("city") String city) {
        List<String> cities = providerService.searchCities(city);
        return cities;
    }

    @GetMapping("/ScheduleSiteVisitForm")
    public String showScheduleSiteVisitForm(@RequestParam("city") String city, Model model) {
        model.addAttribute("city", city);
        return "TutorAvailability";
    }

    @PostMapping("/submitAvailability")
    public String submitAvailability(@RequestParam Map<String, String> timeSlots) {
        String cityString = timeSlots.get("timeSlots[1].city");

        // Loop through the time slots and convert the data into TutorTimeSlot objects
        for (int i = 0; i < timeSlots.size() / 4; i++) {
            String dateString = timeSlots.get("timeSlots[" + i + "].date");
            String startTimeString = timeSlots.get("timeSlots[" + i + "].startTime");
            String endTimeString = timeSlots.get("timeSlots[" + i + "].endTime");
            String cityString1 = timeSlots.get("timeSlots[" + i + "].city");

            TutorTimeSlot tutorTimeSlot = new TutorTimeSlot(dateString, startTimeString, endTimeString, cityString1);
            Tutor tutor = tutorService.findTutorById(1);
            tutorTimeSlot.setTutor(tutor);
            siteVisitService.saveTutorTimeSlot(tutorTimeSlot);
        }

        // Fetch students and providers in the same city
        List<Student> students = studentService.findByCity(cityString);
        List<Provider> providers = providerService.findByCity(cityString);

        // Send email notifications
        String subject = "Pick Your Availability for Site Visit";
        for (Student student : students) {
            studentService.sendEmail(student.getEmail(), subject, "Dear " + student.getFirstname() +",\n\nA new site visit is being scheduled in " + cityString +
                    ". Please log in and pick your availability.\n\nThank you!");
        }
        for (Provider provider : providers) {
            studentService.sendEmail(provider.getEmail(), subject, "Dear " + provider.getEmail() +",\n\nA new site visit is being scheduled in " + cityString +
                    ". Please log in and pick your availability.\n\nThank you!");
        }

        return "redirect:/TutorDashboard";
    }

    @GetMapping("/ViewAvailability")
    public String viewAvailability(@RequestParam("city") String city, Model model) {
        List<TutorTimeSlot> tutorTimeSlots = siteVisitService.findTutorAvailabilityByCity(city);
        Map<String, List<TutorTimeSlot>> slotsByDate = tutorTimeSlots.stream().collect(Collectors.groupingBy(TutorTimeSlot::getDate));
        model.addAttribute("slotsByDate", slotsByDate);
        model.addAttribute("city", city);
        return "ViewAvailability";
    }

    @PostMapping("/DeleteAvailability")
    public String deleteAvailability(@RequestParam("date") String date, @RequestParam("city") String city) {
        siteVisitService.deleteTutorAvailabilityByCityAndDate(city, date);
        return "redirect:/ViewAvailability?city=" + city;
    }

    @GetMapping("/GenerateSchedule")
    public String generateSchedule(@RequestParam("city") String city, Model model) {
        siteVisitService.generateScheduleForCity(city);
        List<SiteVisit> allSiteVisits = siteVisitService.getSiteVisitsByCity(city); // Fetch all site visits for the city
        model.addAttribute("schedule", allSiteVisits);
        model.addAttribute("city", city);
        return "ScheduleView";
    }

    @GetMapping("/ViewRoute")
    public String viewRoute(@RequestParam("date") String date, @RequestParam("city") String city, Model model) {
        // Fetch site visits filtered by date and city
        List<SiteVisit> siteVisits = siteVisitService.findSiteVisitsByDateAndCity(date, city);

        // Extract students from the site visits
        List<Student> scheduledStudents = siteVisits.stream()
                .map(SiteVisit::getStudent)
                .collect(Collectors.toList());

        // Pass data to the model
        model.addAttribute("scheduledStudents", scheduledStudents);
        model.addAttribute("city", city);
        model.addAttribute("date", date);

        return "ViewStudentMapwithrouting";
    }

    @GetMapping("/getScheduledStudents")
    @ResponseBody
    public List<Map<String, Object>> getScheduledStudents(@RequestParam("date") String date, @RequestParam("city") String city) {
        // Fetch site visits by date, city, and order by startTime
        List<SiteVisit> siteVisits = siteVisitService.findSiteVisitsByDateAndCityOrderedByTime(date, city);

        // Extract required data and return as JSON
        List<Map<String, Object>> studentsData = new ArrayList<>();
        for (SiteVisit siteVisit : siteVisits) {
            Map<String, Object> data = new HashMap<>();
            data.put("firstname", siteVisit.getStudent().getFirstname());
            data.put("lastname", siteVisit.getStudent().getLastname());
            data.put("startTime", siteVisit.getStartTime());
            data.put("endTime", siteVisit.getEndTime());
            data.put("postcode", siteVisit.getProvider().getProviderForms().get(0).getPostcode());
            data.put("nameoforganisation", siteVisit.getProvider().getProviderForms().get(0).getNameoforganisation());
            studentsData.add(data);
        }
        return studentsData;
    }

    @GetMapping("/CalendarView")
    public String calendarView() {
        return "CalendarView";
    }

    @GetMapping("/getScheduleForCalendar")
    @ResponseBody
    public List<Map<String, String>> getScheduleForCalendar() {
        // Fetch all site visits from the database
        List<SiteVisit> siteVisits = siteVisitService.findAllSiteVisitsOrderedByDateAndTime();

        // Convert to FullCalendar event format
        List<Map<String, String>> calendarEvents = new ArrayList<>();
        for (SiteVisit siteVisit : siteVisits) {
            Map<String, String> event = new HashMap<>();
            event.put("title", "Site Visit: " + siteVisit.getProvider().getProviderForms().get(0).getNameoforganisation()
                    + " (" + siteVisit.getStudent().getFirstname() + ")");
            event.put("Postcode", siteVisit.getProvider().getProviderForms().get(0).getPostcode()); // Optional data
            event.put("start", siteVisit.getDate() + "T" + siteVisit.getStartTime() + ":00"); // Include seconds
            event.put("end", siteVisit.getDate() + "T" + siteVisit.getEndTime() + ":00");
            calendarEvents.add(event);
        }
        return calendarEvents;
    }

    @PostMapping("/createMeeting")
    @ResponseBody
    public String createMeeting(@RequestBody Map<String, Object> meetingDetails) {
        // Extract meeting details from the request
        String title = (String) meetingDetails.get("title");
        String start = (String) meetingDetails.get("start");
        String end = (String) meetingDetails.get("end");

        Map<String, Object> extendedProps = (Map<String, Object>) meetingDetails.get("extendedProps");
        int studentId = Integer.parseInt(extendedProps.get("studentId").toString());

        Student student = studentService.findById(studentId);
        Provider provider = student.getProvider();

        // Create and save the OnlineMeeting entity
        OnlineMeeting onlineMeeting = new OnlineMeeting();
        onlineMeeting.setTitle(title);
        onlineMeeting.setStart(start);
        onlineMeeting.setEnd(end);
        onlineMeeting.setStudent(student);
        onlineMeeting.setProvider(provider);

        onlineMeetingRepo.save(onlineMeeting); // Save the meeting in the database

        String studentEmail = student.getEmail();
        String providerEmail = provider.getEmail();

        String emailBody = String.format(
                "Dear %s,\n\nAn online meeting has been scheduled.\n\n" +
                        "Title: %s\nDate: %s\nStart Time: %s\nEnd Time: %s\n\n" +
                        "Kind regards,\nUniversity of Leicester Placements Team",
                "%s",
                title, start.substring(0, 10), ZonedDateTime.parse(start).format(DateTimeFormatter.ofPattern("HH:mm")),
                ZonedDateTime.parse(end).format(DateTimeFormatter.ofPattern("HH:mm"))
        );

        studentService.sendEmail(
                studentEmail, "New Online Meeting Scheduled",
                String.format(emailBody, student.getFirstname() + " " + student.getLastname())
        );

        studentService.sendEmail(
                providerEmail, "New Online Meeting Scheduled",
                String.format(emailBody, provider.getProviderForms().get(0).getNameoforganisation())
        );

        return "Online Meeting successfully created!";
    }

    @GetMapping("/getOnlineMeetings")
    @ResponseBody
    public List<Map<String, Object>> getOnlineMeetings() {
        // Fetch all meetings from the database
        List<OnlineMeeting> meetings = (List<OnlineMeeting>) onlineMeetingRepo.findAll();

        // Convert meetings into FullCalendar-compatible format
        List<Map<String, Object>> formattedMeetings = new ArrayList<>();
        for (OnlineMeeting meeting : meetings) {
            Map<String, Object> event = new HashMap<>();
            event.put("id", meeting.getOMId());
            event.put("title", meeting.getTitle());
            event.put("start", meeting.getStart());
            event.put("end", meeting.getEnd());
            event.put("extendedProps", Map.of(
                    "meetingType", "Online",
                    "studentId", meeting.getStudent().getStudentID(),
                    "studentName", meeting.getStudent().getFirstname() + " " + meeting.getStudent().getLastname(),
                    "providerId", meeting.getProvider().getProviderId(),
                    "providerName", meeting.getProvider().getProviderForms().get(0).getNameoforganisation()
            ));
            formattedMeetings.add(event);
        }

        return formattedMeetings;
    }

    @DeleteMapping("/deleteMeeting")
    @ResponseBody
    public ResponseEntity<String> deleteMeeting(@RequestParam int meetingId) {
        Optional<OnlineMeeting> optionalMeeting = onlineMeetingRepo.findById(meetingId);

        if (optionalMeeting.isPresent()) {
            OnlineMeeting meeting = optionalMeeting.get();

            // Get student and provider details
            Student student = meeting.getStudent();
            Provider provider = meeting.getProvider();

            String studentEmail = student.getEmail();
            String providerEmail = provider.getEmail();

            String emailSubject = "Online Meeting Cancelled";
            String emailBody = String.format(
                    "Dear %s,\n\nYour online meeting has been cancelled.\n\n" +
                            "Title: %s\nDate: %s\nStart Time: %s\nEnd Time: %s\n\n" +
                            "Kind regards,\nUniversity of Leicester Placements Team",
                    "%s",
                    meeting.getTitle(), meeting.getStart().substring(0, 10),
                    ZonedDateTime.parse(meeting.getStart()).format(DateTimeFormatter.ofPattern("HH:mm")),
                    ZonedDateTime.parse(meeting.getEnd()).format(DateTimeFormatter.ofPattern("HH:mm"))
            );

            // Send cancellation emails
            studentService.sendEmail(
                    studentEmail, emailSubject,
                    String.format(emailBody, student.getFirstname() + " " + student.getLastname())
            );

            studentService.sendEmail(
                    providerEmail, emailSubject,
                    String.format(emailBody, provider.getProviderForms().get(0).getNameoforganisation())
            );

            // Delete the meeting from the database
            onlineMeetingRepo.delete(meeting);

            return ResponseEntity.ok("Online Meeting successfully deleted!");
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Meeting not found");
        }
    }



}