package ua.com.webcrm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.webcrm.entity.Invoice;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
public interface InvoiceRepository extends JpaRepository<Invoice, Long> {
}
