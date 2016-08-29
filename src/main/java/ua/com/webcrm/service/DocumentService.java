package ua.com.webcrm.service;

import ua.com.webcrm.entity.Document;

import java.util.List;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
public interface DocumentService {
    Document addDocument(Document document);
    void delete(long id);
    Document getByName(String name);
    Document editDocument(Document document);
    List<Document> getAll();
}
