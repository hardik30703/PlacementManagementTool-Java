package com.example.MCompProject.Domain;

import javax.persistence.*;

@Entity
public class StudentAvailability {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int SAId;

    private int slotId;

    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student student;


    public StudentAvailability() {
    }

    public StudentAvailability(int slotId, Student student) {
        this.slotId = slotId;
        this.student = student;
    }


    public int getSAId() {
        return SAId;
    }

    public void setSAId(int SAId) {
        this.SAId = SAId;
    }

    public int getSlotId() {
        return slotId;
    }

    public void setSlotId(int slotId) {
        this.slotId = slotId;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}

