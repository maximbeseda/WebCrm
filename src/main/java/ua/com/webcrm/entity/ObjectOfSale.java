package ua.com.webcrm.entity;

import ua.com.webcrm.entity.enums.StatusObj;
import ua.com.webcrm.files.UploadFile;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Максим Беседа on 28.08.2016.
 */
@Entity
@Table(name = "objects")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "object_type")
public class ObjectOfSale extends AbstractObjectOfSale {

    @Column
    private String type;

    @OneToOne
    @JoinColumn(name = "manager_id")
    private Manager manager;

    @OneToMany(mappedBy="objectOfSale")
    private List<Contract> contracts = new ArrayList<>();

    @OneToMany(mappedBy = "objectOfSale", cascade = CascadeType.ALL)
    private List<UploadFile> uploadFiles = new ArrayList<>();

    @OneToOne(cascade = CascadeType.ALL)
    private UploadFile plan;

    public ObjectOfSale() {
    }

    public ObjectOfSale(String houseNumber, String level, Double totalSpace, Double priceUsd, StatusObj status, String type) {
        super(houseNumber, level, totalSpace, priceUsd, status);
        this.type = type;
    }

    public ObjectOfSale(String houseNumber, String level, Double totalSpace, Double priceUsd, StatusObj status, Double discount,
                        String type) {
        super(houseNumber, level, totalSpace, priceUsd, status, discount);
        this.type = type;
    }

    public ObjectOfSale(String houseNumber, String level, Double totalSpace, Double priceUsd, Double discount,
                        StatusObj status, String info, String type, Manager manager, Contract contract) {
        super(houseNumber, level, totalSpace, priceUsd, discount, status, info);
        this.manager = manager;
        this.contracts.add(contract);
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }

    public List<Contract> getContracts() {
        return contracts;
    }

    public void setContracts(List<Contract> contracts) {
        this.contracts = contracts;
    }

    public List<UploadFile> getUploadFiles() {
        return uploadFiles;
    }

    public void setUploadFiles(List<UploadFile> uploadFiles) {
        this.uploadFiles = uploadFiles;
    }

    public UploadFile getPlan() {
        return plan;
    }

    public void setPlan(UploadFile plan) {
        this.plan = plan;
    }
}
