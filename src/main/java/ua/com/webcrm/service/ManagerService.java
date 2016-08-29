package ua.com.webcrm.service;

import ua.com.webcrm.entity.Manager;

import java.util.List;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
public interface ManagerService {
    Manager addManager(Manager manager);
    void delete(long id);
    Manager getByName(String name);
    Manager getByLogin(String login);
    Manager editManager(Manager manager);
    List<Manager> getAll();
}
