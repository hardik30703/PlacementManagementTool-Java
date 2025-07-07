package com.example.MCompProject.Domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.List;

@Entity
public class Tutor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int tutorId;

    private String username;

    private String password;

    private String email;

    @OneToMany(mappedBy = "tutor")
    @JsonManagedReference
    private List<SiteVisit> siteVisits;

    @OneToMany(mappedBy = "tutor")
    private List<TutorTimeSlot> tutorTimeSlots;

    public Tutor() {
    }


    public int getTutorID() {
        return tutorId;
    }

    public void setTutorID(int tutorId) {
        this.tutorId = tutorId;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<SiteVisit> getSiteVisits() {
        return siteVisits;
    }

    public void setSiteVisits(List<SiteVisit> siteVisits) {
        this.siteVisits = siteVisits;
    }

    public List<TutorTimeSlot> getTutorTimeSlots() {
        return tutorTimeSlots;
    }

    public void setTutorTimeSlots(List<TutorTimeSlot> tutorTimeSlots) {
        this.tutorTimeSlots = tutorTimeSlots;
    }
}
