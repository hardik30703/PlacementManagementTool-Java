package com.example.MCompProject.Controller;

import com.example.MCompProject.Domain.*;
import com.example.MCompProject.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
public class StudentController {

    @Autowired
    StudentService studentService;

    @Autowired
    SiteVisitService siteVisitService;

    @Autowired
    ProviderService providerService;

    @GetMapping("/StudentDashboard")
    public String studentDashboard() {
        return "StudentDashboard";
    }

    @GetMapping("/StudentTimeline")
    public String studentTimeline(Model model, HttpSession session) {
        int studentId = (int) session.getAttribute("studentId"); // Get the student ID from the session
        Student student = studentService.findById(studentId); // Fetch the student using the student ID

        if (student != null && student.getStudentForm() != null) {
            model.addAttribute("status", student.getStudentForm().getStatus());
        } else {
            model.addAttribute("status", "No status available."); // If no status, display a default message
        }
        return "StudentTimeline";
    }

    @GetMapping("/UserProfile")
    public String getUserProfile(HttpSession session, Model model) {
        // Fetch student ID from session
        int studentId = (Integer) session.getAttribute("studentId");
        Student student = studentService.findById(studentId);

        if (student != null) {
            model.addAttribute("student", student);
            return "UserProfile";
        }

        return "redirect:/StudentLogin";
    }

    @PostMapping("/UpdateProfile")
    public String updateProfile(@RequestParam String firstname,
                                @RequestParam String lastname,
                                @RequestParam String email,
                                HttpSession session, Model model) {
        int studentId = (Integer) session.getAttribute("studentId");
        Student student = studentService.findById(studentId);

        if (student != null) {
            // Update student details
            student.setFirstname(firstname);
            student.setLastname(lastname);
            student.setEmail(email);
            studentService.save(student);

            model.addAttribute("student", student);
            model.addAttribute("successMessage", "Profile updated successfully!");
            return "UserProfile";
        }

        return "redirect:/StudentLogin";
    }

    @GetMapping("/StudentForm")
    public String showStudentForm(Model model, HttpSession session) {
        int studentId = (int) session.getAttribute("studentId");
        Student student = studentService.findById(studentId);
        StudentForm savedStudentForm = studentService.findByStudentId(studentId);

        // Check if the student is blocked
        if (student.isBlocked()) {
            session.setAttribute("warningMessage", "You have been blocked from submitting a student form due to being rejected twice.");
            return "redirect:/StudentDashboard";
        }

        if (savedStudentForm != null) {
            model.addAttribute("studentForm", savedStudentForm);
            model.addAttribute("isSubmitted", savedStudentForm.isSubmitted());
        } else {
            model.addAttribute("studentForm", new StudentForm());
            model.addAttribute("isSubmitted", false);
        }

        return "StudentForm";
    }


