package ua.com.webcrm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.com.webcrm.entity.Invoice;
import ua.com.webcrm.repository.InvoiceRepository;
import ua.com.webcrm.service.InvoiceService;

import java.util.List;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
@Service
public class InvoiceServiceImpl implements InvoiceService {

    @Autowired
    private InvoiceRepository invoiceRepository;

    @Override
    @Transactional
    public Invoice addInvoice(Invoice invoice) {
        Invoice savedInvoice = invoiceRepository.save(invoice);
        return savedInvoice;
    }

    @Override
    @Transactional
    public void delete(long id) {
        invoiceRepository.delete(id);
    }

    @Override
    @Transactional
    public Invoice editInvoice(Invoice invoice) {
        return invoiceRepository.save(invoice);
    }

    @Override
    @Transactional
    public List<Invoice> getAll() {
        return invoiceRepository.findAll();
    }
}
