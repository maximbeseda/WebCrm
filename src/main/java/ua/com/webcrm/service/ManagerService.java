package ua.com.webcrm.service;

import ua.com.webcrm.entity.Manager;
import ua.com.webcrm.entity.enums.ManagerRole;

import java.util.List;


public interface ManagerService {
    Manager addManager(Manager manager);
    void delete(long id);
    Manager getByName(String name);
    Manager getByLogin(String login);
    Manager getById(long id);
    Manager editManager(Manager manager);
    List<Manager> getAll();
    List<Manager> getByRole(ManagerRole managerRole);
}
