package ua.com.webcrm.entity;

import javax.persistence.*;

/**
 * Created by Максим Беседа on 24.08.2016.
 */
@MappedSuperclass
public abstract class Contact {
    @Id
    @GeneratedValue
    private long id;
    @Column(name = "full_name", nullable = false)
    private String fullName;
    @Column(nullable = false)
    private String phone;
    private String email;
    private String address;
    private String passport;
    @Column(name = "id_number")
    private String identNumber;
    @Column(name = "date_of_birth")
    private String dateBirth;

    public Contact() {
    }

    public Contact(String fullName, String phone) {
        this.fullName = fullName;
        this.phone = phone;
    }

    public Contact(String fullName, String phone, String email, String address, String passport, String identNumber, String dateBirth) {
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.passport = passport;
        this.identNumber = identNumber;
        this.dateBirth = dateBirth;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public String getIdentNumber() {
        return identNumber;
    }

    public void setIdentNumber(String identNumber) {
        this.identNumber = identNumber;
    }

    public String getDateBirth() {
        return dateBirth;
    }

    public void setDateBirth(String dateBirth) {
        this.dateBirth = dateBirth;
    }
}
