package ua.com.webcrm.entity;

import ua.com.webcrm.entity.enums.StatusObj;

import javax.persistence.*;

/**
 * Created by Максим Беседа on 28.08.2016.
 */
@Entity
@Table(name = "Objects")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "object_type")
public class ObjectOfSale extends AbstractObjectOfSale {

    @Column
    private String type;

    @OneToOne
    @JoinColumn(name = "manager_id")
    private Manager manager;

    @OneToOne(mappedBy="objectOfSale")
    private Contract contract;

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
        this.contract = contract;
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

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }
}
