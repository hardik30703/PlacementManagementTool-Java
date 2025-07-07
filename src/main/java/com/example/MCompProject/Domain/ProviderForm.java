package com.example.MCompProject.Domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;

@Entity
public class ProviderForm {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int PFormID;

    private String nameoforganisation;

    private String address;

    private String postcode;

    private String webaddress;

    private String activity;

    private String details;

    private String nameofstudent;

    private String nameofcontact;

    private String contactjobtitle;

    private String contactemail;

    private String contacttelephonenumber;

    private String jobtitle;

    private String rolestartdate;

    private String roleenddate;

    private double workinghours;

    private String probationperiod;

    private String probationperiodassessed;

    private String expectation;

    private String hazardsorrisks;

    private String detailsofrisksandhazards;

    private String training;

    private String detailsoftraining;

    private String workfromhome;

    private String frequencyworkfromhome;

    private String supportforworkfromhome;

    private String workingfromdifferentsites;

    private String detailsoftravel;

    private String traveloutsideuk;

    private String risksatmainlocation;

    private String detailsofrisksandactions;

    private String precautionarymeasures;

    private String detailsofprecautionarymeasures;

    private String personalfactors;

    private String publicliabilityinsurance;

    private String nameofprovider;

    private String expirydate;

    private String publicclaim;

    private String employersliabilityinsurance;

    private String employernameofprovider;

    private String employerexpirydate;

    private String illorinjured;

    private String professionalindemnityinsurance;

    private String professionalnameofprovider;

    private String professionalexpirydate;

    private String injuryordamage;

    private String injuryordamagenameofprovider;

    private String injuryordamageexpirydate;

    private String injuriesinrole;

    private String injuriesinrolenameofprovider;

    private String injuriesinroleexpirydate;

    private String legalorcompensation;

    private String legalorcompensationnameofprovider;

    private String legalorcompensationexpirydate;

    private String reportingaccidents;

    private String healthandsafetypolicy;

    private String healthandsafetytraining;

    private String sitevisits;

    private String reasons;

    private String confidentialityordisclosure;

    private String detailsofconfidentialityordisclosure;

    private String name;

    private String declarationjobtitle;

    private String signature;

    private String date;

    private boolean isSubmitted;

    private String city;

    @ManyToOne
    @JoinColumn(name = "provider_id")
    @JsonBackReference
    private Provider provider;

    @OneToOne
    @JoinColumn(name = "student_id")
    @JsonBackReference
    private Student student;


    public int getPFormID() {
        return PFormID;
    }

    public void setPFormID(int PFormID) {
        this.PFormID = PFormID;
    }

    public String getNameoforganisation() {
        return nameoforganisation;
    }

