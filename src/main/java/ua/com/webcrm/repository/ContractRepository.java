package ua.com.webcrm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.webcrm.entity.Contract;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
public interface ContractRepository extends JpaRepository<Contract, Long> {
}
