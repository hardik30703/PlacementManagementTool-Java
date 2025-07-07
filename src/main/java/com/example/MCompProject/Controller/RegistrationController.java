package com.example.MCompProject.Controller;

import com.example.MCompProject.Domain.Student;
import com.example.MCompProject.Service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;

@Controller
public class RegistrationController {

    @Autowired
    StudentService studentService;


    @GetMapping("/StudentRegister")
    public String showRegistrationForm() {
        return "StudentRegister";
    }

    @PostMapping("/StudentRegister")
    public String submitRegistrationForm(@RequestParam String username, @RequestParam String password,
                                         @RequestParam String firstname, @RequestParam String lastname,
                                         @RequestParam String email, HttpSession session, Model model) {
        Student existingStudent = studentService.findByEmail(email);
        Student exStudent = studentService.findByUsername(username);

        String emailDomain = "@student.le.ac.uk";
        if (!email.endsWith(emailDomain) || !email.startsWith(username)) {
            model.addAttribute("errorMessage", "Email must end with @student.le.ac.uk " +
                    "and username must match the start of the email.");
            return "StudentRegister";
        }

        if (existingStudent != null || exStudent != null) {
            model.addAttribute("errorMessage", "Email or Username already exist");
            return "StudentRegister";
        }

        Student student = new Student(username, password, firstname, lastname, email);
        studentService.save(student);
        session.setAttribute("studentId", student.getStudentID());
        return "StudentDashboard";
    }
}