    public void setNameoforganisation(String nameoforganisation) {
        this.nameoforganisation = nameoforganisation;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getWebaddress() {
        return webaddress;
    }

    public void setWebaddress(String webaddress) {
        this.webaddress = webaddress;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getNameofstudent() {
        return nameofstudent;
    }

    public void setNameofstudent(String nameofstudent) {
        this.nameofstudent = nameofstudent;
    }

    public String getNameofcontact() {
        return nameofcontact;
    }

    public void setNameofcontact(String nameofcontact) {
        this.nameofcontact = nameofcontact;
    }

    public String getContactjobtitle() {
        return contactjobtitle;
    }

    public void setContactjobtitle(String contactjobtitle) {
        this.contactjobtitle = contactjobtitle;
    }

    public String getContactemail() {
        return contactemail;
    }

    public void setContactemail(String contactemail) {
        this.contactemail = contactemail;
    }

    public String getContacttelephonenumber() {
        return contacttelephonenumber;
    }

    public void setContacttelephonenumber(String contacttelephonenumber) {
        this.contacttelephonenumber = contacttelephonenumber;
    }

    public String getJobtitle() {
        return jobtitle;
    }

    public void setJobtitle(String jobtitle) {
        this.jobtitle = jobtitle;
    }

    public String getRolestartdate() {
        return rolestartdate;
    }

    public void setRolestartdate(String rolestartdate) {
        this.rolestartdate = rolestartdate;
    }

    public String getRoleenddate() {
        return roleenddate;
    }

    public void setRoleenddate(String roleenddate) {
        this.roleenddate = roleenddate;
    }

    public double getWorkinghours() {
        return workinghours;
    }

    public void setWorkinghours(double workinghours) {
        this.workinghours = workinghours;
    }

    public String getProbationperiod() {
        return probationperiod;
    }

    public void setProbationperiod(String probationperiod) {
        this.probationperiod = probationperiod;
    }

    public String getProbationperiodassessed() {
        return probationperiodassessed;
    }

    public void setProbationperiodassessed(String probationperiodassessed) {
        this.probationperiodassessed = probationperiodassessed;
    }

    public String getExpectation() {
        return expectation;
    }

    public void setExpectation(String expectation) {
        this.expectation = expectation;
    }

    public String getHazardsorrisks() {
        return hazardsorrisks;
    }

    public void setHazardsorrisks(String hazardsorrisks) {
        this.hazardsorrisks = hazardsorrisks;
    }

    public String getDetailsofrisksandhazards() {
        return detailsofrisksandhazards;
    }

    public void setDetailsofrisksandhazards(String detailsofrisksandhazards) {
        this.detailsofrisksandhazards = detailsofrisksandhazards;
    }

    public String getTraining() {
        return training;
    }

    public void setTraining(String training) {
        this.training = training;
    }

    public String getDetailsoftraining() {
        return detailsoftraining;
    }

    public void setDetailsoftraining(String detailsoftraining) {
        this.detailsoftraining = detailsoftraining;
    }

    public String getWorkfromhome() {
        return workfromhome;
    }

    public void setWorkfromhome(String workfromhome) {
        this.workfromhome = workfromhome;
    }

    public String getFrequencyworkfromhome() {
        return frequencyworkfromhome;
    }

    public void setFrequencyworkfromhome(String frequencyworkfromhome) {
        this.frequencyworkfromhome = frequencyworkfromhome;
    }

    public String getSupportforworkfromhome() {
        return supportforworkfromhome;
    }

    public void setSupportforworkfromhome(String supportforworkfromhome) {
        this.supportforworkfromhome = supportforworkfromhome;
    }

    public String getWorkingfromdifferentsites() {
        return workingfromdifferentsites;
    }

    public void setWorkingfromdifferentsites(String workingfromdifferentsites) {
        this.workingfromdifferentsites = workingfromdifferentsites;
    }

    public String getDetailsoftravel() {
        return detailsoftravel;
    }

    public void setDetailsoftravel(String detailsoftravel) {
        this.detailsoftravel = detailsoftravel;
    }

    public String getTraveloutsideuk() {
        return traveloutsideuk;
    }

    public void setTraveloutsideuk(String traveloutsideuk) {
        this.traveloutsideuk = traveloutsideuk;
    }

    public String getRisksatmainlocation() {
        return risksatmainlocation;
    }

    public void setRisksatmainlocation(String risksatmainlocation) {
        this.risksatmainlocation = risksatmainlocation;
    }

    public String getDetailsofrisksandactions() {
        return detailsofrisksandactions;
    }

    public void setDetailsofrisksandactions(String detailsofrisksandactions) {
        this.detailsofrisksandactions = detailsofrisksandactions;
    }

    public String getPrecautionarymeasures() {
        return precautionarymeasures;
    }

    public void setPrecautionarymeasures(String precautionarymeasures) {
        this.precautionarymeasures = precautionarymeasures;
    }

    public String getDetailsofprecautionarymeasures() {
        return detailsofprecautionarymeasures;
    }

    public void setDetailsofprecautionarymeasures(String detailsofprecautionarymeasures) {
        this.detailsofprecautionarymeasures = detailsofprecautionarymeasures;
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

    public String getNameofprovider() {
        return nameofprovider;
    }

    public void setNameofprovider(String nameofprovider) {
        this.nameofprovider = nameofprovider;
    }

    public String getExpirydate() {
        return expirydate;
    }

    public void setExpirydate(String expirydate) {
        this.expirydate = expirydate;
    }

    public String getPublicclaim() {
        return publicclaim;
    }

    public void setPublicclaim(String publicclaim) {
        this.publicclaim = publicclaim;
    }

    public String getEmployersliabilityinsurance() {
        return employersliabilityinsurance;
    }

    public void setEmployersliabilityinsurance(String employersliabilityinsurance) {
        this.employersliabilityinsurance = employersliabilityinsurance;
    }

    public String getEmployernameofprovider() {
        return employernameofprovider;
    }

    public void setEmployernameofprovider(String employernameofprovider) {
        this.employernameofprovider = employernameofprovider;
    }

    public String getEmployerexpirydate() {
        return employerexpirydate;
    }

    public void setEmployerexpirydate(String employerexpirydate) {
        this.employerexpirydate = employerexpirydate;
    }

    public String getIllorinjured() {
        return illorinjured;
    }

    public void setIllorinjured(String illorinjured) {
        this.illorinjured = illorinjured;
    }

    public String getProfessionalindemnityinsurance() {
        return professionalindemnityinsurance;
    }

    public void setProfessionalindemnityinsurance(String professionalindemnityinsurance) {
        this.professionalindemnityinsurance = professionalindemnityinsurance;
    }

    public String getProfessionalnameofprovider() {
        return professionalnameofprovider;
    }

    public void setProfessionalnameofprovider(String professionalnameofprovider) {
        this.professionalnameofprovider = professionalnameofprovider;
    }

    public String getProfessionalexpirydate() {
        return professionalexpirydate;
    }

    public void setProfessionalexpirydate(String professionalexpirydate) {
        this.professionalexpirydate = professionalexpirydate;
    }

    public String getInjuryordamage() {
        return injuryordamage;
    }

    public void setInjuryordamage(String injuryordamage) {
        this.injuryordamage = injuryordamage;
    }

    public String getInjuryordamagenameofprovider() {
        return injuryordamagenameofprovider;
    }

    public void setInjuryordamagenameofprovider(String injuryordamagenameofprovider) {
        this.injuryordamagenameofprovider = injuryordamagenameofprovider;
    }

    public String getInjuryordamageexpirydate() {
        return injuryordamageexpirydate;
    }

    public void setInjuryordamageexpirydate(String injuryordamageexpirydate) {
        this.injuryordamageexpirydate = injuryordamageexpirydate;
    }

    public String getInjuriesinrole() {
        return injuriesinrole;
    }

    public void setInjuriesinrole(String injuriesinrole) {
        this.injuriesinrole = injuriesinrole;
    }

    public String getInjuriesinrolenameofprovider() {
        return injuriesinrolenameofprovider;
    }

    public void setInjuriesinrolenameofprovider(String injuriesinrolenameofprovider) {
        this.injuriesinrolenameofprovider = injuriesinrolenameofprovider;
    }

    public String getInjuriesinroleexpirydate() {
        return injuriesinroleexpirydate;
    }

    public void setInjuriesinroleexpirydate(String injuriesinroleexpirydate) {
        this.injuriesinroleexpirydate = injuriesinroleexpirydate;
    }

    public String getLegalorcompensation() {
        return legalorcompensation;
    }

    public void setLegalorcompensation(String legalorcompensation) {
        this.legalorcompensation = legalorcompensation;
    }

    public String getLegalorcompensationnameofprovider() {
        return legalorcompensationnameofprovider;
    }

    public void setLegalorcompensationnameofprovider(String legalorcompensationnameofprovider) {
        this.legalorcompensationnameofprovider = legalorcompensationnameofprovider;
    }

    public String getLegalorcompensationexpirydate() {
        return legalorcompensationexpirydate;
    }

    public void setLegalorcompensationexpirydate(String legalorcompensationexpirydate) {
        this.legalorcompensationexpirydate = legalorcompensationexpirydate;
    }

    public String getReportingaccidents() {
        return reportingaccidents;
    }

    public void setReportingaccidents(String reportingaccidents) {
        this.reportingaccidents = reportingaccidents;
    }

    public String getHealthandsafetypolicy() {
        return healthandsafetypolicy;
    }

    public void setHealthandsafetypolicy(String healthandsafetypolicy) {
        this.healthandsafetypolicy = healthandsafetypolicy;
    }

    public String getHealthandsafetytraining() {
        return healthandsafetytraining;
    }

    public void setHealthandsafetytraining(String healthandsafetytraining) {
        this.healthandsafetytraining = healthandsafetytraining;
    }

    public String getSitevisits() {
        return sitevisits;
    }

    public void setSitevisits(String sitevisits) {
        this.sitevisits = sitevisits;
    }

    public String getReasons() {
        return reasons;
    }

    public void setReasons(String reasons) {
        this.reasons = reasons;
    }

    public String getConfidentialityordisclosure() {
        return confidentialityordisclosure;
    }

    public void setConfidentialityordisclosure(String confidentialityordisclosure) {
        this.confidentialityordisclosure = confidentialityordisclosure;
    }

    public String getDetailsofconfidentialityordisclosure() {
        return detailsofconfidentialityordisclosure;
    }

    public void setDetailsofconfidentialityordisclosure(String detailsofconfidentialityordisclosure) {
        this.detailsofconfidentialityordisclosure = detailsofconfidentialityordisclosure;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDeclarationjobtitle() {
        return declarationjobtitle;
    }

    public void setDeclarationjobtitle(String declarationjobtitle) {
        this.declarationjobtitle = declarationjobtitle;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public boolean isSubmitted() {
        return isSubmitted;
    }

    public void setSubmitted(boolean submitted) {
        isSubmitted = submitted;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Provider getProvider() {
        return provider;
    }

    public void setProvider(Provider provider) {
        this.provider = provider;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}
