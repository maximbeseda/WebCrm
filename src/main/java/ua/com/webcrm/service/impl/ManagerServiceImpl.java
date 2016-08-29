package ua.com.webcrm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.com.webcrm.entity.Manager;
import ua.com.webcrm.repository.ManagerRepository;
import ua.com.webcrm.service.ManagerService;

import java.util.List;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerRepository managerRepository;

    @Override
    @Transactional
    public Manager addManager(Manager manager) {
        Manager savedManager = managerRepository.save(manager);
        return savedManager;
    }

    @Override
    @Transactional
    public void delete(long id) {
        managerRepository.delete(id);
    }

    @Override
    @Transactional
    public Manager getByName(String name) {
        return managerRepository.findByName(name);
    }

    @Override
    @Transactional
    public Manager getByLogin(String login) {
        return managerRepository.findByLogin(login);
    }

    @Override
    @Transactional
    public Manager editManager(Manager manager) {
        return managerRepository.save(manager);
    }

    @Override
    @Transactional
    public List<Manager> getAll() {
        return managerRepository.findAll();
    }
}
