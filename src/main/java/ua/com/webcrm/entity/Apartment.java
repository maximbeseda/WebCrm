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
    private double livingSpace;
    @Column(name = "apartment_number")
    private String apartmentNumber;
    @Column(name = "rooms")
    private int rooms;
    @Column
    private String name;
    @Transient
    private final static String TYPE = "Квартира";

    public Apartment() {
    }

    public Apartment(String houseNumber, String apartmentNumber, String level, double totalSpace, double priceUsd, StatusObj status,
                     Double livingSpace, int rooms, String info) {
        super(houseNumber, level, totalSpace, priceUsd, status, TYPE, info);
        this.livingSpace = livingSpace;
        this.apartmentNumber = apartmentNumber;
        this.rooms = rooms;
        this.name = houseNumber + "/" + apartmentNumber;
    }

    public Apartment(String houseNumber, String apartmentNumber, String level, double totalSpace, double priceUsd, double discount,
                     StatusObj status, double livingSpace, int rooms, String info) {
        super(houseNumber, level, totalSpace, priceUsd, status, discount, TYPE, info);
        this.livingSpace = livingSpace;
        this.apartmentNumber = apartmentNumber;
        this.rooms = rooms;
        this.name = houseNumber + "/" + apartmentNumber;
    }

    public Apartment(String houseNumber, String level, double totalSpace, double priceUsd, double discount,
                     StatusObj status, String info, Manager manager, Contract contract, double livingSpace,
                     String apartmentNumber, int rooms) {
        super(houseNumber, level, totalSpace, priceUsd, discount, status, info, TYPE, manager, contract);
        this.livingSpace = livingSpace;
        this.apartmentNumber = apartmentNumber;
        this.rooms = rooms;
        this.name = houseNumber + "/" + apartmentNumber;
    }

    public double getLivingSpace() {
        return livingSpace;
    }

    public void setLivingSpace(double livingSpace) {
        this.livingSpace = livingSpace;
    }

    public String getApartmentNumber() {
        return apartmentNumber;
    }

    public void setApartmentNumber(String apartmentNumber) {
        this.apartmentNumber = apartmentNumber;
    }

    public int getRooms() {
        return rooms;
    }

    public void setRooms(int rooms) {
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
