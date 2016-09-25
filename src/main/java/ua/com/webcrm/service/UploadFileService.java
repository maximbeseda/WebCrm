package ua.com.webcrm.service;

import ua.com.webcrm.files.UploadFile;

import java.util.List;

/**
 * Created by Максим Беседа on 24.09.2016.
 */
public interface UploadFileService {
    UploadFile addFile (UploadFile uploadFile);
    void delete(long id);
    UploadFile editFile(UploadFile uploadFile);
    UploadFile getById(long id);
    List<UploadFile> getAll();
}
