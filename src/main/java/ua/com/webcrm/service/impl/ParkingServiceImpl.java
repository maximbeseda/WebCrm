package ua.com.webcrm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.com.webcrm.entity.Parking;
import ua.com.webcrm.repository.ParkingRepository;
import ua.com.webcrm.service.ParkingService;

import java.util.List;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
@Service
public class ParkingServiceImpl implements ParkingService {

    @Autowired
    private ParkingRepository parkingRepository;

    @Override
    @Transactional
    public Parking addParking(Parking parking) {
        Parking savedParking = parkingRepository.save(parking);
        return savedParking;
    }

    @Override
    @Transactional
    public void delete(long id) {
        parkingRepository.delete(id);
    }

    @Override
    @Transactional
    public Parking getByName(String name) {
        return parkingRepository.findByName(name);
    }

    @Override
    @Transactional
    public Parking editParking(Parking parking) {
        return parkingRepository.save(parking);
    }

    @Override
    @Transactional
    public List<Parking> getAll() {
        return parkingRepository.findAll();
    }

    @Override
    public Parking getById(long id) {
        return parkingRepository.findOne(id);
    }
}
