package com.example.MCompProject.Service;

import com.example.MCompProject.Domain.Provider;
import com.example.MCompProject.Domain.ProviderForm;
import com.example.MCompProject.Domain.Student;
import com.example.MCompProject.Repository.ProviderFormRepo;
import com.example.MCompProject.Repository.ProviderRepo;
import com.example.MCompProject.Repository.StudentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Service
public class ProviderService {

    @Autowired
    private ProviderRepo providerRepo;

    @Autowired
    private ProviderFormRepo providerFormRepo;

    @Autowired
    private StudentRepo studentRepo;

    @Autowired
    private GeocodingService geocodingService;


    public void saveProvider(Provider a) {
        providerRepo.save(a);
    }

    public Provider findByUsername(String username) {
        return providerRepo.findByUsername(username);
    }

    public Provider findById(int providerId) {
        return providerRepo.findById(providerId);
    }

    public Provider findByEmail(String providerEmail) {
        return providerRepo.findByEmail(providerEmail);
    }

    public List<Student> findAllStudentsByProvider(Provider provider) {
        return studentRepo.findByProvider(provider);
    }

    public List<Provider> getAllProviders() {
        return (List<Provider>) providerRepo.findAll();
    }

    public List<String> searchCities(String city) {
        return StreamSupport.stream(providerRepo.findAll().spliterator(), false)
                .flatMap(provider -> provider.getProviderForms().stream()) // Flatten the list of ProviderForms
                .map(ProviderForm::getCity) // Map to city names
                .filter(c -> c != null && c.toLowerCase().contains(city.toLowerCase())) // Filter out null values and match the city
                .distinct() // Remove duplicates
                .collect(Collectors.toList());
    }

    public List<Provider> findByCity(String city) {
        return providerRepo.findByCity(city);
    }


    //Provider Form
    public void saveProviderForm(ProviderForm a) {
        String city = geocodingService.getCityFromPostcode(a.getPostcode());
        a.setCity(city);
        providerFormRepo.save(a);
    }

    public ProviderForm findProviderFormByProviderAndStudent(Provider provider, Student student) {
        return providerFormRepo.findByProviderAndStudent(provider, student);
    }



}
