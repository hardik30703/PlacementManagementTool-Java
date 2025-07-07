package com.example.MCompProject.Domain;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
public class SiteVisit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int SVId;

    private String date;

    private String startTime;

    private String endTime;

    @ManyToOne
    @JoinColumn(name = "student_id")
    @JsonBackReference
    private Student student;

    @ManyToOne
    @JoinColumn(name = "provider_id")
    @JsonBackReference
    private Provider provider;

    @ManyToOne
    @JoinColumn(name = "tutor_id")
    @JsonBackReference
    private Tutor tutor;

    @ManyToOne
    @JoinColumn(name = "tutor_time_slot_id")
    @JsonBackReference
    private TutorTimeSlot tutorTimeSlot;


    public SiteVisit(String date, String startTime, String endTime, Student student, Provider provider, Tutor tutor) {
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
        this.student = student;
        this.provider = provider;
        this.tutor = tutor;
    }

    public SiteVisit() {

    }

    public int getSVId() {
        return SVId;
    }

    public void setSVId(int SVId) {
        this.SVId = SVId;
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

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Provider getProvider() {
        return provider;
    }

    public void setProvider(Provider provider) {
        this.provider = provider;
    }

    public Tutor getTutor() {
        return tutor;
    }

    public void setTutor(Tutor tutor) {
        this.tutor = tutor;
    }

    public TutorTimeSlot getTutorTimeSlot() {
        return tutorTimeSlot;
    }

    public void setTutorTimeSlot(TutorTimeSlot tutorTimeSlot) {
        this.tutorTimeSlot = tutorTimeSlot;
    }
}
