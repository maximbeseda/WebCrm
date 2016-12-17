package ua.com.webcrm.service;

import ua.com.webcrm.entity.ObjectOfSale;

import java.util.List;


public interface ObjectService {
    List<ObjectOfSale> getAll();
    void delete (long id);
    ObjectOfSale getById(long id);
    ObjectOfSale editObject(ObjectOfSale objectOfSale);
}
