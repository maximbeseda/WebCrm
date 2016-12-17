package ua.com.webcrm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.webcrm.entity.ObjectOfSale;


public interface ObjectRepository extends JpaRepository<ObjectOfSale, Long> {
}
