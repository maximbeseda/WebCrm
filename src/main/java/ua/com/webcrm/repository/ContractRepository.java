package ua.com.webcrm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.webcrm.entity.Contract;
import ua.com.webcrm.entity.enums.StatusContract;

import java.util.Date;
import java.util.List;


public interface ContractRepository extends JpaRepository<Contract, Long> {
    List<Contract> findByDateAfterAndStatusIsLike(Date dateAfter, StatusContract statusIsLike);
    List<Contract> findOrderByStatusIsLike(StatusContract statusIsLike);
}
