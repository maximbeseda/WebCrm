package ua.com.webcrm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.com.webcrm.entity.Client;
import ua.com.webcrm.repository.ClientRepository;
import ua.com.webcrm.service.ClientService;

import java.util.List;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
@Service
public class ClientServiceImpl implements ClientService {

    @Autowired
    private ClientRepository clientRepository;

    @Override
    @Transactional
    public Client addClient(Client client) {
        Client savedClient = clientRepository.save(client);
        return savedClient;
    }

    @Override
    @Transactional
    public void delete(long id) {
        clientRepository.delete(id);
    }

    @Override
    @Transactional
    public Client getByName(String name) {
        return clientRepository.findByName(name);
    }

    @Override
    @Transactional
    public Client editClient(Client client) {
        return clientRepository.save(client);
    }

    @Override
    @Transactional
    public List<Client> getAll() {
        return clientRepository.findAll();
    }
}
