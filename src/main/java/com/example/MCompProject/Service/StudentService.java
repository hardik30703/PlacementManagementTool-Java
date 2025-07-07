package com.example.MCompProject.Service;

import com.example.MCompProject.Repository.StudentFormRepo;
import com.example.MCompProject.Domain.Student;
import com.example.MCompProject.Repository.StudentRepo;
import com.example.MCompProject.Domain.StudentForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentRepo studentRepo;

    @Autowired
    private StudentFormRepo studentFormRepo;

    @Autowired
    private JavaMailSender mailSender;


    //Student Reg/Login
    public void save(Student a){
        studentRepo.save(a);
    }

    public Student findByUsername(String username) {
        return studentRepo.findByUsername(username);
    }

    public Student findByEmail(String email) {
        return studentRepo.findByEmail(email);
    }

    public Student findById(int studentId) {
        return studentRepo.findById(studentId);
    }

    public List<Student> getAllStudents() {
        return (List<Student>) studentRepo.findAll();
    }

    public List<String> findUsernamesByUsername(String username) {
        List<Student> students = studentRepo.findByUsernameContainingIgnoreCase(username);
        List<String> usernames = new ArrayList<>();
        for (Student student : students) {
            usernames.add(student.getUsername());
        }
        return usernames;
    }

    public List<Student> findByCity(String city) {
        return studentRepo.findByCity(city);
    }


    //Form
    public void saveStudentForm(StudentForm a){
        studentFormRepo.save(a);
    }

    public List<StudentForm> getAllStudentForms() {
        return (List<StudentForm>) studentFormRepo.findAll();
    }

    public StudentForm findByFormId(int i) {
        return studentFormRepo.findById(i).get();
    }

    public void deleteByFormId(int id) {
        studentFormRepo.deleteById(id);
    }

    public StudentForm findByStudentId(int studentId) {
        return studentFormRepo.findByStudent_StudentId(studentId);
    }



    //Email
    public void sendEmail(String to, String subject, String content) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(content);
        mailSender.send(message);
    }
}
