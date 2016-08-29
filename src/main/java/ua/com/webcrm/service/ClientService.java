package ua.com.webcrm.service;

import ua.com.webcrm.entity.Client;

import java.util.List;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
public interface ClientService {
    Client addClient(Client client);
    void delete (long id);
    Client getByName(String name);
    Client editClient(Client client);
    List<Client> getAll();
}
