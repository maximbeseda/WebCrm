package ua.com.webcrm.service;

import ua.com.webcrm.entity.ObjectOfSale;

import java.util.List;

/**
 * Created by Максим Беседа on 10.09.2016.
 */
public interface ObjectService {
    List<ObjectOfSale> getAll();
    void delete (long id);
    ObjectOfSale getById(long id);
    ObjectOfSale editObject(ObjectOfSale objectOfSale);
}
