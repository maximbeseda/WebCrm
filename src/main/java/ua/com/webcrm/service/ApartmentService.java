package ua.com.webcrm.service;

import ua.com.webcrm.entity.Apartment;

import java.util.List;


public interface ApartmentService {
    Apartment addApartment(Apartment apartment);
    void delete (long id);
    Apartment getByName(String name);
    Apartment getById(long id);
    Apartment editApartment(Apartment apartment);
    List<Apartment> getAll();
}
