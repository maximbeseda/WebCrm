package ua.com.webcrm.entity;

import ua.com.webcrm.entity.enums.ManagerRole;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Максим Беседа on 24.08.2016.
 */
@Entity
@Table(name = "managers")
public class Manager extends Contact {

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private ManagerRole role;
    @Column(nullable = false, unique = true)
    private String login;
    @Column(nullable = false)
    private String password;


    @OneToMany(mappedBy = "manager", cascade = CascadeType.ALL)
    private List<Client> clients = new ArrayList<>();

    @OneToMany(mappedBy = "manager", cascade = CascadeType.ALL)
    private List<Contract> contracts = new ArrayList<>();

    @OneToMany(mappedBy = "manager", cascade = CascadeType.ALL)
    private List<Document> documents = new ArrayList<>();

    @OneToMany(mappedBy = "manager", cascade = CascadeType.ALL)
    private List<Task> tasks = new ArrayList<>();


    public Manager() {
    }

    public Manager(String fullName, String phone, ManagerRole role, String login, String password) {
        super(fullName, phone);
        this.role = role;
        this.login = login;
        this.password = password;
    }

    public Manager(String fullName, String phone, String email, String address, String passport, String identNumber,
                   String dateBirth, ManagerRole role, String login, String password) {
        super(fullName, phone, email, address, passport, identNumber, dateBirth);
        this.role = role;
        this.login = login;
        this.password = password;
    }

    public Manager(String fullName, String phone, String email, String address, String passport, String identNumber,
                   String dateBirth, ManagerRole role, String login, String password, List<Client> clients,
                   List<Contract> contracts, List<Document> documents, List<Task> tasks) {
        super(fullName, phone, email, address, passport, identNumber, dateBirth);
        this.role = role;
        this.login = login;
        this.password = password;
        this.clients = clients;
        this.contracts = contracts;
        this.documents = documents;
        this.tasks = tasks;
    }

    public ManagerRole getRole() {
        return role;
    }

    public void setRole(ManagerRole role) {
        this.role = role;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Client> getClients() {
        return clients;
    }

    public void setClients(List<Client> clients) {
        this.clients = clients;
    }

    public List<Contract> getContracts() {
        return contracts;
    }

    public void setContracts(List<Contract> contracts) {
        this.contracts = contracts;
    }

    public List<Document> getDocuments() {
        return documents;
    }

    public void setDocuments(List<Document> documents) {
        this.documents = documents;
    }

    public List<Task> getTasks() {
        return tasks;
    }

    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }
}
