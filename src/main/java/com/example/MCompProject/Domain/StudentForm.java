package com.example.MCompProject.Domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

@JsonIgnoreProperties({"student"})
@Entity
public class StudentForm {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int SFormID;

    private String firstname;

    private String lastname;

    private int studentnumber;

    private String studentemail;

    private String programme;

    private String department;

    private String telephonenumber;

    private String internationalstudent;

    private String studentvisa;

    private String nameoforganisation;

    private String addressofplacement;

    private String postcode;

    private String webaddress;

    private String contactname;

    private String contactjobtitle;

    private String contactemail;

    private String contacttelephonenumber;

    private String roletitle;

    private String rolestartdate;

    private String roleenddate;

    private double workinghours;

    private String probationperiod;

    private String lengthofprobationperiod;

    private int salary;

    private String source;

    private String informedplacementprovider;

    private String roledescription;

    private String workfromhome;

    private String howremotely;

    private String whyworkfromhome;

    private String commute;

    private String differentlocation;

    private String details;

    private String traveloverseas;

    private String travelguidance;

    private String traveltowork;

    private String accommodationarrangements;

    private String foreignoffice;

    private String risks;

    private String precautionarymeasures;

    private String safezone;

    private String healthinsurancecard;

    private String adjustments;

    private String travelapplication;

    private String riskassessmentescalation;

    private String name;

    private String signature;

    private String date;

    private boolean isSubmitted;

    private String status;

    @OneToOne
    @JoinColumn(name = "student_id")
    private Student student;


