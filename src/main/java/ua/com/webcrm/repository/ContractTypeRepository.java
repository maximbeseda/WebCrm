package ua.com.webcrm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.webcrm.entity.ContractType;


public interface ContractTypeRepository extends JpaRepository<ContractType, Long> {
}
