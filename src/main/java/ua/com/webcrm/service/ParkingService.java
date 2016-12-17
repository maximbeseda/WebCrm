package ua.com.webcrm.service;

import ua.com.webcrm.entity.Parking;

import java.util.List;


public interface ParkingService {
    Parking addParking(Parking parking);
    void delete(long id);
    Parking getByName(String name);
    Parking getById(long id);
    Parking editParking(Parking parking);
    List<Parking> getAll();
}
