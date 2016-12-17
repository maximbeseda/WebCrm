package ua.com.webcrm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.com.webcrm.entity.ContractType;
import ua.com.webcrm.repository.ContractTypeRepository;
import ua.com.webcrm.service.ContractTypeService;

import java.util.List;


@Service
public class ContractTypeServiceImpl implements ContractTypeService {

    @Autowired
    private ContractTypeRepository contractTypeRepository;

    @Override
    @Transactional
    public ContractType addContractType(ContractType contractType) {
        ContractType savedContractType = contractTypeRepository.save(contractType);
        return savedContractType;
    }

    @Override
    @Transactional
    public void delete(long id) {
        contractTypeRepository.delete(id);
    }

    @Override
    @Transactional
    public ContractType getById(long id) {
        return contractTypeRepository.findOne(id);
    }

    @Override
    @Transactional
    public ContractType editContractType(ContractType contractType) {
        return contractTypeRepository.save(contractType);
    }

    @Override
    @Transactional
    public List<ContractType> getAll() {
        return contractTypeRepository.findAll();
    }
}
