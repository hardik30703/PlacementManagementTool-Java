package com.example.MCompProject.Service;

import com.example.MCompProject.Domain.*;
import com.example.MCompProject.Repository.SiteVisitRepo;
import com.example.MCompProject.Repository.TutorFormRepo;
import com.example.MCompProject.Repository.TutorRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;

@Service
public class TutorService {

    @Autowired
    private TutorRepo tutorRepo;

    @Autowired
    private TutorFormRepo tutorFormRepo;

    @Autowired
    private StudentService studentService;

    @Autowired
    private ProviderService providerService;


    public Tutor findByUsername(String username) {
        return tutorRepo.findByUsername(username);
    }

    public Tutor findTutorById(int i) {
        return tutorRepo.findById(i).get();
    }

    // Form
    public void saveForm(TutorForm a) {
        tutorFormRepo.save(a);
    }

    // Method to compare student and provider forms and flag discrepancies
    public Map<String, String> compareForms(int studentId) {
        Student student = studentService.findById(studentId);
        StudentForm studentForm = student.getStudentForm();
        ProviderForm providerForm = student.getProviderForm();

        Map<String, String> discrepancies = new HashMap<>();

        if (studentForm != null && providerForm != null) {
            String studentFullName = studentForm.getFirstname() + " " + studentForm.getLastname();
            if (!studentFullName.equals(providerForm.getNameofstudent())) {
                discrepancies.put("studentFullName", "Student name discrepancy: " + studentFullName + " (Student Form) vs. " + providerForm.getNameofstudent() + " (Provider Form)");
            }

            if (!studentForm.getNameoforganisation().equals(providerForm.getNameoforganisation())) {
                discrepancies.put("nameoforganisation", "Organisation name discrepancy: " + studentForm.getNameoforganisation() + " (Student Form) vs. " + providerForm.getNameoforganisation() + " (Provider Form)");
            }

            if (!studentForm.getAddressofplacement().equals(providerForm.getAddress())) {
                discrepancies.put("addressofplacement", "Placement address discrepancy: " + studentForm.getAddressofplacement() + " (Student Form) vs. " + providerForm.getAddress() + " (Provider Form)");
            }

            if (!studentForm.getPostcode().equals(providerForm.getPostcode())) {
                discrepancies.put("postcode", "Postcode discrepancy: " + studentForm.getPostcode() + " (Student Form) vs. " + providerForm.getPostcode() + " (Provider Form)");
            }

            if (!studentForm.getWebaddress().equals(providerForm.getWebaddress())) {
                discrepancies.put("webaddress", "Web address discrepancy: " + studentForm.getWebaddress() + " (Student Form) vs. " + providerForm.getWebaddress() + " (Provider Form)");
            }

            if (!studentForm.getContactname().equals(providerForm.getNameofcontact())) {
                discrepancies.put("contactname", "Contact name discrepancy: " + studentForm.getContactname() + " (Student Form) vs. " + providerForm.getNameofcontact() + " (Provider Form)");
            }

            if (!studentForm.getContactjobtitle().equals(providerForm.getContactjobtitle())) {
                discrepancies.put("contactjobtitle", "Contact job title discrepancy: " + studentForm.getContactjobtitle() + " (Student Form) vs. " + providerForm.getContactjobtitle() + " (Provider Form)");
            }

            if (!studentForm.getContactemail().equals(providerForm.getContactemail())) {
                discrepancies.put("contactemail", "Contact email discrepancy: " + studentForm.getContactemail() + " (Student Form) vs. " + providerForm.getContactemail() + " (Provider Form)");
            }

            if (!studentForm.getContacttelephonenumber().equals(providerForm.getContacttelephonenumber())) {
                discrepancies.put("contacttelephonenumber", "Contact telephone number discrepancy: " + studentForm.getContacttelephonenumber() + " (Student Form) vs. " + providerForm.getContacttelephonenumber() + " (Provider Form)");
            }

            if (!studentForm.getRoletitle().equals(providerForm.getJobtitle())) {
                discrepancies.put("jobtitle", "Role title discrepancy: " + studentForm.getRoletitle() + " (Student Form) vs. " + providerForm.getJobtitle() + " (Provider Form)");
            }

            if (!studentForm.getRolestartdate().equals(providerForm.getRolestartdate())) {
                discrepancies.put("rolestartdate", "Role start date discrepancy: " + studentForm.getRolestartdate() + " (Student Form) vs. " + providerForm.getRolestartdate() + " (Provider Form)");
            }

            if (!studentForm.getRoleenddate().equals(providerForm.getRoleenddate())) {
                discrepancies.put("roleenddate", "Role end date discrepancy: " + studentForm.getRoleenddate() + " (Student Form) vs. " + providerForm.getRoleenddate() + " (Provider Form)");
            }

            if (studentForm.getWorkinghours() != (providerForm.getWorkinghours())) {
                discrepancies.put("workinghours", "Working hours per week discrepancy: " + studentForm.getWorkinghours() + " (Student Form) vs. " + providerForm.getWorkinghours() + " (Provider Form)");
            }

            if (!studentForm.getProbationperiod().equals(providerForm.getProbationperiod())) {
                discrepancies.put("probationperiod", "Probation period discrepancy: " + studentForm.getProbationperiod() + " (Student Form) vs. " + providerForm.getProbationperiod() + " (Provider Form)");
            }

            if (!studentForm.getWorkfromhome().equals(providerForm.getWorkfromhome())) {
                discrepancies.put("workfromhome", "Work from home discrepancy: " + studentForm.getWorkfromhome() + " (Student Form) vs. " + providerForm.getWorkfromhome() + " (Provider Form)");
            }

            if (!studentForm.getDifferentlocation().equals(providerForm.getWorkingfromdifferentsites())) {
                discrepancies.put("differentlocation", "Different location discrepancy: " + studentForm.getDifferentlocation() + " (Student Form) vs. " + providerForm.getWorkingfromdifferentsites() + " (Provider Form)");
            }

            if (!studentForm.getTraveloverseas().equals(providerForm.getTraveloutsideuk())) {
                discrepancies.put("traveloverseas", "Travel overseas discrepancy: " + studentForm.getTraveloverseas() + " (Student Form) vs. " + providerForm.getTraveloutsideuk() + " (Provider Form)");
            }
        }

        return discrepancies;
    }

