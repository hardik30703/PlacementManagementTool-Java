package com.example.MCompProject.Repository;

import com.example.MCompProject.Domain.Provider;
import com.example.MCompProject.Domain.ProviderAvailability;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ProviderAvailabilityRepo extends CrudRepository<ProviderAvailability, Integer> {

    @Query("SELECT pa FROM ProviderAvailability pa JOIN pa.provider p JOIN p.providerForms pf WHERE pf.city = :city")
    List<ProviderAvailability> findByCity(String city);

    void deleteByProvider(Provider provider);
}
