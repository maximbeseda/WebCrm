package ua.com.webcrm.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Максим Беседа on 24.08.2016.
 */
@Entity
@Table(name = "payments")
public class Invoice {

    @Id
    @GeneratedValue
    private long id;
    @Column(nullable = false)
    private String number;
    @Column(nullable = false)
    private String requisites;
    @Column(name = "amount_usd", nullable = false)
    private Double amountUSD;
    @Column(name = "amount_uah")
    private Double amountUAH;
    private Date date;
    private Double rate;

    @ManyToOne
    @JoinColumn(name = "contract_id")
    private Contract contract;

    public Invoice() {
    }

    public Invoice(String number, String requisites, Double amountUSD, Contract contract) {
        this.number = number;
        this.requisites = requisites;
        this.amountUSD = amountUSD;
        this.contract = contract;
    }

    public Invoice(String number, String requisites, Double amountUSD, Double amountUAH, Date date, Double rate, Contract contract) {
        this.number = number;
        this.requisites = requisites;
        this.amountUSD = amountUSD;
        this.amountUAH = amountUAH;
        this.date = date;
        this.rate = rate;
        this.contract = contract;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getRequisites() {
        return requisites;
    }

    public void setRequisites(String requisites) {
        this.requisites = requisites;
    }

    public Double getAmountUSD() {
        return amountUSD;
    }

    public void setAmountUSD(Double amountUSD) {
        this.amountUSD = amountUSD;
    }

    public Double getAmountUAH() {
        return amountUAH;
    }

    public void setAmountUAH(Double amountUAH) {
        this.amountUAH = amountUAH;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Double getRate() {
        return rate;
    }

    public void setRate(Double rate) {
        this.rate = rate;
    }

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }
}
