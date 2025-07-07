package com.example.MCompProject.Domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.List;

@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Entity
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int studentId;

    private String username;

    private String password;

    private String firstname;

    private String lastname;

    private String email;

    private int rejectionCount;

    private boolean isBlocked;

    private boolean isApproved;

    @OneToOne(mappedBy = "student")
    private StudentForm studentForm;

    @ManyToOne
    @JoinColumn(name = "provider_id")
    @JsonBackReference
    private Provider provider;

    @OneToOne(mappedBy = "student")
    @JsonManagedReference
    private ProviderForm providerForm;

    @OneToOne(mappedBy = "student")
    @JsonManagedReference
    private TutorForm tutorForm;

    @OneToMany(mappedBy = "student")
    @JsonManagedReference
    private List<SiteVisit> siteVisits;

    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<OnlineMeeting> meetings;

    public Student(){

    }

    public Student(String username, String password, String firstname, String lastname, String email) {
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
    }

    public int getStudentID() {
        return studentId;
    }

    public void setStudentID(int studentId) {
        this.studentId = studentId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRejectionCount() {
        return rejectionCount;
    }

    public void setRejectionCount(int rejectionCount) {
        this.rejectionCount = rejectionCount;
    }

    public boolean isBlocked() {
        return isBlocked;
    }

    public void setBlocked(boolean blocked) {
        isBlocked = blocked;
    }

    public boolean isApproved() {
        return isApproved;
    }

    public void setApproved(boolean approved) {
        isApproved = approved;
    }

    public StudentForm getStudentForm() {
        return studentForm;
    }

    public void setStudentForm(StudentForm studentForm) {
        this.studentForm = studentForm;
    }

    public Provider getProvider() {
        return provider;
    }

    public void setProvider(Provider provider) {
        this.provider = provider;
    }

    public ProviderForm getProviderForm() {
        return providerForm;
    }

    public void setProviderForm(ProviderForm providerForm) {
        this.providerForm = providerForm;
    }

    public TutorForm getTutorForm() {
        return tutorForm;
    }

    public void setTutorForm(TutorForm tutorForm) {
        this.tutorForm = tutorForm;
    }

    public List<SiteVisit> getSiteVisits() {
        return siteVisits;
    }

    public void setSiteVisits(List<SiteVisit> siteVisits) {
        this.siteVisits = siteVisits;
    }

    public List<OnlineMeeting> getMeetings() {
        return meetings;
    }

    public void setMeetings(List<OnlineMeeting> meetings) {
        this.meetings = meetings;
    }
}
