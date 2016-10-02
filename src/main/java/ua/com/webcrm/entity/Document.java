package ua.com.webcrm.entity;

import ua.com.webcrm.entity.enums.StatusDoc;
import ua.com.webcrm.files.UploadFile;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Максим Беседа on 24.08.2016.
 */
@Entity
@Table(name = "documents")
public class Document {

    @Id
    @GeneratedValue
    private long id;

    private String name;
    private String info;
    private String resolution;

    @Column
    @Enumerated(EnumType.STRING)
    private StatusDoc status;

    @ManyToOne
    @JoinColumn(name = "client_id")
    private Client client;

    @ManyToOne
    @JoinColumn(name = "manager_id")
    private Manager manager;

    @ManyToOne
    @JoinColumn(name = "contract_id")
    private Contract contract;

    @OneToOne
    @JoinColumn(name = "task_id")
    private Task task;

    @OneToMany(mappedBy = "document", cascade = CascadeType.ALL)
    private List<UploadFile> files = new ArrayList<>();


    public Document() {
    }

    public Document(String name, StatusDoc status, Manager manager) {
        this.name = name;
        this.status = status;
        this.manager = manager;
    }

    public Document(String name, String info, StatusDoc status, Client client, Manager manager, Contract contract) {
        this.name = name;
        this.info = info;
        this.status = status;
        this.client = client;
        this.manager = manager;
        this.contract = contract;
    }

    public Document(String name, String info, String resolution, StatusDoc status, Client client, Manager manager,
                    Contract contract, Task task) {
        this.name = name;
        this.info = info;
        this.resolution = resolution;
        this.status = status;
        this.client = client;
        this.manager = manager;
        this.contract = contract;
        this.task = task;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getResolution() {
        return resolution;
    }

    public void setResolution(String resolution) {
        this.resolution = resolution;
    }

    public StatusDoc getStatus() {
        return status;
    }

    public void setStatus(StatusDoc status) {
        this.status = status;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public List<UploadFile> getFiles() {
        return files;
    }

    public void setFiles(List<UploadFile> uploadFiles) {
        this.files = uploadFiles;
    }

    public void addFiles(List<UploadFile> files) {
        for (UploadFile file : files) {
            file.setDocument(this);
            this.files.add(file);
        }
    }
}
