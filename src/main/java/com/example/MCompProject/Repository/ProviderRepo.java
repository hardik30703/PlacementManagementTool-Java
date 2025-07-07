package com.example.MCompProject.Repository;

import com.example.MCompProject.Domain.Provider;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProviderRepo extends CrudRepository<Provider, Integer> {

    Provider findByUsername(String username);

    Provider findById(int providerId);

    Provider findByEmail(String providerEmail);

    @Query("SELECT p FROM Provider p JOIN p.providerForms pf WHERE pf.city = :city")
    List<Provider> findByCity(@Param("city") String city);

}
