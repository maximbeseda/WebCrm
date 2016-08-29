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

    @OneToOne
    @JoinColumn(name = "manager_id")
    private Manager manager;

    @OneToOne(mappedBy="objectOfSale")
    private Contract contract;

    public ObjectOfSale() {
    }

    public ObjectOfSale(String houseNumber, String level, Double totalSpace, Double priceUsd, StatusObj status) {
        super(houseNumber, level, totalSpace, priceUsd, status);
    }

    public ObjectOfSale(String houseNumber, String level, Double totalSpace, Double priceUsd, Double discount,
                        Double discountPriceUsd, StatusObj status, String info, Manager manager, Contract contract) {
        super(houseNumber, level, totalSpace, priceUsd, discount, discountPriceUsd, status, info);
        this.manager = manager;
        this.contract = contract;
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
