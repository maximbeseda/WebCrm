package ua.com.webcrm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.com.webcrm.entity.Apartment;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
public interface ApartmentRepository extends JpaRepository<Apartment, Long> {
    @Query("SELECT a FROM Apartment a WHERE a.name = :name")
    Apartment findByName(@Param("name") String name);
}
