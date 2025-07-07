package com.example.MCompProject.Domain;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;

@Entity
public class OnlineMeeting {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int OMId;

    private String title;

    private String start;

    private String end;

    @ManyToOne
    @JoinColumn(name = "student_id")
    @JsonBackReference
    private Student student;

    @ManyToOne
    @JoinColumn(name = "provider_id")
    @JsonBackReference
    private Provider provider;


    public int getOMId() {
        return OMId;
    }

    public void setOMId(int OMId) {
        this.OMId = OMId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
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
}
