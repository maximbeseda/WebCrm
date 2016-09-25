package ua.com.webcrm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.webcrm.files.UploadFile;

/**
 * Created by Максим Беседа on 24.09.2016.
 */
public interface UploadFileRepository extends JpaRepository<UploadFile, Long> {
}
