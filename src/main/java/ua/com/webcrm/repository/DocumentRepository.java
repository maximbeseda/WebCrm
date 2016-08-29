package ua.com.webcrm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.com.webcrm.entity.Document;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
public interface DocumentRepository extends JpaRepository<Document, Long> {
    @Query("SELECT d FROM Document d WHERE d.name = :name")
    Document findByName(@Param("name") String name);
}
