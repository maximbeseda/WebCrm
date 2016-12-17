package ua.com.webcrm.service;

import ua.com.webcrm.files.UploadFile;

import java.util.List;


public interface UploadFileService {
    UploadFile addFile (UploadFile uploadFile);
    void delete(long id);
    UploadFile editFile(UploadFile uploadFile);
    UploadFile getById(long id);
    List<UploadFile> getAll();
}
