package ua.com.webcrm.entity;

import ua.com.webcrm.entity.enums.StatusObj;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by Максим Беседа on 24.08.2016.
 */
@Entity
@DiscriminatorValue("parking")
public class Parking extends ObjectOfSale {

    @Column(name = "parking_number", nullable = false)
    private String parkingNumber;
    private String name;

    public Parking() {
    }

    public Parking(String houseNumber, String level, Double totalSpace, Double priceUsd, StatusObj status, String parkingNumber) {
        super(houseNumber, level, totalSpace, priceUsd, status);
        this.parkingNumber = parkingNumber;
        this.name = houseNumber + "/" + parkingNumber;
    }

    public Parking(String houseNumber, String level, Double totalSpace, Double priceUsd, Double discount, Double discountPriceUsd,
                   StatusObj status, String info, Manager manager, Contract contract, String parkingNumber) {
        super(houseNumber, level, totalSpace, priceUsd, discount, discountPriceUsd, status, info, manager, contract);
        this.parkingNumber = parkingNumber;
        this.name = houseNumber + "/" + parkingNumber;
    }

    public String getParkingNumber() {
        return parkingNumber;
    }

    public void setParkingNumber(String parkingNumber) {
        this.parkingNumber = parkingNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