    public boolean resolveFlag(String field, int studentID, String source) {
        Student student = studentService.findById(studentID);
        StudentForm studentForm = student.getStudentForm();
        ProviderForm providerForm = student.getProviderForm();

        if (studentForm == null || providerForm == null) {
            return false;
        }

        switch (field) {
            case "studentFullName":
                if (source.equals("student")) {
                    providerForm.setNameofstudent(studentForm.getFirstname() + " " + studentForm.getLastname());
                } else {
                    studentForm.setFirstname(providerForm.getNameofstudent().split(" ")[0]);
                    studentForm.setLastname(providerForm.getNameofstudent().split(" ")[1]);
                }
                break;

            case "addressofplacement":
                if (source.equals("student")) {
                    providerForm.setAddress(studentForm.getAddressofplacement());
                } else {
                    studentForm.setAddressofplacement(providerForm.getAddress());
                }
                break;

            case "postcode":
                if (source.equals("student")) {
                    providerForm.setPostcode(studentForm.getPostcode());
                } else {
                    studentForm.setPostcode(providerForm.getPostcode());
                }
                break;

            case "webaddress":
                if (source.equals("student")) {
                    providerForm.setWebaddress(studentForm.getWebaddress());
                } else {
                    studentForm.setWebaddress(providerForm.getWebaddress());
                }
                break;

            case "contactname":
                if (source.equals("student")) {
                    providerForm.setNameofcontact(studentForm.getContactname());
                } else {
                    studentForm.setContactname(providerForm.getNameofcontact());
                }
                break;

            case "contactjobtitle":
                if (source.equals("student")) {
                    providerForm.setContactjobtitle(studentForm.getContactjobtitle());
                } else {
                    studentForm.setContactjobtitle(providerForm.getContactjobtitle());
                }
                break;

            case "contactemail":
                if (source.equals("student")) {
                    providerForm.setContactemail(studentForm.getContactemail());
                } else {
                    studentForm.setContactemail(providerForm.getContactemail());
                }
                break;

            case "contacttelephonenumber":
                if (source.equals("student")) {
                    providerForm.setContacttelephonenumber(studentForm.getContacttelephonenumber());
                } else {
                    studentForm.setContacttelephonenumber(providerForm.getContacttelephonenumber());
                }
                break;

            case "jobtitle":
                if (source.equals("student")) {
                    providerForm.setJobtitle(studentForm.getRoletitle());
                } else {
                    studentForm.setRoletitle(providerForm.getJobtitle());
                }
                break;

            case "rolestartdate":
                if (source.equals("student")) {
                    providerForm.setRolestartdate(studentForm.getRolestartdate());
                } else {
                    studentForm.setRolestartdate(providerForm.getRolestartdate());
                }
                break;

            case "roleenddate":
                if (source.equals("student")) {
                    providerForm.setRoleenddate(studentForm.getRoleenddate());
                } else {
                    studentForm.setRoleenddate(providerForm.getRoleenddate());
                }
                break;

            case "workinghours":
                if (source.equals("student")) {
                    providerForm.setWorkinghours(studentForm.getWorkinghours());
                } else {
                    studentForm.setWorkinghours(providerForm.getWorkinghours());
                }
                break;

            case "probationperiod":
                if (source.equals("student")) {
                    providerForm.setProbationperiod(studentForm.getProbationperiod());
                } else {
                    studentForm.setProbationperiod(providerForm.getProbationperiod());
                }
                break;

            case "workfromhome":
                if (source.equals("student")) {
                    providerForm.setWorkfromhome(studentForm.getWorkfromhome());
                } else {
                    studentForm.setWorkfromhome(providerForm.getWorkfromhome());
                }
                break;

            case "differentlocation":
                if (source.equals("student")) {
                    providerForm.setWorkingfromdifferentsites(studentForm.getDifferentlocation());
                } else {
                    studentForm.setDifferentlocation(providerForm.getWorkingfromdifferentsites());
                }
                break;

            case "traveloverseas":
                if (source.equals("student")) {
                    providerForm.setTraveloutsideuk(studentForm.getTraveloverseas());
                } else {
                    studentForm.setTraveloverseas(providerForm.getTraveloutsideuk());
                }
                break;

            default:
                return false;
        }

        studentService.saveStudentForm(studentForm);
        providerService.saveProviderForm(providerForm);
        return true;
    }

    public List<String> getAllCitiesWithStudentsAndProviders(String cityFilter) {
        List<String> cities = new ArrayList<>();

        for (Student student : studentService.getAllStudents()) {
            if (student.isApproved()) {
                ProviderForm providerForm = student.getProvider().getProviderForms().get(0);
                String city = providerForm.getCity();
                if (city != null && (cityFilter == null || cityFilter.isEmpty() || city.equalsIgnoreCase(cityFilter))) {
                    if (!cities.contains(city)) {
                        cities.add(city);
                    }
                }
            }
        }

        // Sort the cities alphabetically
        Collections.sort(cities);

        return cities;
    }

    public List<Student> getStudentsByCity(String city) {
        List<Student> students = new ArrayList<>();
        for (Student student : studentService.getAllStudents()) {
            if (student.isApproved()) {
                ProviderForm providerForm = student.getProvider().getProviderForms().get(0);
                if (providerForm.getCity() != null && city.equalsIgnoreCase(providerForm.getCity())) {
                    students.add(student);
                }
            }
        }
        return students;
    }




}



