package com.example.MCompProject.Repository;

import com.example.MCompProject.Domain.Provider;
import com.example.MCompProject.Domain.Student;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface StudentRepo extends CrudRepository<Student, Integer> {

    Student findByUsername(String username);

    Student findByEmail(String email);

    Student findById(int studentId);

    List<Student> findByUsernameContainingIgnoreCase(String username);

    List<Student> findByProvider(Provider provider);

    @Query("SELECT s FROM Student s JOIN s.providerForm pf WHERE pf.city = :city")
    List<Student> findByCity(@Param("city") String city);


}
