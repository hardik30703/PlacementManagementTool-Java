package com.example.MCompProject.Domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.List;

@Entity
public class TutorTimeSlot {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int TTSId;

    private String date;

    private String startTime;

    private String endTime;

    private String city;

    private boolean booked;

    @ManyToOne
    @JoinColumn(name = "tutor_id")
    private Tutor tutor;

    @OneToMany(mappedBy = "tutorTimeSlot", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    private List<SiteVisit> siteVisits;

    public TutorTimeSlot(String date, String startTime, String endTime, String city) {
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
        this.city = city;
    }

    public TutorTimeSlot() {

    }

    public int getTTSId() {
        return TTSId;
    }

    public void setTTSId(int TTSId) {
        this.TTSId = TTSId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public boolean isBooked() {
        return booked;
    }

    public void setBooked(boolean booked) {
        this.booked = booked;
    }

    public Tutor getTutor() {
        return tutor;
    }

    public void setTutor(Tutor tutor) {
        this.tutor = tutor;
    }

    public List<SiteVisit> getSiteVisits() {
        return siteVisits;
    }

    public void setSiteVisits(List<SiteVisit> siteVisits) {
        this.siteVisits = siteVisits;
    }
}
