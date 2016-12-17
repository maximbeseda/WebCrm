package ua.com.webcrm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.webcrm.files.UploadFile;


public interface UploadFileRepository extends JpaRepository<UploadFile, Long> {
}
