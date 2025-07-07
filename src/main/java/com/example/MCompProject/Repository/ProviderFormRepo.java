package com.example.MCompProject.Repository;

import com.example.MCompProject.Domain.Provider;
import com.example.MCompProject.Domain.ProviderForm;
import com.example.MCompProject.Domain.Student;
import org.springframework.data.repository.CrudRepository;

public interface ProviderFormRepo extends CrudRepository<ProviderForm, Integer> {
    ProviderForm findByProviderAndStudent(Provider provider, Student student);
}
