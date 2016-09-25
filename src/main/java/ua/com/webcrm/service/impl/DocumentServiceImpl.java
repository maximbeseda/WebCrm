package ua.com.webcrm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.com.webcrm.entity.Document;
import ua.com.webcrm.repository.DocumentRepository;
import ua.com.webcrm.service.DocumentService;

import java.util.List;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
@Service
public class DocumentServiceImpl implements DocumentService {

    @Autowired
    private DocumentRepository documentRepository;

    @Override
    @Transactional
    public Document addDocument(Document document) {
        Document savedDocument = documentRepository.save(document);
        return savedDocument;
    }

    @Override
    @Transactional
    public void delete(long id) {
        documentRepository.delete(id);
    }

    @Override
    @Transactional
    public Document getByName(String name) {
        return documentRepository.findByName(name);
    }

    @Override
    @Transactional
    public Document editDocument(Document document) {
        return documentRepository.save(document);
    }

    @Override
    @Transactional
    public List<Document> getAll() {
        return documentRepository.findAll();
    }

    @Override
    @Transactional
    public Document getById(long id) {
        return documentRepository.findOne(id);
    }
}
