package ua.com.webcrm.service;

import ua.com.webcrm.entity.Client;

import java.util.List;


public interface ClientService {
    Client addClient(Client client);
    void delete (long id);
    Client getByName(String name);
    Client getById(long id);
    Client editClient(Client client);
    List<Client> getAll();
}
