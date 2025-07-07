package com.example.MCompProject.Repository;

import com.example.MCompProject.Domain.Student;
import com.example.MCompProject.Domain.StudentAvailability;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface StudentAvailabilityRepo extends CrudRepository <StudentAvailability, Integer> {

    @Query("SELECT sa FROM StudentAvailability sa WHERE sa.student.providerForm.city = :city")
    List<StudentAvailability> findByCity(String city);

    void deleteByStudent(Student student);
}
