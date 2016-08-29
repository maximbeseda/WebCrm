package ua.com.webcrm.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Максим Беседа on 24.08.2016.
 */
@Entity
@Table(name = "Clients")
public class Client extends Contact {

    @Column(name = "partner_name")
    private String partnerFullName;
    @Column(name = "partner_id_number")
    private String partnerIdentNumber;


    @ManyToOne
    @JoinColumn(name = "manager_id")
    private Manager manager;

    @OneToMany(mappedBy = "client", cascade = CascadeType.ALL)
    private List<Contract> contracts = new ArrayList<>();

    @OneToMany(mappedBy = "client", cascade = CascadeType.ALL)
    private List<Document> documents = new ArrayList<>();

    public Client() {
    }

    public Client(String fullName, String phone, Manager manager) {
        super(fullName, phone);
        this.manager = manager;
    }

    public Client(String fullName, String phone, String email, String address, String passport, String identNumber,
                  String dateBirth, String partnerFullName, String partnerIdentNumber, Manager manager,
                  List<Contract> contracts, List<Document> documents) {
        super(fullName, phone, email, address, passport, identNumber, dateBirth);
        this.partnerFullName = partnerFullName;
        this.partnerIdentNumber = partnerIdentNumber;
        this.manager = manager;
        this.contracts = contracts;
        this.documents = documents;
    }

    public String getPartnerFullName() {
        return partnerFullName;
    }

    public void setPartnerFullName(String partnerFullName) {
        this.partnerFullName = partnerFullName;
    }

    public String getPartnerIdentNumber() {
        return partnerIdentNumber;
    }

    public void setPartnerIdentNumber(String partnerIdentNumber) {
        this.partnerIdentNumber = partnerIdentNumber;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }

    public List<Contract> getContracts() {
        return contracts;
    }

    public void setContracts(List<Contract> contracts) {
        this.contracts = contracts;
    }

    public List<Document> getDocuments() {
        return documents;
    }

    public void setDocuments(List<Document> documents) {
        this.documents = documents;
    }
}
