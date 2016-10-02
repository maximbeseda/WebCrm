package ua.com.webcrm.entity;

import ua.com.webcrm.entity.enums.StatusContract;
import ua.com.webcrm.files.UploadFile;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Максим Беседа on 24.08.2016.
 */
@Entity
@Table(name = "contracts")
public class Contract {

    @Id
    @GeneratedValue
    private long id;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private StatusContract status;

    private String number;
    private Date date;
    private double amountUSD;
    private double amountUAH;
    private double rate;

    @ManyToOne
    @JoinColumn(name = "contractType_id")
    private ContractType contractType;

    @ManyToOne
    @JoinColumn(name = "client_id")
    private Client client;

    @ManyToOne
    @JoinColumn(name = "manager_id")
    private Manager manager;

    @ManyToOne
    @JoinColumn(name = "objectOfSale_id")
    private ObjectOfSale objectOfSale;

    @OneToMany(mappedBy = "contract", cascade = CascadeType.ALL)
    private List<Document> documents = new ArrayList<>();

    @OneToMany(mappedBy = "contract", cascade = CascadeType.ALL)
    private List<Invoice> invoices = new ArrayList<>();

    @OneToMany(mappedBy = "contract", cascade = CascadeType.ALL)
    private List<UploadFile> files = new ArrayList<>();

    public Contract() {
    }

    public Contract(ContractType contractType, StatusContract status, Client client, Manager manager, ObjectOfSale objectOfSale) {
        this.contractType = contractType;
        this.status = status;
        this.client = client;
        this.manager = manager;
        this.objectOfSale = objectOfSale;
    }

    public Contract(ContractType contractType, StatusContract status, String number, Date date, double amountUSD,
                    double rate, Client client, Manager manager, ObjectOfSale objectOfSale) {
        this.contractType = contractType;
        this.status = status;
        this.number = number;
        this.date = date;
        this.amountUSD = amountUSD;
        this.amountUAH = getAmountUAH(amountUSD, rate);
        this.rate = rate;
        this.client = client;
        this.manager = manager;
        this.objectOfSale = objectOfSale;
    }

    public Contract(ContractType contractType, StatusContract status, String number, Date date, double amountUSD,
                    double rate, Client client, Manager manager, ObjectOfSale objectOfSale,
                    List<Document> documents, List<Invoice> invoices) {
        this.contractType = contractType;
        this.status = status;
        this.number = number;
        this.date = date;
        this.amountUSD = amountUSD;
        this.amountUAH = getAmountUAH(amountUSD, rate);
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getAmountUSD() {
        return amountUSD;
    }

    public void setAmountUSD(double amountUSD) {
        this.amountUSD = amountUSD;
    }

    public double getAmountUAH() {
        return amountUAH;
    }

    public void setAmountUAH(double amountUAH) {
        this.amountUAH = amountUAH;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
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

    public List<UploadFile> getFiles() {
        return files;
    }

    public void setFiles(List<UploadFile> files) {
        this.files = files;
    }

    public double getAmountUAH(double amountUSD, double rate){
        if (amountUSD > 0 && rate > 0) {
            double amountUAH = amountUSD * rate;
            return Math.rint(100 * amountUAH) / 100;
        } else {
            return 0.0;
        }
    }

    public void addFiles(List<UploadFile> files) {
        for (UploadFile file : files) {
            file.setContract(this);
            this.files.add(file);
        }
    }
}
