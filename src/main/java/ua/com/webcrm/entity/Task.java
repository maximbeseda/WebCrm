package ua.com.webcrm.entity;

import ua.com.webcrm.entity.enums.StatusTask;

import javax.persistence.*;
import java.util.Date;


@Entity
@Table(name = "tasks")
public class Task {

    @Id
    @GeneratedValue
    private long id;
    @Column(nullable = false)
    private String name;
    @Column(name = "dead_line", nullable = false)
    private Date deadLine;
    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private StatusTask status;
    private String info;

    @OneToOne
    @JoinColumn(name = "client_id")
    private Client client;

    @ManyToOne
    @JoinColumn(name = "manager_id")
    private Manager manager;

    @OneToOne
    @JoinColumn(name = "contract_id")
    private Contract contract;

    @OneToOne(mappedBy="task")
    private Document document;

    public Task() {

    }

    public Task(String name, Date deadLine, StatusTask status, Manager manager) {
        this.name = name;
        this.deadLine = deadLine;
        this.status = status;
        this.manager = manager;
    }

    public Task(String name, Date deadLine, StatusTask status, String info, Client client, Manager manager,
                Contract contract, Document document) {
        this.name = name;
        this.deadLine = deadLine;
        this.status = status;
        this.info = info;
        this.client = client;
        this.manager = manager;
        this.contract = contract;
        this.document = document;
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

    public Date getDeadLine() {
        return deadLine;
    }

    public void setDeadLine(Date deadLine) {
        this.deadLine = deadLine;
    }

    public StatusTask getStatus() {
        return status;
    }

    public void setStatus(StatusTask status) {
        this.status = status;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
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

    public Document getDocument() {
        return document;
    }

    public void setDocument(Document document) {
        this.document = document;
    }
}
