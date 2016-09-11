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
@DiscriminatorValue("apartment")
public class Apartment extends ObjectOfSale {

    @Column(name = "living_space")
    private Double livingSpace;
    @Column(name = "apartment_number")
    private String apartmentNumber;
    @Column(name = "rooms")
    private Integer rooms;
    @Column
    private String name;
    @Transient
    private final static String TYPE = "Квартира";

    public Apartment() {
    }

    public Apartment(String houseNumber, String apartmentNumber, String level, Double totalSpace, Double priceUsd, StatusObj status,
                     Double livingSpace, Integer rooms) {
        super(houseNumber, level, totalSpace, priceUsd, status, TYPE);
        this.livingSpace = livingSpace;
        this.apartmentNumber = apartmentNumber;
        this.rooms = rooms;
        this.name = houseNumber + "/" + apartmentNumber;
    }

    public Apartment(String houseNumber, String apartmentNumber, String level, Double totalSpace, Double priceUsd, Double discount,
                     StatusObj status, Double livingSpace, Integer rooms) {
        super(houseNumber, level, totalSpace, priceUsd, status, discount, TYPE);
        this.livingSpace = livingSpace;
        this.apartmentNumber = apartmentNumber;
        this.rooms = rooms;
        this.name = houseNumber + "/" + apartmentNumber;
    }

    public Apartment(String houseNumber, String level, Double totalSpace, Double priceUsd, Double discount,
                     StatusObj status, String info, Manager manager, Contract contract, Double livingSpace,
                     String apartmentNumber, Integer rooms) {
        super(houseNumber, level, totalSpace, priceUsd, discount, status, info, TYPE, manager, contract);
        this.livingSpace = livingSpace;
        this.apartmentNumber = apartmentNumber;
        this.rooms = rooms;
        this.name = houseNumber + "/" + apartmentNumber;
    }

    public Double getLivingSpace() {
        return livingSpace;
    }

    public void setLivingSpace(Double livingSpace) {
        this.livingSpace = livingSpace;
    }

    public String getApartmentNumber() {
        return apartmentNumber;
    }

    public void setApartmentNumber(String apartmentNumber) {
        this.apartmentNumber = apartmentNumber;
    }

    public Integer getRooms() {
        return rooms;
    }

    public void setRooms(Integer rooms) {
        this.rooms = rooms;
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
