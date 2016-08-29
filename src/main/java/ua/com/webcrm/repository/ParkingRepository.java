package ua.com.webcrm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.com.webcrm.entity.Parking;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
public interface ParkingRepository extends JpaRepository<Parking, Long> {
    @Query("SELECT p FROM Parking p WHERE p.name = :name")
    Parking findByName(@Param("name") String name);
}
