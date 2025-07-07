package com.example.MCompProject.Controller;

import com.example.MCompProject.Domain.*;
import com.example.MCompProject.Service.SiteVisitService;
import com.example.MCompProject.Service.TutorService;
import com.example.MCompProject.Service.ProviderService;
import com.example.MCompProject.Service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class ProviderController {

    @Autowired
    ProviderService providerService;

    @Autowired
    StudentService studentService;

    @Autowired
    TutorService tutorService;

    @Autowired
    SiteVisitService siteVisitService;


    @GetMapping("/ProviderDashboard")
    public String providerDashboard() {
        return "ProviderDashboard";
    }

    @GetMapping("/ViewProviderStudents")
    public String showProviderStudents(@RequestParam(required = false) String username, Model model, HttpSession session) {
        int providerId = (int) session.getAttribute("providerId");
        Provider provider = providerService.findById(providerId);
        List<Student> students;

        if (username != null && !username.isEmpty()) {
            students = new ArrayList<>();
            Student student = studentService.findByUsername(username);
            if (student != null && student.getProvider().getProviderId() == providerId){
                students.add(student);
            }
        } else {
            students = providerService.findAllStudentsByProvider(provider);
        }

        model.addAttribute("students", students);
        return "ViewProviderStudents";
    }

    @GetMapping("/SearchProviderStudentsUsernames")
    @ResponseBody
    public List<String> searchProviderStudentsUsernames(@RequestParam String username, HttpSession session) {
        int providerId = (int) session.getAttribute("providerId");
        Provider provider = providerService.findById(providerId);

        List<Student> students = providerService.findAllStudentsByProvider(provider);
        List<String> usernames = new ArrayList<>();

        for (Student student : students) {
            if (student.getUsername().toLowerCase().contains(username.toLowerCase())) {
                usernames.add(student.getUsername());
            }
        }
        return usernames;
    }

    @GetMapping("/ViewProviderForm/{studentId}")
    public String viewProviderForm(@PathVariable int studentId, HttpSession session, Model model) {
        int providerId = (int) session.getAttribute("providerId");
        Provider provider = providerService.findById(providerId);
        Student student = studentService.findById(studentId);

        ProviderForm providerForm = providerService.findProviderFormByProviderAndStudent(provider, student);

        model.addAttribute("providerForm", providerForm);
        model.addAttribute("isSubmitted", providerForm.isSubmitted());
        model.addAttribute("studentId", studentId);
        return "ProviderForm";
    }

    @PostMapping("/ProviderForm")
    public String submitProviderForm(@RequestParam int studentId, @RequestParam String nameoforganisation, @RequestParam String address,
                                     @RequestParam String postcode, @RequestParam String webaddress, @RequestParam String activity,
                                     @RequestParam(required = false) String details, @RequestParam String nameofstudent, @RequestParam String nameofcontact,
                                     @RequestParam String contactjobtitle, @RequestParam String contactemail,
                                     @RequestParam String contacttelephonenumber, @RequestParam String jobtitle,
                                     @RequestParam String rolestartdate, @RequestParam String roleenddate,
                                     @RequestParam double workinghours, @RequestParam String probationperiod,
                                     @RequestParam(required = false) String probationperiodassessed, @RequestParam String expectation,
                                     @RequestParam String hazardsorrisks, @RequestParam(required = false) String detailsofrisksandhazards,
                                     @RequestParam String training, @RequestParam(required = false) String detailsoftraining, @RequestParam String workfromhome,
                                     @RequestParam(required = false) String frequencyworkfromhome, @RequestParam(required = false) String supportforworkfromhome,
                                     @RequestParam String workingfromdifferentsites, @RequestParam(required = false) String detailsoftravel,
                                     @RequestParam String traveloutsideuk, @RequestParam String risksatmainlocation,
                                     @RequestParam(required = false) String detailsofrisksandactions, @RequestParam String precautionarymeasures,
                                     @RequestParam(required = false) String detailsofprecautionarymeasures, @RequestParam String personalfactors,
                                     @RequestParam(required = false) String publicliabilityinsurance, @RequestParam(required = false) String nameofprovider,
                                     @RequestParam(required = false) String expirydate, @RequestParam(required = false) String publicclaim,
                                     @RequestParam(required = false) String employersliabilityinsurance,
                                     @RequestParam(required = false) String employernameofprovider, @RequestParam(required = false) String employerexpirydate,
                                     @RequestParam(required = false) String illorinjured, @RequestParam(required = false) String professionalindemnityinsurance,
                                     @RequestParam(required = false) String professionalnameofprovider, @RequestParam(required = false) String professionalexpirydate,
                                     @RequestParam(required = false) String injuryordamage, @RequestParam(required = false) String injuryordamagenameofprovider,
                                     @RequestParam(required = false) String injuryordamageexpirydate, @RequestParam(required = false) String injuriesinrole,
                                     @RequestParam(required = false) String injuriesinrolenameofprovider, @RequestParam(required = false) String injuriesinroleexpirydate,
                                     @RequestParam(required = false) String legalorcompensation, @RequestParam(required = false) String legalorcompensationnameofprovider,
                                     @RequestParam(required = false) String legalorcompensationexpirydate, @RequestParam String reportingaccidents,
                                     @RequestParam String healthandsafetypolicy, @RequestParam String healthandsafetytraining,
                                     @RequestParam String sitevisits, @RequestParam(required = false) String reasons,
                                     @RequestParam String confidentialityordisclosure, @RequestParam(required = false) String detailsofconfidentialityordisclosure,
                                     @RequestParam String name, @RequestParam String declarationjobtitle, @RequestParam String signature,
                                     HttpSession session) {

        int providerId = (int) session.getAttribute("providerId");
        Provider provider = providerService.findById(providerId);
        Student student = studentService.findById(studentId);

        ProviderForm providerForm = providerService.findProviderFormByProviderAndStudent(provider, student);

        providerForm.setNameoforganisation(nameoforganisation);
        providerForm.setAddress(address);
        providerForm.setPostcode(postcode.toUpperCase());
        providerForm.setWebaddress(webaddress);
        providerForm.setActivity(activity);
        providerForm.setDetails(details);
        providerForm.setNameofstudent(nameofstudent);
        providerForm.setNameofcontact(nameofcontact);
        providerForm.setContactjobtitle(contactjobtitle);
        providerForm.setContactemail(contactemail);
        providerForm.setContacttelephonenumber(contacttelephonenumber);
        providerForm.setJobtitle(jobtitle);
        providerForm.setRolestartdate(rolestartdate);
        providerForm.setRoleenddate(roleenddate);
        providerForm.setWorkinghours(workinghours);
        providerForm.setProbationperiod(probationperiod);
        providerForm.setProbationperiodassessed(probationperiodassessed);
        providerForm.setExpectation(expectation);
        providerForm.setHazardsorrisks(hazardsorrisks);
        providerForm.setDetailsofrisksandhazards(detailsofrisksandhazards);
        providerForm.setTraining(training);
        providerForm.setDetailsoftraining(detailsoftraining);
        providerForm.setWorkfromhome(workfromhome);
        providerForm.setFrequencyworkfromhome(frequencyworkfromhome);
        providerForm.setSupportforworkfromhome(supportforworkfromhome);
        providerForm.setWorkingfromdifferentsites(workingfromdifferentsites);
        providerForm.setDetailsoftravel(detailsoftravel);
        providerForm.setTraveloutsideuk(traveloutsideuk);
        providerForm.setRisksatmainlocation(risksatmainlocation);
        providerForm.setDetailsofrisksandactions(detailsofrisksandactions);
        providerForm.setPrecautionarymeasures(precautionarymeasures);
        providerForm.setDetailsofprecautionarymeasures(detailsofprecautionarymeasures);
        providerForm.setPersonalfactors(personalfactors);
        providerForm.setPublicliabilityinsurance(publicliabilityinsurance);
        providerForm.setNameofprovider(nameofprovider);
        providerForm.setExpirydate(expirydate);
        providerForm.setPublicclaim(publicclaim);
        providerForm.setEmployersliabilityinsurance(employersliabilityinsurance);
        providerForm.setEmployernameofprovider(employernameofprovider);
        providerForm.setEmployerexpirydate(employerexpirydate);
        providerForm.setIllorinjured(illorinjured);
        providerForm.setProfessionalindemnityinsurance(professionalindemnityinsurance);
        providerForm.setProfessionalnameofprovider(professionalnameofprovider);
        providerForm.setProfessionalexpirydate(professionalexpirydate);
        providerForm.setInjuryordamage(injuryordamage);
        providerForm.setInjuryordamagenameofprovider(injuryordamagenameofprovider);
        providerForm.setInjuryordamageexpirydate(injuryordamageexpirydate);
        providerForm.setInjuriesinrole(injuriesinrole);
        providerForm.setInjuriesinrolenameofprovider(injuriesinrolenameofprovider);
        providerForm.setInjuriesinroleexpirydate(injuriesinroleexpirydate);
        providerForm.setLegalorcompensation(legalorcompensation);
        providerForm.setLegalorcompensationnameofprovider(legalorcompensationnameofprovider);
        providerForm.setLegalorcompensationexpirydate(legalorcompensationexpirydate);
        providerForm.setReportingaccidents(reportingaccidents);
        providerForm.setHealthandsafetypolicy(healthandsafetypolicy);
        providerForm.setHealthandsafetytraining(healthandsafetytraining);
        providerForm.setSitevisits(sitevisits);
        providerForm.setReasons(reasons);
        providerForm.setConfidentialityordisclosure(confidentialityordisclosure);
        providerForm.setDetailsofconfidentialityordisclosure(detailsofconfidentialityordisclosure);
        providerForm.setName(name);
        providerForm.setDeclarationjobtitle(declarationjobtitle);
        providerForm.setSignature(signature);
        providerForm.setDate(LocalDate.now().toString());

        providerForm.setSubmitted(true);

        providerService.saveProviderForm(providerForm);

        student.getStudentForm().setStatus("Provider form submitted, awaiting tutor decision.");
        studentService.save(student);

        Tutor tutor = tutorService.findTutorById(1);
        String tutorEmail = tutor.getEmail();

        String content = "Both Student and Provider forms, associated to Username:" + student.getUsername() + " have been completed." +
                "\n\nPlease log into the system to make a decision on the application.";

        studentService.sendEmail(tutorEmail, "Placement Request Decision Needed", content);

        return "redirect:/ProviderDashboard";
    }

    @PostMapping("/saveProviderForm")
    public String saveProviderForm(@RequestParam int studentId, @RequestParam(required = false) String nameoforganisation,
                                   @RequestParam(required = false) String address, @RequestParam(required = false) String postcode,
                                   @RequestParam(required = false) String webaddress, @RequestParam(required = false) String activity,
                                   @RequestParam(required = false) String details, @RequestParam(required = false) String nameofstudent,
                                   @RequestParam(required = false) String nameofcontact, @RequestParam(required = false) String contactjobtitle,
                                   @RequestParam(required = false) String contactemail, @RequestParam(required = false) String contacttelephonenumber,
                                   @RequestParam(required = false) String jobtitle, @RequestParam(required = false) String rolestartdate,
                                   @RequestParam(required = false) String roleenddate, @RequestParam(required = false) Double workinghours,
                                   @RequestParam(required = false) String probationperiod, @RequestParam(required = false) String probationperiodassessed,
                                   @RequestParam(required = false) String expectation, @RequestParam(required = false) String hazardsorrisks,
                                   @RequestParam(required = false) String detailsofrisksandhazards, @RequestParam(required = false) String training,
                                   @RequestParam(required = false) String detailsoftraining, @RequestParam(required = false) String workfromhome,
                                   @RequestParam(required = false) String frequencyworkfromhome, @RequestParam(required = false) String supportforworkfromhome,
                                   @RequestParam(required = false) String workingfromdifferentsites, @RequestParam(required = false) String detailsoftravel,
                                   @RequestParam(required = false) String traveloutsideuk, @RequestParam(required = false) String risksatmainlocation,
                                   @RequestParam(required = false) String detailsofrisksandactions, @RequestParam(required = false) String precautionarymeasures,
                                   @RequestParam(required = false) String detailsofprecautionarymeasures, @RequestParam(required = false) String personalfactors,
                                   @RequestParam(required = false) String publicliabilityinsurance, @RequestParam(required = false) String nameofprovider,
                                   @RequestParam(required = false) String expirydate, @RequestParam(required = false) String publicclaim,
                                   @RequestParam(required = false) String employersliabilityinsurance, @RequestParam(required = false) String employernameofprovider,
                                   @RequestParam(required = false) String employerexpirydate, @RequestParam(required = false) String illorinjured,
                                   @RequestParam(required = false) String professionalindemnityinsurance, @RequestParam(required = false) String professionalnameofprovider,
                                   @RequestParam(required = false) String professionalexpirydate, @RequestParam(required = false) String injuryordamage,
                                   @RequestParam(required = false) String injuryordamagenameofprovider, @RequestParam(required = false) String injuryordamageexpirydate,
                                   @RequestParam(required = false) String injuriesinrole, @RequestParam(required = false) String injuriesinrolenameofprovider,
                                   @RequestParam(required = false) String injuriesinroleexpirydate, @RequestParam(required = false) String legalorcompensation,
                                   @RequestParam(required = false) String legalorcompensationnameofprovider, @RequestParam(required = false) String legalorcompensationexpirydate,
                                   @RequestParam(required = false) String reportingaccidents, @RequestParam(required = false) String healthandsafetypolicy,
                                   @RequestParam(required = false) String healthandsafetytraining, @RequestParam(required = false) String sitevisits,
                                   @RequestParam(required = false) String reasons, @RequestParam(required = false) String confidentialityordisclosure,
                                   @RequestParam(required = false) String detailsofconfidentialityordisclosure, @RequestParam(required = false) String name,
                                   @RequestParam(required = false) String declarationjobtitle, @RequestParam(required = false) String signature, HttpSession session) {

        int providerId = (int) session.getAttribute("providerId");
        Provider provider = providerService.findById(providerId);
        Student student = studentService.findById(studentId);

        ProviderForm providerForm = providerService.findProviderFormByProviderAndStudent(provider, student);

        if (nameoforganisation != null) providerForm.setNameoforganisation(nameoforganisation);
        if (address != null) providerForm.setAddress(address);
        if (postcode != null) providerForm.setPostcode(postcode);
        if (webaddress != null) providerForm.setWebaddress(webaddress);
        if (activity != null) providerForm.setActivity(activity);
        if (details != null) providerForm.setDetails(details);
        if (nameofstudent != null) providerForm.setNameofstudent(nameofstudent);
        if (nameofcontact != null) providerForm.setNameofcontact(nameofcontact);
        if (contactjobtitle != null) providerForm.setContactjobtitle(contactjobtitle);
        if (contactemail != null) providerForm.setContactemail(contactemail);
        if (contacttelephonenumber != null) providerForm.setContacttelephonenumber(contacttelephonenumber);
        if (jobtitle != null) providerForm.setJobtitle(jobtitle);
        if (rolestartdate != null) providerForm.setRolestartdate(rolestartdate);
        if (roleenddate != null) providerForm.setRoleenddate(roleenddate);
        if (workinghours != null) providerForm.setWorkinghours(workinghours);
        if (probationperiod != null) providerForm.setProbationperiod(probationperiod);
        if (probationperiodassessed != null) providerForm.setProbationperiodassessed(probationperiodassessed);
        if (expectation != null) providerForm.setExpectation(expectation);
        if (hazardsorrisks != null) providerForm.setHazardsorrisks(hazardsorrisks);
        if (detailsofrisksandhazards != null) providerForm.setDetailsofrisksandhazards(detailsofrisksandhazards);
        if (training != null) providerForm.setTraining(training);
        if (detailsoftraining != null) providerForm.setDetailsoftraining(detailsoftraining);
        if (workfromhome != null) providerForm.setWorkfromhome(workfromhome);
        if (frequencyworkfromhome != null) providerForm.setFrequencyworkfromhome(frequencyworkfromhome);
        if (supportforworkfromhome != null) providerForm.setSupportforworkfromhome(supportforworkfromhome);
        if (workingfromdifferentsites != null) providerForm.setWorkingfromdifferentsites(workingfromdifferentsites);
        if (detailsoftravel != null) providerForm.setDetailsoftravel(detailsoftravel);
        if (traveloutsideuk != null) providerForm.setTraveloutsideuk(traveloutsideuk);
        if (risksatmainlocation != null) providerForm.setRisksatmainlocation(risksatmainlocation);
        if (detailsofrisksandactions != null) providerForm.setDetailsofrisksandactions(detailsofrisksandactions);
        if (precautionarymeasures != null) providerForm.setPrecautionarymeasures(precautionarymeasures);
        if (detailsofprecautionarymeasures != null) providerForm.setDetailsofprecautionarymeasures(detailsofprecautionarymeasures);
        if (personalfactors != null) providerForm.setPersonalfactors(personalfactors);
        if (publicliabilityinsurance != null) providerForm.setPublicliabilityinsurance(publicliabilityinsurance);
        if (nameofprovider != null) providerForm.setNameofprovider(nameofprovider);
        if (expirydate != null) providerForm.setExpirydate(expirydate);
        if (publicclaim != null) providerForm.setPublicclaim(publicclaim);
        if (employersliabilityinsurance != null) providerForm.setEmployersliabilityinsurance(employersliabilityinsurance);
        if (employernameofprovider != null) providerForm.setEmployernameofprovider(employernameofprovider);
        if (employerexpirydate != null) providerForm.setEmployerexpirydate(employerexpirydate);
        if (illorinjured != null) providerForm.setIllorinjured(illorinjured);
        if (professionalindemnityinsurance != null) providerForm.setProfessionalindemnityinsurance(professionalindemnityinsurance);
        if (professionalnameofprovider != null) providerForm.setProfessionalnameofprovider(professionalnameofprovider);
        if (professionalexpirydate != null) providerForm.setProfessionalexpirydate(professionalexpirydate);
        if (injuryordamage != null) providerForm.setInjuryordamage(injuryordamage);
        if (injuryordamagenameofprovider != null) providerForm.setInjuryordamagenameofprovider(injuryordamagenameofprovider);
        if (injuryordamageexpirydate != null) providerForm.setInjuryordamageexpirydate(injuryordamageexpirydate);
        if (injuriesinrole != null) providerForm.setInjuriesinrole(injuriesinrole);
        if (injuriesinrolenameofprovider != null) providerForm.setInjuriesinrolenameofprovider(injuriesinrolenameofprovider);
        if (injuriesinroleexpirydate != null) providerForm.setInjuriesinroleexpirydate(injuriesinroleexpirydate);
        if (legalorcompensation != null) providerForm.setLegalorcompensation(legalorcompensation);
        if (legalorcompensationnameofprovider != null) providerForm.setLegalorcompensationnameofprovider(legalorcompensationnameofprovider);
        if (legalorcompensationexpirydate != null) providerForm.setLegalorcompensationexpirydate(legalorcompensationexpirydate);
        if (reportingaccidents != null) providerForm.setReportingaccidents(reportingaccidents);
        if (healthandsafetypolicy != null) providerForm.setHealthandsafetypolicy(healthandsafetypolicy);
        if (healthandsafetytraining != null) providerForm.setHealthandsafetytraining(healthandsafetytraining);
        if (sitevisits != null) providerForm.setSitevisits(sitevisits);
        if (reasons != null) providerForm.setReasons(reasons);
        if (confidentialityordisclosure != null) providerForm.setConfidentialityordisclosure(confidentialityordisclosure);
        if (detailsofconfidentialityordisclosure != null) providerForm.setDetailsofconfidentialityordisclosure(detailsofconfidentialityordisclosure);
        if (name != null) providerForm.setName(name);
        if (declarationjobtitle != null) providerForm.setDeclarationjobtitle(declarationjobtitle);
        if (signature != null) providerForm.setSignature(signature);

        providerService.saveProviderForm(providerForm);

        return "redirect:/ProviderDashboard";
    }

    @GetMapping("/ProviderViewAvailability")
    public String providerViewAvailability(HttpSession session, Model model) {
        int providerId = (int) session.getAttribute("providerId");

        // Fetch the provider's city
        String city = siteVisitService.findProviderCityById(providerId);
        List<TutorTimeSlot> tutorTimeSlots = siteVisitService.findTutorAvailabilityByCity(city);

        Tutor tutor = tutorTimeSlots.get(0).getTutor();

        Map<String, List<TutorTimeSlot>> slotsByDate = tutorTimeSlots.stream().collect(Collectors.groupingBy(TutorTimeSlot::getDate));
        model.addAttribute("slotsByDate", slotsByDate);
        model.addAttribute("city", city);
        model.addAttribute("tutor", tutor);
        return "ProviderViewTutorAvailability";
    }

    @PostMapping("/SubmitProviderAvailability")
    public String submitProviderAvailability(@RequestParam("providerId") int providerId, @RequestParam("selectedSlots") List<Integer> selectedSlots) {
        siteVisitService.saveProviderAvailability(providerId, selectedSlots);
        return "redirect:/ProviderViewAvailability";  // Redirect to refresh the page
    }


}
