package ua.com.webcrm.service;

import ua.com.webcrm.entity.Contract;
import ua.com.webcrm.entity.enums.StatusContract;

import java.util.Date;
import java.util.List;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
public interface ContractService {
    Contract addContract(Contract contract);
    void delete(long id);
    Contract editContract(Contract contract);
    Contract getById(long id);
    List<Contract> getAll();
    List<Contract> getByDateAndStatus(Date date, StatusContract statusContract);
    List<Contract> getByStatus(StatusContract statusContract);
}
