package ua.com.webcrm.service;

import ua.com.webcrm.entity.Invoice;

import java.util.List;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
public interface InvoiceService {
    Invoice addInvoice(Invoice invoice);
    void delete(long id);
    Invoice editInvoice(Invoice invoice);
    List<Invoice> getAll();
}
