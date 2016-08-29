package ua.com.webcrm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.com.webcrm.entity.Manager;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
public interface ManagerRepository extends JpaRepository<Manager, Long> {

    @Query("SELECT m FROM Manager m WHERE m.fullName = :name")
    Manager findByName(@Param("name") String name);

    @Query("SELECT m FROM Manager m where m.login = :login")
    Manager findByLogin(@Param("login") String login);
}