    @PostMapping("/StudentForm")
    public String submitStudentForm(@RequestParam String firstname, @RequestParam String lastname,
                                    @RequestParam int studentnumber, @RequestParam String studentemail,
                                    @RequestParam String programme, @RequestParam String department,
                                    @RequestParam String telephonenumber, @RequestParam String internationalstudent,
                                    @RequestParam(required = false) String studentvisa, @RequestParam String nameoforganisation,
                                    @RequestParam String addressofplacement, @RequestParam String postcode,
                                    @RequestParam String webaddress, @RequestParam String contactname,
                                    @RequestParam String contactjobtitle, @RequestParam String contactemail,
                                    @RequestParam String contacttelephonenumber, @RequestParam String roletitle,
                                    @RequestParam String rolestartdate, @RequestParam String roleenddate,
                                    @RequestParam double workinghours, @RequestParam String probationperiod,
                                    @RequestParam(required = false) String lengthofprobationperiod, @RequestParam int salary, @RequestParam String source,
                                    @RequestParam String informedplacementprovider, @RequestParam String roledescription,
                                    @RequestParam String workfromhome, @RequestParam(required = false) String howremotely,
                                    @RequestParam(required = false) String whyworkfromhome, @RequestParam String commute,
                                    @RequestParam String differentlocation, @RequestParam(required = false) String details, @RequestParam String traveloverseas,
                                    @RequestParam(required = false) String travelguidance, @RequestParam(required = false) String traveltowork,
                                    @RequestParam String accommodationarrangements, @RequestParam(required = false) String foreignoffice,
                                    @RequestParam(required = false) String risks, @RequestParam String precautionarymeasures,
                                    @RequestParam String safezone, @RequestParam(required = false) String healthinsurancecard,
                                    @RequestParam String adjustments, @RequestParam(required = false) String travelapplication,
                                    @RequestParam(required = false) String riskassessmentescalation, @RequestParam String name,
                                    @RequestParam String signature, HttpSession session) {


        int studentId = (int) session.getAttribute("studentId"); //gets the StudentID from the session
        Student student = studentService.findById(studentId);

        StudentForm studentForm = studentService.findByStudentId(studentId);

        if (studentForm == null) {
            studentForm = new StudentForm();
        }

        studentForm.setFirstname(firstname);
        studentForm.setLastname(lastname);
        studentForm.setStudentnumber(studentnumber);
        studentForm.setStudentemail(studentemail);
        studentForm.setProgramme(programme);
        studentForm.setDepartment(department);
        studentForm.setTelephonenumber(telephonenumber);
        studentForm.setInternationalstudent(internationalstudent);
        studentForm.setStudentvisa(studentvisa);
        studentForm.setNameoforganisation(nameoforganisation);
        studentForm.setAddressofplacement(addressofplacement);
        studentForm.setPostcode(postcode.toUpperCase());
        studentForm.setWebaddress(webaddress);
        studentForm.setContactname(contactname);
        studentForm.setContactjobtitle(contactjobtitle);
        studentForm.setContactemail(contactemail);
        studentForm.setContacttelephonenumber(contacttelephonenumber);
        studentForm.setRoletitle(roletitle);
        studentForm.setRolestartdate(rolestartdate);
        studentForm.setRoleenddate(roleenddate);
        studentForm.setWorkinghours(workinghours);
        studentForm.setProbationperiod(probationperiod);
        studentForm.setLengthofprobationperiod(lengthofprobationperiod);
        studentForm.setSalary(salary);
        studentForm.setSource(source);
        studentForm.setInformedplacementprovider(informedplacementprovider);
        studentForm.setRoledescription(roledescription);
        studentForm.setWorkfromhome(workfromhome);
        studentForm.setHowremotely(howremotely);
        studentForm.setWhyworkfromhome(whyworkfromhome);
        studentForm.setCommute(commute);
        studentForm.setDifferentlocation(differentlocation);
        studentForm.setDetails(details);
        studentForm.setTraveloverseas(traveloverseas);
        studentForm.setTravelguidance(travelguidance);
        studentForm.setTraveltowork(traveltowork);
        studentForm.setAccommodationarrangements(accommodationarrangements);
        studentForm.setForeignoffice(foreignoffice);
        studentForm.setRisks(risks);
        studentForm.setPrecautionarymeasures(precautionarymeasures);
        studentForm.setSafezone(safezone);
        studentForm.setHealthinsurancecard(healthinsurancecard);
        studentForm.setAdjustments(adjustments);
        studentForm.setTravelapplication(travelapplication);
        studentForm.setRiskassessmentescalation(riskassessmentescalation);
        studentForm.setName(name);
        studentForm.setSignature(signature);
        studentForm.setDate(LocalDate.now().toString());

        studentForm.setStudent(student);
        studentForm.setSubmitted(true);
        studentForm.setStatus("Form submitted, awaiting provider form submission.");

        student.setApproved(false);

        studentService.saveStudentForm(studentForm);

        // Generate provider credentials
        String providerUsername = "provider_" + UUID.randomUUID().toString().substring(0, 8);
        String providerPassword = UUID.randomUUID().toString().substring(0, 8);
        String providerEmail = contactemail; // Get provider email from the form

        Provider provider = providerService.findByEmail(providerEmail);
        if (provider == null) {
            provider = new Provider();
            provider.setUsername(providerUsername);
            provider.setPassword(providerPassword);
            provider.setEmail(providerEmail);

            providerService.saveProvider(provider);

            // Send email to provider with credentials
            String content = "A new student form requires your attention. Please log in to complete it." +
                    "\n\n" + "Username: " + providerUsername + "\nPassword: " + providerPassword + "\nStudent Username: " + student.getUsername();
            studentService.sendEmail(providerEmail, "Your Login Credentials", content);
        } else {
            // If provider exists, send notification email
            String content = "A new student form requires your attention. Please log in to complete it." +
                    "\n\n" + "Username: " + provider.getUsername() + "\nPassword: " + provider.getPassword() + "\nStudent Username: " + student.getUsername();
            studentService.sendEmail(providerEmail, "Student Form Needs Attention", content);
        }

        ProviderForm existingProviderForm = student.getProviderForm();
        if (existingProviderForm == null) {
            existingProviderForm = new ProviderForm();
            existingProviderForm.setNameoforganisation(nameoforganisation);
            existingProviderForm.setAddress(addressofplacement);
            existingProviderForm.setPostcode(postcode.toUpperCase());
            existingProviderForm.setWebaddress(webaddress);
            existingProviderForm.setNameofstudent(firstname + " " + lastname);
            existingProviderForm.setNameofcontact(contactname);
            existingProviderForm.setContactjobtitle(contactjobtitle);
            existingProviderForm.setContactemail(contactemail);
            existingProviderForm.setContacttelephonenumber(contacttelephonenumber);
            existingProviderForm.setJobtitle(roletitle);
            existingProviderForm.setRolestartdate(rolestartdate);
            existingProviderForm.setRoleenddate(roleenddate);
            existingProviderForm.setWorkinghours(workinghours);
            existingProviderForm.setProbationperiod(probationperiod);

            existingProviderForm.setProvider(provider);
            existingProviderForm.setStudent(student);
            providerService.saveProviderForm(existingProviderForm);
        }

        student.setProvider(provider);
        studentService.save(student);

        return "redirect:/StudentDashboard";
    }

