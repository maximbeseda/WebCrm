package ua.com.webcrm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.com.webcrm.entity.Apartment;
import ua.com.webcrm.repository.ApartmentRepository;
import ua.com.webcrm.service.ApartmentService;

import java.util.List;


@Service
public class ApartmentServiceImpl implements ApartmentService {

    @Autowired
    private ApartmentRepository apartmentRepository;

    @Override
    @Transactional
    public Apartment addApartment(Apartment apartment) {
        Apartment savedApartment = apartmentRepository.save(apartment);
        return savedApartment;
    }

    @Override
    @Transactional
    public void delete(long id) {
        apartmentRepository.delete(id);
    }

    @Override
    @Transactional
    public Apartment getByName(String name) {
        return apartmentRepository.findByName(name);
    }

    @Override
    @Transactional
    public Apartment editApartment(Apartment apartment) {
        return apartmentRepository.save(apartment);
    }

    @Override
    @Transactional
    public List<Apartment> getAll() {
        return apartmentRepository.findAll();
    }

    @Override
    @Transactional
    public Apartment getById(long id) {
        return apartmentRepository.findOne(id);
    }
}
