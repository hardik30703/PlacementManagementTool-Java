package com.example.MCompProject.Repository;

import com.example.MCompProject.Domain.Tutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TutorRepo extends CrudRepository<Tutor, Integer> {

    Tutor findByUsername(String username);
}
