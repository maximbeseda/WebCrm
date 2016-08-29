package ua.com.webcrm.service;

import ua.com.webcrm.entity.Apartment;

import java.util.List;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
public interface ApartmentService {
    Apartment addApartment(Apartment apartment);
    void delete (long id);
    Apartment getByName(String name);
    Apartment editApartment(Apartment apartment);
    List<Apartment> getAll();
}