    public StudentForm(String firstname, String lastname, int studentnumber, String studentemail,
                       String programme, String department, String telephonenumber, String internationalstudent,
                       String studentvisa, String nameoforganisation, String addressofplacement,
                       String postcode, String webaddress, String contactname, String contactjobtitle,
                       String contactemail, String contacttelephonenumber, String roletitle,
                       String rolestartdate, String roleenddate, double workinghours, String probationperiod,
                       String lengthofprobationperiod, int salary, String source,
                       String informedplacementprovider, String roledescription, String workfromhome,
                       String howremotely, String whyworkfromhome, String commute, String differentlocation,
                       String details, String traveloverseas, String travelguidance, String traveltowork,
                       String accommodationarrangements, String foreignoffice, String risks,
                       String precautionarymeasures, String safezone, String healthinsurancecard,
                       String adjustments, String travelapplication, String riskassessmentescalation,
                       String name, String signature, String date) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.studentnumber = studentnumber;
        this.studentemail = studentemail;
        this.programme = programme;
        this.department = department;
        this.telephonenumber = telephonenumber;
        this.internationalstudent = internationalstudent;
        this.studentvisa = studentvisa;
        this.nameoforganisation = nameoforganisation;
        this.addressofplacement = addressofplacement;
        this.postcode = postcode;
        this.webaddress = webaddress;
        this.contactname = contactname;
        this.contactjobtitle = contactjobtitle;
        this.contactemail = contactemail;
        this.contacttelephonenumber = contacttelephonenumber;
        this.roletitle = roletitle;
        this.rolestartdate = rolestartdate;
        this.roleenddate = roleenddate;
        this.workinghours = workinghours;
        this.probationperiod = probationperiod;
        this.lengthofprobationperiod = lengthofprobationperiod;
        this.salary = salary;
        this.source = source;
        this.informedplacementprovider = informedplacementprovider;
        this.roledescription = roledescription;
        this.workfromhome = workfromhome;
        this.howremotely = howremotely;
        this.whyworkfromhome = whyworkfromhome;
        this.commute = commute;
        this.differentlocation = differentlocation;
        this.details = details;
        this.traveloverseas = traveloverseas;
        this.travelguidance = travelguidance;
        this.traveltowork = traveltowork;
        this.accommodationarrangements = accommodationarrangements;
        this.foreignoffice = foreignoffice;
        this.risks = risks;
        this.precautionarymeasures = precautionarymeasures;
        this.safezone = safezone;
        this.healthinsurancecard = healthinsurancecard;
        this.adjustments = adjustments;
        this.travelapplication = travelapplication;
        this.riskassessmentescalation = riskassessmentescalation;
        this.name = name;
        this.signature = signature;
        this.date = date;
    }

    public StudentForm() {

    }

    public int getSFormID() {
        return SFormID;
    }

    public void setSFormID(int SFormID) {
        this.SFormID = SFormID;
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

    public int getStudentnumber() {
        return studentnumber;
    }

    public void setStudentnumber(int studentnumber) {
        this.studentnumber = studentnumber;
    }

    public String getStudentemail() {
        return studentemail;
    }

    public void setStudentemail(String studentemail) {
        this.studentemail = studentemail;
    }

    public String getProgramme() {
        return programme;
    }

    public void setProgramme(String programme) {
        this.programme = programme;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getTelephonenumber() {
        return telephonenumber;
    }

    public void setTelephonenumber(String telephonenumber) {
        this.telephonenumber = telephonenumber;
    }


    public String getInternationalstudent() {
        return internationalstudent;
    }

    public void setInternationalstudent(String internationalstudent) {
        this.internationalstudent = internationalstudent;
    }

    public String getStudentvisa() {
        return studentvisa;
    }

    public void setStudentvisa(String studentvisa) {
        this.studentvisa = studentvisa;
    }

    public String getNameoforganisation() {
        return nameoforganisation;
    }

    public void setNameoforganisation(String nameoforganisation) {
        this.nameoforganisation = nameoforganisation;
    }

    public String getAddressofplacement() {
        return addressofplacement;
    }

    public void setAddressofplacement(String addressofplacement) {
        this.addressofplacement = addressofplacement;
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

    public String getContactname() {
        return contactname;
    }

    public void setContactname(String contactname) {
        this.contactname = contactname;
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

    public String getRoletitle() {
        return roletitle;
    }

    public void setRoletitle(String roletitle) {
        this.roletitle = roletitle;
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

    public String getLengthofprobationperiod() {
        return lengthofprobationperiod;
    }

    public void setLengthofprobationperiod(String lengthofprobationperiod) {
        this.lengthofprobationperiod = lengthofprobationperiod;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getInformedplacementprovider() {
        return informedplacementprovider;
    }

    public void setInformedplacementprovider(String informedplacementprovider) {
        this.informedplacementprovider = informedplacementprovider;
    }

    public String getRoledescription() {
        return roledescription;
    }

    public void setRoledescription(String roledescription) {
        this.roledescription = roledescription;
    }

    public String getWorkfromhome() {
        return workfromhome;
    }

    public void setWorkfromhome(String workfromhome) {
        this.workfromhome = workfromhome;
    }

    public String getHowremotely() {
        return howremotely;
    }

    public void setHowremotely(String howremotely) {
        this.howremotely = howremotely;
    }

    public String getWhyworkfromhome() {
        return whyworkfromhome;
    }

    public void setWhyworkfromhome(String whyworkfromhome) {
        this.whyworkfromhome = whyworkfromhome;
    }

    public String getCommute() {
        return commute;
    }

    public void setCommute(String commute) {
        this.commute = commute;
    }

    public String getDifferentlocation() {
        return differentlocation;
    }

    public void setDifferentlocation(String differentlocation) {
        this.differentlocation = differentlocation;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getTraveloverseas() {
        return traveloverseas;
    }

    public void setTraveloverseas(String traveloverseas) {
        this.traveloverseas = traveloverseas;
    }

    public String getTravelguidance() {
        return travelguidance;
    }

    public void setTravelguidance(String travelguidance) {
        this.travelguidance = travelguidance;
    }

    public String getTraveltowork() {
        return traveltowork;
    }

    public void setTraveltowork(String traveltowork) {
        this.traveltowork = traveltowork;
    }

    public String getAccommodationarrangements() {
        return accommodationarrangements;
    }

    public void setAccommodationarrangements(String accommodationarrangements) {
        this.accommodationarrangements = accommodationarrangements;
    }

    public String getForeignoffice() {
        return foreignoffice;
    }

    public void setForeignoffice(String foreignoffice) {
        this.foreignoffice = foreignoffice;
    }

    public String getRisks() {
        return risks;
    }

    public void setRisks(String risks) {
        this.risks = risks;
    }

    public String getPrecautionarymeasures() {
        return precautionarymeasures;
    }

    public void setPrecautionarymeasures(String precautionarymeasures) {
        this.precautionarymeasures = precautionarymeasures;
    }

    public String getSafezone() {
        return safezone;
    }

    public void setSafezone(String safezone) {
        this.safezone = safezone;
    }

    public String getHealthinsurancecard() {
        return healthinsurancecard;
    }

    public void setHealthinsurancecard(String healthinsurancecard) {
        this.healthinsurancecard = healthinsurancecard;
    }

    public String getAdjustments() {
        return adjustments;
    }

    public void setAdjustments(String adjustments) {
        this.adjustments = adjustments;
    }

    public String getTravelapplication() {
        return travelapplication;
    }

    public void setTravelapplication(String travelapplication) {
        this.travelapplication = travelapplication;
    }

    public String getRiskassessmentescalation() {
        return riskassessmentescalation;
    }

    public void setRiskassessmentescalation(String riskassessmentescalation) {
        this.riskassessmentescalation = riskassessmentescalation;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public void setSubmitted(boolean isSubmitted) {
        this.isSubmitted = isSubmitted;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

}
