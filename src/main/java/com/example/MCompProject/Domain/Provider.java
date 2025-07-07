package com.example.MCompProject.Domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.List;

@Entity
public class Provider {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int providerId;

    private String username;

    private String password;

    private String email;

    @OneToMany(mappedBy = "provider")
    @JsonManagedReference
    private List<Student> students;

    @OneToMany(mappedBy = "provider")
    @JsonManagedReference
    private List<ProviderForm> providerForms;

    @OneToMany(mappedBy = "provider")
    @JsonManagedReference
    private List<SiteVisit> siteVisits;

    @OneToMany(mappedBy = "provider", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<OnlineMeeting> meetings;


    public int getProviderId() {
        return providerId;
    }

    public void setProviderId(int providerId) {
        this.providerId = providerId;
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

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }

    public List<ProviderForm> getProviderForms() {
        return providerForms;
    }

    public void setProviderForms(List<ProviderForm> providerForms) {
        this.providerForms = providerForms;
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
