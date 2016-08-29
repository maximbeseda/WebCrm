package ua.com.webcrm.service;

import ua.com.webcrm.entity.Parking;

import java.util.List;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
public interface ParkingService {
    Parking addParking(Parking parking);
    void delete(long id);
    Parking getByName(String name);
    Parking editParking(Parking parking);
    List<Parking> getAll();
}
