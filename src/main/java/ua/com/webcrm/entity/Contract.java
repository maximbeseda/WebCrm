package ua.com.webcrm.entity;

import ua.com.webcrm.entity.enums.ContractType;
import ua.com.webcrm.entity.enums.StatusContract;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Максим Беседа on 24.08.2016.
 */
@Entity
@Table(name = "Contracts")
public class Contract {

    @Id
    @GeneratedValue
    private long id;

    @Column(name = "contract_type", nullable = false)
    @Enumerated(EnumType.STRING)
    private ContractType contractType;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private StatusContract status;

    private String number;
    private String date;
    private Double amountUSD;
    private Double amountUAH;
    private Double rate;


    @ManyToOne
    @JoinColumn(name = "client_id")
    private Client client;

    @ManyToOne
    @JoinColumn(name = "manager_id")
    private Manager manager;

    @OneToOne
    @JoinColumn(name = "objectOfSale_id")
    private ObjectOfSale objectOfSale;

    @OneToMany(mappedBy = "contract", cascade = CascadeType.ALL)
    private List<Document> documents;

    @OneToMany(mappedBy = "contract", cascade = CascadeType.ALL)
    private List<Invoice> invoices;

    public Contract() {
    }

    public Contract(ContractType contractType, StatusContract status, Client client, Manager manager) {
        this.contractType = contractType;
        this.status = status;
        this.client = client;
        this.manager = manager;
    }

    public Contract(ContractType contractType, StatusContract status, String number, String date, Double amountUSD,
                    Double amountUAH, Double rate, Client client, Manager manager, ObjectOfSale objectOfSale,
                    List<Document> documents, List<Invoice> invoices) {
        this.contractType = contractType;
        this.status = status;
        this.number = number;
        this.date = date;
        this.amountUSD = amountUSD;
        this.amountUAH = amountUAH;
        this.rate = rate;
        this.client = client;
        this.manager = manager;
        this.objectOfSale = objectOfSale;
        this.documents = documents;
        this.invoices = invoices;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public ContractType getContractType() {
        return contractType;
    }

    public void setContractType(ContractType contractType) {
        this.contractType = contractType;
    }

    public StatusContract getStatus() {
        return status;
    }

    public void setStatus(StatusContract status) {
        this.status = status;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Double getAmountUSD() {
        return amountUSD;
    }

    public void setAmountUSD(Double amountUSD) {
        this.amountUSD = amountUSD;
    }

    public Double getAmountUAH() {
        return amountUAH;
    }

    public void setAmountUAH(Double amountUAH) {
        this.amountUAH = amountUAH;
    }

    public Double getRate() {
        return rate;
    }

    public void setRate(Double rate) {
        this.rate = rate;
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

    public ObjectOfSale getObjectOfSale() {
        return objectOfSale;
    }

    public void setObjectOfSale(ObjectOfSale objectOfSale) {
        this.objectOfSale = objectOfSale;
    }

    public List<Document> getDocuments() {
        return documents;
    }

    public void setDocuments(List<Document> documents) {
        this.documents = documents;
    }

    public List<Invoice> getInvoices() {
        return invoices;
    }

    public void setInvoices(List<Invoice> invoices) {
        this.invoices = invoices;
    }
}
