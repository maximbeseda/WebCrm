package ua.com.webcrm.service;

import ua.com.webcrm.entity.Document;

import java.util.List;


public interface DocumentService {
    Document addDocument(Document document);
    void delete(long id);
    Document getByName(String name);
    Document getById(long id);
    Document editDocument(Document document);
    List<Document> getAll();
}