    @PostMapping("/saveStudentForm")
    public String saveStudentForm(@RequestParam(required = false) String firstname, @RequestParam(required = false) String lastname,
                                  @RequestParam(required = false) Integer studentnumber, @RequestParam(required = false) String studentemail,
                                  @RequestParam(required = false) String programme, @RequestParam(required = false) String department,
                                  @RequestParam(required = false) String telephonenumber, @RequestParam(required = false) String internationalstudent,
                                  @RequestParam(required = false) String studentvisa, @RequestParam(required = false) String nameoforganisation,
                                  @RequestParam(required = false) String addressofplacement, @RequestParam(required = false) String postcode,
                                  @RequestParam(required = false) String webaddress, @RequestParam(required = false) String contactname,
                                  @RequestParam(required = false) String contactjobtitle, @RequestParam(required = false) String contactemail,
                                  @RequestParam(required = false) String contacttelephonenumber, @RequestParam(required = false) String roletitle,
                                  @RequestParam(required = false) String rolestartdate, @RequestParam(required = false) String roleenddate,
                                  @RequestParam(required = false) Double workinghours, @RequestParam(required = false) String probationperiod,
                                  @RequestParam(required = false) String lengthofprobationperiod, @RequestParam(required = false) Integer salary, @RequestParam(required = false) String source,
                                  @RequestParam(required = false) String informedplacementprovider, @RequestParam(required = false) String roledescription,
                                  @RequestParam(required = false) String workfromhome, @RequestParam(required = false) String howremotely,
                                  @RequestParam(required = false) String whyworkfromhome, @RequestParam(required = false) String commute,
                                  @RequestParam(required = false) String differentlocation, @RequestParam(required = false) String details, @RequestParam(required = false) String traveloverseas,
                                  @RequestParam(required = false) String travelguidance, @RequestParam(required = false) String traveltowork,
                                  @RequestParam(required = false) String accommodationarrangements, @RequestParam(required = false) String foreignoffice,
                                  @RequestParam(required = false) String risks, @RequestParam(required = false) String precautionarymeasures,
                                  @RequestParam(required = false) String safezone, @RequestParam(required = false) String healthinsurancecard,
                                  @RequestParam(required = false) String adjustments, @RequestParam(required = false) String travelapplication,
                                  @RequestParam(required = false) String riskassessmentescalation, @RequestParam(required = false) String name,
                                  @RequestParam(required = false) String signature, HttpSession session) {

        int studentId = (int) session.getAttribute("studentId");
        Student student = studentService.findById(studentId);

        StudentForm studentForm = studentService.findByStudentId(studentId);

        if (studentForm == null) {
            studentForm = new StudentForm();
        }

        if (firstname != null) studentForm.setFirstname(firstname);
        if (lastname != null) studentForm.setLastname(lastname);
        if (studentnumber != null) studentForm.setStudentnumber(studentnumber);
        if (studentemail != null) studentForm.setStudentemail(studentemail);
        if (programme != null) studentForm.setProgramme(programme);
        if (department != null) studentForm.setDepartment(department);
        if (telephonenumber != null) studentForm.setTelephonenumber(telephonenumber);
        if (internationalstudent != null) studentForm.setInternationalstudent(internationalstudent);
        if (studentvisa != null) studentForm.setStudentvisa(studentvisa);
        if (nameoforganisation != null) studentForm.setNameoforganisation(nameoforganisation);
        if (addressofplacement != null) studentForm.setAddressofplacement(addressofplacement);
        if (postcode != null) studentForm.setPostcode(postcode);
        if (webaddress != null) studentForm.setWebaddress(webaddress);
        if (contactname != null) studentForm.setContactname(contactname);
        if (contactjobtitle != null) studentForm.setContactjobtitle(contactjobtitle);
        if (contactemail != null) studentForm.setContactemail(contactemail);
        if (contacttelephonenumber != null) studentForm.setContacttelephonenumber(contacttelephonenumber);
        if (roletitle != null) studentForm.setRoletitle(roletitle);
        if (rolestartdate != null) studentForm.setRolestartdate(rolestartdate);
        if (roleenddate != null) studentForm.setRoleenddate(roleenddate);
        if (workinghours != null) studentForm.setWorkinghours(workinghours);
        if (probationperiod != null) studentForm.setProbationperiod(probationperiod);
        if (lengthofprobationperiod != null) studentForm.setLengthofprobationperiod(lengthofprobationperiod);
        if (salary != null) studentForm.setSalary(salary);
        if (source != null) studentForm.setSource(source);
        if (informedplacementprovider != null) studentForm.setInformedplacementprovider(informedplacementprovider);
        if (roledescription != null) studentForm.setRoledescription(roledescription);
        if (workfromhome != null) studentForm.setWorkfromhome(workfromhome);
        if (howremotely != null) studentForm.setHowremotely(howremotely);
        if (whyworkfromhome != null) studentForm.setWhyworkfromhome(whyworkfromhome);
        if (commute != null) studentForm.setCommute(commute);
        if (differentlocation != null) studentForm.setDifferentlocation(differentlocation);
        if (details != null) studentForm.setDetails(details);
        if (traveloverseas != null) studentForm.setTraveloverseas(traveloverseas);
        if (travelguidance != null) studentForm.setTravelguidance(travelguidance);
        if (traveltowork != null) studentForm.setTraveltowork(traveltowork);
        if (accommodationarrangements != null) studentForm.setAccommodationarrangements(accommodationarrangements);
        if (foreignoffice != null) studentForm.setForeignoffice(foreignoffice);
        if (risks != null) studentForm.setRisks(risks);
        if (precautionarymeasures != null) studentForm.setPrecautionarymeasures(precautionarymeasures);
        if (safezone != null) studentForm.setSafezone(safezone);
        if (healthinsurancecard != null) studentForm.setHealthinsurancecard(healthinsurancecard);
        if (adjustments != null) studentForm.setAdjustments(adjustments);
        if (travelapplication != null) studentForm.setTravelapplication(travelapplication);
        if (riskassessmentescalation != null) studentForm.setRiskassessmentescalation(riskassessmentescalation);
        if (name != null) studentForm.setName(name);
        if (signature != null) studentForm.setSignature(signature);

        studentForm.setStudent(student);
        student.setApproved(false);

        studentService.save(student);
        studentService.saveStudentForm(studentForm);

        return "redirect:/StudentDashboard";
    }

    @GetMapping("/StudentViewAvailability")
    public String studentViewAvailability(HttpSession session, Model model) {
        int studentId = (int) session.getAttribute("studentId");

        Student student = studentService.findById(studentId);

        // Fetch the student's city
        String city = siteVisitService.findStudentCityById(studentId);
        List<TutorTimeSlot> tutorTimeSlots = siteVisitService.findTutorAvailabilityByCity(city);

        Tutor tutor = tutorTimeSlots.get(0).getTutor();

        Map<String, List<TutorTimeSlot>> slotsByDate = tutorTimeSlots.stream().collect(Collectors.groupingBy(TutorTimeSlot::getDate));
        model.addAttribute("slotsByDate", slotsByDate);
        model.addAttribute("city", city);
        model.addAttribute("tutor", tutor);
        model.addAttribute("student", student);
        return "StudentViewTutorAvailability";
    }

    @PostMapping("/SubmitStudentAvailability")
    public String submitStudentAvailability(@RequestParam("studentId") int studentId, @RequestParam("selectedSlots") List<Integer> selectedSlots) {
        siteVisitService.saveStudentAvailability(studentId, selectedSlots);
        return "redirect:/StudentViewAvailability";
    }


}

