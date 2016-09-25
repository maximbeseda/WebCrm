package ua.com.webcrm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.com.webcrm.files.UploadFile;
import ua.com.webcrm.repository.UploadFileRepository;
import ua.com.webcrm.service.UploadFileService;

import java.util.List;

/**
 * Created by Максим Беседа on 24.09.2016.
 */
@Service
public class UploadFileServiceImpl implements UploadFileService {

    @Autowired
    private UploadFileRepository uploadFileRepository;

    @Override
    @Transactional
    public UploadFile addFile(UploadFile uploadFile) {
        UploadFile savedUploadFile = uploadFileRepository.save(uploadFile);
        return savedUploadFile;
    }

    @Override
    @Transactional
    public void delete(long id) {
        uploadFileRepository.delete(id);
    }

    @Override
    @Transactional
    public UploadFile editFile(UploadFile uploadFile) {
        return uploadFileRepository.save(uploadFile);
    }

    @Override
    @Transactional
    public UploadFile getById(long id) {
        return uploadFileRepository.findOne(id);
    }

    @Override
    @Transactional
    public List<UploadFile> getAll() {
        return uploadFileRepository.findAll();
    }
}
