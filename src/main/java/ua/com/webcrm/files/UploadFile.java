package ua.com.webcrm.files;

import ua.com.webcrm.entity.*;

import javax.persistence.*;

/**
 * Created by Максим Беседа on 24.09.2016.
 */
@Entity
@Table(name = "files")
public class UploadFile {

    @Id
    @GeneratedValue
    private long id;

    private String fileName;
    private String fileHash;
    private String fileType;
    private String fileDate;
    private String fileLink;
    private long fileSize;

    @ManyToOne
    @JoinColumn(name = "document_id")
    private Document document;

    @ManyToOne
    @JoinColumn(name = "objectOfSale_id")
    private ObjectOfSale objectOfSale;

    @ManyToOne
    @JoinColumn(name = "client_id")
    private Client client;

    @ManyToOne
    @JoinColumn(name = "contract_id")
    private Contract contract;

    @ManyToOne
    @JoinColumn(name = "manager_id")
    private Manager manager;

    public UploadFile() {
    }

    public UploadFile(String fileName, String fileHash, String fileType, String fileDate, long fileSize) {
        this.fileName = fileName;
        this.fileHash = fileHash;
        this.fileType = fileType;
        this.fileDate = fileDate;
        this.fileSize = fileSize;
    }

    public UploadFile(String fileName, String fileHash, String fileType, String fileDate, String fileLink, long fileSize,
                      Document document, ObjectOfSale objectOfSale) {
        this.fileName = fileName;
        this.fileHash = fileHash;
        this.fileType = fileType;
        this.fileDate = fileDate;
        this.fileLink = fileLink;
        this.fileSize = fileSize;
        this.document = document;
        this.objectOfSale = objectOfSale;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileHash() {
        return fileHash;
    }

    public void setFileHash(String fileHash) {
        this.fileHash = fileHash;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getFileDate() {
        return fileDate;
    }

    public void setFileDate(String fileDate) {
        this.fileDate = fileDate;
    }

    public String getFileLink() {
        return fileLink;
    }

    public void setFileLink(String fileLink) {
        this.fileLink = fileLink;
    }

    public long getFileSize() {
        return fileSize;
    }

    public void setFileSize(long fileSize) {
        this.fileSize = fileSize;
    }

    public Document getDocument() {
        return document;
    }

    public void setDocument(Document document) {
        this.document = document;
    }

    public ObjectOfSale getObjectOfSale() {
        return objectOfSale;
    }

    public void setObjectOfSale(ObjectOfSale objectOfSale) {
        this.objectOfSale = objectOfSale;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }
}
