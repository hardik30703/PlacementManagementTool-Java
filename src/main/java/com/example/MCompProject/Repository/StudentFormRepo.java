package com.example.MCompProject.Repository;

import com.example.MCompProject.Domain.StudentForm;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentFormRepo extends CrudRepository<StudentForm, Integer> {
    StudentForm findByStudent_StudentId(int studentId);
}
