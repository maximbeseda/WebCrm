package ua.com.webcrm.service;

import ua.com.webcrm.entity.Invoice;

import java.util.List;


public interface InvoiceService {
    Invoice addInvoice(Invoice invoice);
    void delete(long id);
    Invoice editInvoice(Invoice invoice);
    List<Invoice> getAll();
}
