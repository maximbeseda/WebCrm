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

    @Column(name = "house_number", nullable = false)
    private String houseNumber;
    @Column(nullable = false)
    private String level;
    @Column(name = "total_space", nullable = false)
    private Double totalSpace;
    @Column(name = "price_usd", nullable = false)
    private Double priceUsd;
    private Double discount;
    @Column(name = "discount_price_usd")
    private Double discountPriceUsd;
    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private StatusObj status;
    private String info;

    public AbstractObjectOfSale() {
    }

    public AbstractObjectOfSale(String houseNumber, String level, Double totalSpace, Double priceUsd, StatusObj status) {
        this.houseNumber = houseNumber;
        this.level = level;
        this.totalSpace = totalSpace;
        this.priceUsd = priceUsd;
        this.status = status;
    }

    public AbstractObjectOfSale(String houseNumber, String level, Double totalSpace, Double priceUsd, Double discount,
                                Double discountPriceUsd, StatusObj status, String info) {
        this.houseNumber = houseNumber;
        this.level = level;
        this.totalSpace = totalSpace;
        this.priceUsd = priceUsd;
        this.discount = discount;
        this.discountPriceUsd = discountPriceUsd;
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

    public Double getTotalSpace() {
        return totalSpace;
    }

    public void setTotalSpace(Double totalSpace) {
        this.totalSpace = totalSpace;
    }

    public Double getPriceUsd() {
        return priceUsd;
    }

    public void setPriceUsd(Double priceUsd) {
        this.priceUsd = priceUsd;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public Double getDiscountPriceUsd() {
        return discountPriceUsd;
    }

    public void setDiscountPriceUsd(Double discountPriceUsd) {
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
}
