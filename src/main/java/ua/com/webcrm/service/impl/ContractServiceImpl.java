package ua.com.webcrm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.com.webcrm.entity.Contract;
import ua.com.webcrm.repository.ContractRepository;
import ua.com.webcrm.service.ContractService;

import java.util.List;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
@Service
public class ContractServiceImpl implements ContractService {

    @Autowired
    private ContractRepository contractRepository;

    @Override
    @Transactional
    public Contract addContract(Contract contract) {
        Contract savedContract = contractRepository.save(contract);
        return savedContract;
    }

    @Override
    @Transactional
    public void delete(long id) {
        contractRepository.delete(id);
    }

    @Override
    @Transactional
    public Contract editContract(Contract contract) {
        return contractRepository.save(contract);
    }

    @Override
    public Contract getById(long id) {
        return contractRepository.findOne(id);
    }

    @Override
    @Transactional
    public List<Contract> getAll() {
        return contractRepository.findAll();
    }
}
