package ua.com.webcrm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.webcrm.entity.ObjectOfSale;

/**
 * Created by Максим Беседа on 10.09.2016.
 */
public interface ObjectRepository extends JpaRepository<ObjectOfSale, Long> {
}
