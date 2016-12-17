package ua.com.webcrm.service;

import ua.com.webcrm.entity.ContractType;

import java.util.List;


public interface ContractTypeService {
    ContractType addContractType (ContractType contractType);
    void delete(long id);
    ContractType getById(long id);
    ContractType editContractType (ContractType contractType);
    List<ContractType> getAll();

}
