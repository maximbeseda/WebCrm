package ua.com.webcrm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.webcrm.entity.Invoice;


public interface InvoiceRepository extends JpaRepository<Invoice, Long> {
}
