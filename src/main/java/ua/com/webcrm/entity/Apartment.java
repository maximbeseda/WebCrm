package ua.com.webcrm.entity;

import ua.com.webcrm.entity.enums.StatusObj;

import javax.persistence.*;

/**
 * Created by Максим Беседа on 24.08.2016.
 */
@Entity
@DiscriminatorValue("apartment")
public class Apartment extends ObjectOfSale {

    @Column(name = "living_space", nullable = false)
    private Double livingSpace;
    @Column(name = "apartment_number", nullable = false)
    private String apartmentNumber;
    @Column(name = "rooms", nullable = false)
    private Integer rooms;
    private String name;

    public Apartment() {
    }

    public Apartment(String houseNumber, String level, Double totalSpace, Double priceUsd, StatusObj status,
                     Double livingSpace, String apartmentNumber, Integer rooms) {
        super(houseNumber, level, totalSpace, priceUsd, status);
        this.livingSpace = livingSpace;
        this.apartmentNumber = apartmentNumber;
        this.rooms = rooms;
        this.name = houseNumber + "/" + apartmentNumber;
    }

    public Apartment(String houseNumber, String level, Double totalSpace, Double priceUsd, Double discount,
                     Double discountPriceUsd, StatusObj status, String info, Manager manager, Contract contract,
                     Double livingSpace, String apartmentNumber, Integer rooms) {
        super(houseNumber, level, totalSpace, priceUsd, discount, discountPriceUsd, status, info, manager, contract);
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
}
