package ua.com.webcrm.service;

import ua.com.webcrm.entity.Contract;

import java.util.List;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
public interface ContractService {
    Contract addContract(Contract contract);
    void delete(long id);
    Contract editContract(Contract contract);
    List<Contract> getAll();
}
