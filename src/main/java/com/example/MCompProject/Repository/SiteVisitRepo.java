package com.example.MCompProject.Repository;

import com.example.MCompProject.Domain.Provider;
import com.example.MCompProject.Domain.SiteVisit;
import com.example.MCompProject.Domain.Student;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface SiteVisitRepo extends CrudRepository<SiteVisit, Integer> {

    @Query("SELECT sv FROM SiteVisit sv JOIN sv.provider p JOIN p.providerForms pf WHERE pf.city = :city")
    List<SiteVisit> findByCity(String city);

    @Query("SELECT sv FROM SiteVisit sv JOIN sv.provider p JOIN p.providerForms pf WHERE sv.date = :date AND pf.city = :city")
    List<SiteVisit> findByDateAndCity(@Param("date") String date, @Param("city") String city);

    @Query("SELECT DISTINCT sv.date FROM SiteVisit sv JOIN sv.provider p JOIN p.providerForms pf WHERE pf.city = :city")
    List<String> findDistinctDatesByCity(@Param("city") String city);

    @Query("SELECT sv FROM SiteVisit sv JOIN sv.provider p JOIN p.providerForms pf WHERE sv.date = :date AND pf.city = :city ORDER BY sv.startTime ASC")
    List<SiteVisit> findByDateAndCityOrderedByTime(@Param("date") String date, @Param("city") String city);


    List<SiteVisit> findAllByOrderByDateAscStartTimeAsc();
}
