package ua.com.webcrm.service;

import ua.com.webcrm.entity.ContractType;

import java.util.List;

/**
 * Created by Максим Беседа on 24.09.2016.
 */
public interface ContractTypeService {
    ContractType addContractType (ContractType contractType);
    void delete(long id);
    ContractType getById(long id);
    ContractType editContractType (ContractType contractType);
    List<ContractType> getAll();

}
