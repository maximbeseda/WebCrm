package ua.com.webcrm.entity;

import org.springframework.data.annotation.Transient;
import ua.com.webcrm.entity.enums.StatusObj;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

/**
 * Created by Максим Беседа on 24.08.2016.
 */
@Entity
@DiscriminatorValue("parking")
public class Parking extends ObjectOfSale {

    @Column(name = "parking_number")
    private String parkingNumber;
    private String name;
    @Transient
    private final static String TYPE = "Паркинг";

    public Parking() {
    }

    public Parking(String houseNumber, String level, Double totalSpace, Double priceUsd, StatusObj status, String parkingNumber) {
        super(houseNumber, level, totalSpace, priceUsd, status, TYPE);
        this.parkingNumber = parkingNumber;
        this.name = houseNumber + "/" + parkingNumber;
    }

    public Parking(String houseNumber, String level, Double totalSpace, Double priceUsd, StatusObj status, String parkingNumber,
                   Double discount) {
        super(houseNumber, level, totalSpace, priceUsd, status, discount, TYPE);
        this.parkingNumber = parkingNumber;
        this.name = houseNumber + "/" + parkingNumber;
    }

    public Parking(String houseNumber, String level, Double totalSpace, Double priceUsd, Double discount,
                   StatusObj status, String info, Manager manager, Contract contract, String parkingNumber) {
        super(houseNumber, level, totalSpace, priceUsd, discount, status, info, TYPE, manager, contract);
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

    public static String getTYPE() {
        return TYPE;
    }
}
