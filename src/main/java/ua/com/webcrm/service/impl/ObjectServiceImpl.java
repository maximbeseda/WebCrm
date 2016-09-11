package ua.com.webcrm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.com.webcrm.entity.ObjectOfSale;
import ua.com.webcrm.repository.ObjectRepository;
import ua.com.webcrm.service.ObjectService;

import java.util.List;

/**
 * Created by Максим Беседа on 10.09.2016.
 */
@Service
public class ObjectServiceImpl implements ObjectService {

    @Autowired
    private ObjectRepository objectRepository;

    @Override
    @Transactional
    public List<ObjectOfSale> getAll() {
        return objectRepository.findAll();
    }

    @Override
    @Transactional
    public void delete(long id) {
        objectRepository.delete(id);
    }

    @Override
    @Transactional
    public ObjectOfSale getById(long id) {
        return objectRepository.findOne(id);
    }
}
