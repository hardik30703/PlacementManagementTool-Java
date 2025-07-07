package com.example.MCompProject.Domain;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;

@Entity
public class TutorForm {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer TFormID;

    private String studentname;

    private String nameoforganisation;

    private String impact;

    private String samedetails;

    private String meetrequirementshours;

    private String providerconfirm;

    private String confidenceonprovider;

    private String studentvisa;

    private String studentvisacomply;

    // Work Factors
    private String workingconditions;

    private String training;

    private String workfromhome;

    private String internationalremoteworking;

    private String travelissues;

    private String workinmultiplesites;

    private String risks;

    private String inappropriateaccommodation;

    private String precautionarymeasures;

    private String personalfactors;

    private String publicliabilityinsurance;

    private String employerliabilityinsurance;

    private String professionalindemnityinsurance;

    private String healthandsafetypolicy;

    private String objectionsofsitevisits;

    private String confidentiality;

    private String decision;

    private String reason;

    private String nameoftutor;

    private String signature;

    private String supervisor;

    private String directorsignature;

    private boolean isSubmitted;

    @OneToOne
    @JoinColumn(name = "student_id")
    @JsonBackReference
    private Student student;


    public Integer getTFormID() {
        return TFormID;
    }

    public void setTFormID(Integer TFormID) {
        this.TFormID = TFormID;
    }

    public String getStudentname() {
        return studentname;
    }

    public void setStudentname(String studentname) {
        this.studentname = studentname;
    }

    public String getNameoforganisation() {
        return nameoforganisation;
    }

    public void setNameoforganisation(String nameoforganisation) {
        this.nameoforganisation = nameoforganisation;
    }

    public String getImpact() {
        return impact;
    }

    public void setImpact(String impact) {
        this.impact = impact;
    }

    public String getSamedetails() {
        return samedetails;
    }

    public void setSamedetails(String samedetails) {
        this.samedetails = samedetails;
    }

    public String getMeetrequirementshours() {
        return meetrequirementshours;
    }

    public void setMeetrequirementshours(String meetrequirementshours) {
        this.meetrequirementshours = meetrequirementshours;
    }

    public String getProviderconfirm() {
        return providerconfirm;
    }

    public void setProviderconfirm(String providerconfirm) {
        this.providerconfirm = providerconfirm;
    }

    public String getConfidenceonprovider() {
        return confidenceonprovider;
    }

    public void setConfidenceonprovider(String confidenceonprovider) {
        this.confidenceonprovider = confidenceonprovider;
    }

    public String getStudentvisa() {
        return studentvisa;
    }

    public void setStudentvisa(String studentvisa) {
        this.studentvisa = studentvisa;
    }

    public String getStudentvisacomply() {
        return studentvisacomply;
    }

    public void setStudentvisacomply(String studentvisacomply) {
        this.studentvisacomply = studentvisacomply;
    }

    public String getWorkingconditions() {
        return workingconditions;
    }

    public void setWorkingconditions(String workingconditions) {
        this.workingconditions = workingconditions;
    }

    public String getTraining() {
        return training;
    }

    public void setTraining(String training) {
        this.training = training;
    }

    public String getWorkfromhome() {
        return workfromhome;
    }

    public void setWorkfromhome(String workfromhome) {
        this.workfromhome = workfromhome;
    }

    public String getInternationalremoteworking() {
        return internationalremoteworking;
    }

    public void setInternationalremoteworking(String internationalremoteworking) {
        this.internationalremoteworking = internationalremoteworking;
    }

    public String getTravelissues() {
        return travelissues;
    }

    public void setTravelissues(String travelissues) {
        this.travelissues = travelissues;
    }

    public String getWorkinmultiplesites() {
        return workinmultiplesites;
    }

    public void setWorkinmultiplesites(String workinmultiplesites) {
        this.workinmultiplesites = workinmultiplesites;
    }

    public String getRisks() {
        return risks;
    }

    public void setRisks(String risks) {
        this.risks = risks;
    }

    public String getInappropriateaccommodation() {
        return inappropriateaccommodation;
    }

    public void setInappropriateaccommodation(String inappropriateaccommodation) {
        this.inappropriateaccommodation = inappropriateaccommodation;
    }

    public String getPrecautionarymeasures() {
        return precautionarymeasures;
    }

    public void setPrecautionarymeasures(String precautionarymeasures) {
        this.precautionarymeasures = precautionarymeasures;
    }

    public String getPersonalfactors() {
        return personalfactors;
    }

    public void setPersonalfactors(String personalfactors) {
        this.personalfactors = personalfactors;
    }

    public String getPublicliabilityinsurance() {
        return publicliabilityinsurance;
    }

    public void setPublicliabilityinsurance(String publicliabilityinsurance) {
        this.publicliabilityinsurance = publicliabilityinsurance;
    }

    public String getEmployerliabilityinsurance() {
        return employerliabilityinsurance;
    }

    public void setEmployerliabilityinsurance(String employerliabilityinsurance) {
        this.employerliabilityinsurance = employerliabilityinsurance;
    }

    public String getProfessionalindemnityinsurance() {
        return professionalindemnityinsurance;
    }

    public void setProfessionalindemnityinsurance(String professionalindemnityinsurance) {
        this.professionalindemnityinsurance = professionalindemnityinsurance;
    }

    public String getHealthandsafetypolicy() {
        return healthandsafetypolicy;
    }

    public void setHealthandsafetypolicy(String healthandsafetypolicy) {
        this.healthandsafetypolicy = healthandsafetypolicy;
    }

    public String getObjectionsofsitevisits() {
        return objectionsofsitevisits;
    }

    public void setObjectionsofsitevisits(String objectionsofsitevisits) {
        this.objectionsofsitevisits = objectionsofsitevisits;
    }

    public String getConfidentiality() {
        return confidentiality;
    }

    public void setConfidentiality(String confidentiality) {
        this.confidentiality = confidentiality;
    }

    public String getDecision() {
        return decision;
    }

    public void setDecision(String decision) {
        this.decision = decision;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getNameoftutor() {
        return nameoftutor;
    }

    public void setNameoftutor(String nameoftutor) {
        this.nameoftutor = nameoftutor;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(String supervisor) {
        this.supervisor = supervisor;
    }

    public String getDirectorsignature() {
        return directorsignature;
    }

    public void setDirectorsignature(String directorsignature) {
        this.directorsignature = directorsignature;
    }

    public boolean isSubmitted() {
        return isSubmitted;
    }

    public void setSubmitted(boolean submitted) {
        isSubmitted = submitted;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}



