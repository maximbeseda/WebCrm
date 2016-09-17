package ua.com.webcrm.entity;

import ua.com.webcrm.entity.enums.StatusObj;

import javax.persistence.*;

/**
 * Created by Максим Беседа on 24.08.2016.
 */
@MappedSuperclass
public abstract class AbstractObjectOfSale {

    @Id
    @GeneratedValue
    private long id;

    @Column(name = "house_number")
    private String houseNumber;
    @Column
    private String level;
    @Column(name = "total_space")
    private double totalSpace;
    @Column(name = "price_usd")
    private double priceUsd;
    private double discount;
    @Column(name = "discount_price_usd")
    private double discountPriceUsd;
    @Column
    @Enumerated(EnumType.STRING)
    private StatusObj status;
    @Column
    private String info;

    public AbstractObjectOfSale() {
    }

    public AbstractObjectOfSale(String houseNumber, String level, double totalSpace, double priceUsd, StatusObj status) {
        this.houseNumber = houseNumber;
        this.level = level;
        this.totalSpace = totalSpace;
        this.priceUsd = priceUsd;
        this.status = status;
    }

    public AbstractObjectOfSale(String houseNumber, String level, double totalSpace, double priceUsd, StatusObj status,
                                Double discount) {
        this.houseNumber = houseNumber;
        this.level = level;
        this.totalSpace = totalSpace;
        this.priceUsd = priceUsd;
        this.status = status;
        this.discount = discount;
        this.discountPriceUsd = discountPrice(priceUsd, discount);
    }

    public AbstractObjectOfSale(String houseNumber, String level, double totalSpace, double priceUsd, double discount,
                                StatusObj status, String info) {
        this.houseNumber = houseNumber;
        this.level = level;
        this.totalSpace = totalSpace;
        this.priceUsd = priceUsd;
        this.discount = discount;
        this.discountPriceUsd = discountPrice(priceUsd, discount);
        this.status = status;
        this.info = info;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getHouseNumber() {
        return houseNumber;
    }

    public void setHouseNumber(String houseNumber) {
        this.houseNumber = houseNumber;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public double getTotalSpace() {
        return totalSpace;
    }

    public void setTotalSpace(double totalSpace) {
        this.totalSpace = totalSpace;
    }

    public double getPriceUsd() {
        return priceUsd;
    }

    public void setPriceUsd(double priceUsd) {
        this.priceUsd = priceUsd;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getDiscountPriceUsd() {
        return discountPriceUsd;
    }

    public void setDiscountPriceUsd(double discountPriceUsd) {
        this.discountPriceUsd = discountPriceUsd;
    }

    public StatusObj getStatus() {
        return status;
    }

    public void setStatus(StatusObj status) {
        this.status = status;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public double discountPrice(double priceUsd, double discount){
        if (discount > 0 && discount <= 100) {
            double discountPrice = priceUsd * (100 - discount) / 100;
            return Math.rint(100 * discountPrice) / 100;
        } else {
            return priceUsd;
        }
    }
}
