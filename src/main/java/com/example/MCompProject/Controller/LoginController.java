package com.example.MCompProject.Controller;

import com.example.MCompProject.Domain.Provider;
import com.example.MCompProject.Domain.Student;
import com.example.MCompProject.Domain.Tutor;
import com.example.MCompProject.Service.ProviderService;
import com.example.MCompProject.Service.StudentService;
import com.example.MCompProject.Service.TutorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    StudentService studentService;

    @Autowired
    TutorService tutorService;

    @Autowired
    ProviderService providerService;

    //Used Logic From Previous Project

    @GetMapping("/StudentLogin")
    public String showLoginForm() {
        return "StudentLogin";
    }

    @PostMapping("/StudentLogin")
    public String submitLoginForm(@RequestParam String username, @RequestParam String password,
                                  HttpSession session, Model model) {
        Student student = studentService.findByUsername(username);
        if (student != null && student.getPassword().equals(password)) {
            session.setAttribute("studentId", student.getStudentID()); // Store student ID in session
            return "StudentDashboard";
        }
        model.addAttribute("errorMessage", "Invalid Username and Password");
        return "StudentLogin";
    }

    @GetMapping("/TutorLogin")
    public String showTutorLoginForm() {
        return "TutorLogin";
    }

    @PostMapping("/TutorLogin")
    public String submitTutorLoginForm(@RequestParam String username, @RequestParam String password,
                                       Model model) {
        Tutor tutor = tutorService.findByUsername(username);
        if (tutor != null && tutor.getPassword().equals(password)) {
            return "TutorDashboard";
        }
        model.addAttribute("errorMessage", "Invalid Username and Password");
        return "TutorLogin";
    }

    @GetMapping("/ProviderLogin")
    public String showProviderLoginForm() {
        return "ProviderLogin";
    }

    @PostMapping("/ProviderLogin")
    public String submitProviderLoginForm(@RequestParam String username, @RequestParam String password,
                                          HttpSession session, Model model) {
        Provider provider = providerService.findByUsername(username);
        if (provider != null && provider.getPassword().equals(password)) {
            session.setAttribute("providerId", provider.getProviderId());
            return "ProviderDashboard";
        }
        model.addAttribute("errorMessage", "Invalid Username and Password");
        return "ProviderLogin";
    }
}
