package com.example.MCompProject.Repository;

import com.example.MCompProject.Domain.TutorTimeSlot;
import org.springframework.data.repository.CrudRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface TutorTimeSlotRepo  extends CrudRepository<TutorTimeSlot, Integer> {
    List<TutorTimeSlot> findByCity(String city);

    List<TutorTimeSlot> findByCityAndDate(String city, String date);

    void deleteByCityAndDate(String city, String date);
}
