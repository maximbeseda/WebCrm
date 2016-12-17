package ua.com.webcrm.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "contract_types")
public class ContractType {

    @Id
    @GeneratedValue
    private long id;
    @Column
    private String name;

    @OneToMany(mappedBy = "contractType", cascade = CascadeType.ALL)
    private List<Contract> contracts = new ArrayList<>();

    public ContractType() {
    }

    public ContractType(String name) {
        this.name = name;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Contract> getContracts() {
        return contracts;
    }

    public void setContracts(List<Contract> contracts) {
        this.contracts = contracts;
    }

    @Override
    public String toString() {
        return name;
    }
}
