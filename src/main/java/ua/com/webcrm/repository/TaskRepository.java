package ua.com.webcrm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.com.webcrm.entity.Task;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
public interface TaskRepository extends JpaRepository<Task, Long> {
    @Query("SELECT t FROM Task t WHERE t.name = :name")
    Task findByName(@Param("name") String name);
}
