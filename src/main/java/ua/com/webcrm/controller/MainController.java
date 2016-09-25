package ua.com.webcrm.controller;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ua.com.webcrm.entity.*;
import ua.com.webcrm.entity.enums.ManagerRole;
import ua.com.webcrm.entity.enums.StatusContract;
import ua.com.webcrm.entity.enums.StatusDoc;
import ua.com.webcrm.entity.enums.StatusObj;
import ua.com.webcrm.files.UploadFile;
import ua.com.webcrm.service.*;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Максим Беседа on 25.08.2016.
 */
@Controller
public class MainController {

    String filePath = "C:/Users/Максим Беседа/Downloads/";

    @Autowired
    private ManagerService managerService;
    @Autowired
    private ClientService clientService;
    @Autowired
    private ContractService contractService;
    @Autowired
    private ContractTypeService contractTypeService;
    @Autowired
    private ObjectService objectService;
    @Autowired
    private ApartmentService apartmentService;
    @Autowired
    private ParkingService parkingService;
    @Autowired
    private DocumentService documentService;
    @Autowired
    private UploadFileService uploadFileService;

    public Manager getUser() {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        return managerService.getByLogin(login);
    }

    @RequestMapping(value = "/")
    public String index(Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("login", dbUser.getLogin());
        model.addAttribute("roles", dbUser.getRole());
        model.addAttribute("email", dbUser.getEmail());
        model.addAttribute("contractsThisMonth", getContractThisMonth());
        model.addAttribute("countContracts", countContractThisMonth());
        model.addAttribute("totalAmount", totalAmountContractThisMonth());
        model.addAttribute("countApartment", countObjectThisMonth("Квартира"));
        model.addAttribute("countParking", countObjectThisMonth("Паркинг"));


        return "index";
    }

    public List<Contract> getContractThisMonth(){
        Date dateFrom = new Date();
        dateFrom.setDate(1);
        List<Contract> contracts = contractService.getByDateAndStatus(dateFrom, StatusContract.SIGNED);

        return contracts;
    }

    public int countContractThisMonth(){
        int count = 0;
        for (Contract contract : getContractThisMonth()) {
            count++;
        }
        return count;
    }

    public double totalAmountContractThisMonth(){
        double totalAmount = 0;
        for (Contract contract : getContractThisMonth()) {
            totalAmount += contract.getAmountUSD();
        }
        return totalAmount;
    }

    public int countObjectThisMonth(String type){
        List<Contract> contracts = getContractThisMonth();
        int count = 0;
        for (Contract contract : contracts) {
            if (type.equals(contract.getObjectOfSale().getType())){
                count++;
            }
        }
        return count;
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String admin(Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("allUsers", managerService.getAll());
        model.addAttribute("roleList", getRoleList());

        return "users";
    }

    @RequestMapping(value = "/user/add", method = RequestMethod.POST)
    public String userAdd(@RequestParam String fullName,
                          @RequestParam String phone,
                          @RequestParam String email,
                          @RequestParam String address,
                          @RequestParam String passport,
                          @RequestParam String identNumber,
                          @RequestParam String dateBirth,
                          @RequestParam ManagerRole role,
                          @RequestParam String login,
                          @RequestParam String password,
                          Model model) {
        Manager user = new Manager(fullName, phone, email, address, passport, identNumber, dateBirth, role, login, password);
        managerService.addManager(user);
        model.addAttribute("allUsers", managerService.getAll());

        return "redirect:/users";
    }

    @RequestMapping("/user_edit")
    public String getUser(@RequestParam(value = "toUpdate", required = false) long toUpdate, Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("id", toUpdate);
        model.addAttribute("editUser", managerService.getById(toUpdate));
        model.addAttribute("roleList", getRoleList());

        return "user_edit";
    }

    @RequestMapping("/edit_profile")
    public String editProfile(Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("id", dbUser.getId());
        model.addAttribute("editUser", dbUser);
        model.addAttribute("roleList", getRoleList());

        return "edit_profile";
    }

    @RequestMapping(value = "/user/update", method = RequestMethod.POST)
    public String userUpdate(@RequestParam String id,
                             @RequestParam String fullName,
                             @RequestParam String phone,
                             @RequestParam String email,
                             @RequestParam String address,
                             @RequestParam String passport,
                             @RequestParam String identNumber,
                             @RequestParam String dateBirth,
                             @RequestParam ManagerRole role,
                             @RequestParam String login,
                             @RequestParam String password,
                             Model model) {
        Manager user = new Manager(fullName, phone, email, address, passport, identNumber, dateBirth, role, login, password);
        user.setId(Long.parseLong(id));
        managerService.editManager(user);
        model.addAttribute("allUsers", managerService.getAll());

        return "redirect:/users";
    }

    @RequestMapping(value = "/profile/update", method = RequestMethod.POST)
    public String profileUpdate(@RequestParam String id,
                                @RequestParam String fullName,
                                @RequestParam String phone,
                                @RequestParam String email,
                                @RequestParam String address,
                                @RequestParam String passport,
                                @RequestParam String identNumber,
                                @RequestParam String dateBirth,
                                @RequestParam ManagerRole role,
                                @RequestParam String login,
                                @RequestParam String password,
                                Model model) {
        Manager user = new Manager(fullName, phone, email, address, passport, identNumber, dateBirth, role, login, password);
        user.setId(Long.parseLong(id));
        managerService.editManager(user);

        return "redirect:/user_info";
    }

    @RequestMapping("/user_info")
    public String userInfo(Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("getUser", dbUser);

        return "user_info";
    }

    @RequestMapping(value = "/user/delete", method = RequestMethod.POST)
    public ResponseEntity<Void> userDelete(@RequestParam(value = "toDelete", required = false) long toDelete, Model model) {
        if (!managerService.getById(toDelete).getRole().equals(ManagerRole.ADMIN)) {
            managerService.delete(toDelete);
        }
        model.addAttribute("allUsers", managerService.getAll());

        return new ResponseEntity<>(HttpStatus.OK);
    }

    private List<ManagerRole> getRoleList() {
        List<ManagerRole> roleList = new ArrayList<>();
        roleList.add(ManagerRole.ADMIN);
        roleList.add(ManagerRole.SALES_MANAGER);
        roleList.add(ManagerRole.CONTRACT_MANAGER);
        roleList.add(ManagerRole.HEAD_SALES_MANAGER);

        return roleList;
    }

    @RequestMapping("/contacts")
    public String contacts(Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("allClients", clientService.getAll());

        return "contacts";
    }

    @RequestMapping(value = "/contact/add", method = RequestMethod.POST)
    public String contactAdd(@RequestParam String fullName,
                             @RequestParam String phone,
                             @RequestParam String email,
                             @RequestParam String address,
                             @RequestParam String passport,
                             @RequestParam String identNumber,
                             @RequestParam String dateBirth,
                             @RequestParam String partnerFullName,
                             @RequestParam String partnerIdentNumber,
                             Model model) {
        Manager dbUser = getUser();
        Client client = new Client(fullName, phone, email, address, passport, identNumber, dateBirth, partnerFullName,
                partnerIdentNumber, dbUser);
        clientService.addClient(client);
        model.addAttribute("allClients", clientService.getAll());

        return "redirect:/contacts";
    }

    @RequestMapping("/contact_edit")
    public String getContact(@RequestParam(value = "toUpdate", required = false) long toUpdate, Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("id", toUpdate);
        model.addAttribute("getClient", clientService.getById(toUpdate));

        return "contact_edit";
    }

    @RequestMapping(value = "/contact/update", method = RequestMethod.POST)
    public String contactUpdate(@RequestParam String id,
                                @RequestParam String fullName,
                                @RequestParam String phone,
                                @RequestParam String email,
                                @RequestParam String address,
                                @RequestParam String passport,
                                @RequestParam String identNumber,
                                @RequestParam String dateBirth,
                                @RequestParam String partnerFullName,
                                @RequestParam String partnerIdentNumber,
                                Model model) {
        Manager dbUser = getUser();
        Client client = new Client(fullName, phone, email, address, passport, identNumber, dateBirth, partnerFullName,
                partnerIdentNumber, dbUser);
        client.setId(Long.parseLong(id));
        clientService.editClient(client);
        model.addAttribute("allClients", clientService.getAll());

        return "redirect:/contacts";
    }

    @RequestMapping("/contact_info")
    public String contactInfo(@RequestParam(value = "toInfo", required = false) long toInfo, Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("getClient", clientService.getById(toInfo));

        return "contact_info";
    }

    @RequestMapping(value = "/contact/delete", method = RequestMethod.POST)
    public ResponseEntity<Void> contactDelete(@RequestParam(value = "toDelete", required = false) long toDelete, Model model) {
        clientService.delete(toDelete);
        model.addAttribute("allClients", clientService.getAll());

        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping("/contracts")
    public String contracts(Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("allContracts", contractService.getAll());
        model.addAttribute("contractTypeList", contractTypeService.getAll());
        model.addAttribute("contractStatusList", getContractStatus());
        model.addAttribute("clientsList", clientService.getAll());
        model.addAttribute("objectsList", objectService.getAll());

        return "contracts";
    }

    @RequestMapping(value = "/contract/add", method = RequestMethod.POST)
    public String contractAdd(@RequestParam long contractTypeId,
                              @RequestParam String status,
                              @RequestParam String number,
                              @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
                              @RequestParam String amountString,
                              @RequestParam String rateString,
                              @RequestParam long clientId,
                              @RequestParam long objectId,
                              Model model) {
        Manager dbUser = getUser();
        ContractType contractType = contractTypeService.getById(contractTypeId);
        Client client = clientService.getById(clientId);
        ObjectOfSale objectOfSale = objectService.getById(objectId);
        double amountUSD = getDouble(amountString);
        double rate = getDouble(rateString);
        StatusContract statusContract = getContractStatusEnum(status);
        Contract contract = new Contract(contractType, statusContract, number, date, amountUSD, rate, client, dbUser, objectOfSale);
        contractService.addContract(contract);
        model.addAttribute("allContracts", contractService.getAll());

        return "redirect:/contracts";
    }

    @RequestMapping("/contract_edit")
    public String getContract(@RequestParam(value = "toUpdate", required = false) long toUpdate, Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("id", toUpdate);
        model.addAttribute("editContract", contractService.getById(toUpdate));
        model.addAttribute("contractTypeList", contractTypeService.getAll());
        model.addAttribute("contractStatusList", getContractStatus());
        model.addAttribute("clientsList", clientService.getAll());
        model.addAttribute("objectsList", objectService.getAll());

        return "contract_edit";
    }

    @RequestMapping(value = "/contract/update", method = RequestMethod.POST)
    public String contractUpdate(@RequestParam long id,
                                 @RequestParam long contractTypeId,
                                 @RequestParam String status,
                                 @RequestParam String number,
                                 @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
                                 @RequestParam String amountString,
                                 @RequestParam String rateString,
                                 @RequestParam long clientId,
                                 @RequestParam long objectId,
                                 Model model) {
        Manager dbUser = getUser();
        ContractType contractType = contractTypeService.getById(contractTypeId);
        Client client = clientService.getById(clientId);
        ObjectOfSale objectOfSale = objectService.getById(objectId);
        double amountUSD = getDouble(amountString);
        double rate = getDouble(rateString);
        StatusContract statusContract = getContractStatusEnum(status);
        Contract contract = new Contract(contractType, statusContract, number, date, amountUSD, rate, client, dbUser, objectOfSale);
        contract.setId(id);
        contractService.editContract(contract);
        model.addAttribute("allContracts", contractService.getAll());

        return "redirect:/contracts";
    }

    @RequestMapping("/contract_info")
    public String contractInfo(@RequestParam(value = "toInfo", required = false) long toInfo, Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("getContract", contractService.getById(toInfo));

        return "contract_info";
    }

    @RequestMapping(value = "/contract/delete", method = RequestMethod.POST)
    public ResponseEntity<Void> contractDelete(@RequestParam(value = "toDelete", required = false) long toDelete, Model model) {
        contractService.delete(toDelete);
        model.addAttribute("allContracts", contractService.getAll());

        return new ResponseEntity<>(HttpStatus.OK);
    }

    private List<String> getContractStatus() {
        List<String> statusList = new ArrayList<>();
        statusList.add("На утверждение");
        statusList.add("Утвержден");
        statusList.add("Подписан");
        statusList.add("Отменен");

        return statusList;
    }

    private StatusContract getContractStatusEnum(String status) {
        StatusContract statusContract = null;
        switch (status) {
            case "На утверждение":
                statusContract = StatusContract.PREPARE;
                break;
            case "Утвержден":
                statusContract = StatusContract.APPROVED;
                break;
            case "Подписан":
                statusContract = StatusContract.SIGNED;
                break;
            case "Отменен":
                statusContract = StatusContract.CANCELED;
                break;
        }
        return statusContract;
    }


    public double getDouble(String value) {
        double result = 0.0;
        if (!value.equals("")) {
            result = Double.parseDouble(value);
        }
        return result;
    }

    @RequestMapping("/objects")
    public String objects(Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("allObjects", objectService.getAll());
        model.addAttribute("statusList", getObjectStatus());

        return "objects";
    }

    @RequestMapping(value = "/apartment/add", method = RequestMethod.POST)
    public String objectAdd(@RequestParam String houseNumber,
                            @RequestParam String apartmentNumber,
                            @RequestParam String level,
                            @RequestParam double totalSpace,
                            @RequestParam double priceUsd,
                            @RequestParam String status,
                            @RequestParam double livingSpace,
                            @RequestParam int rooms,
                            Model model) {
        StatusObj statusObj = getObjectStatusEnum(status);
        Apartment apartment = new Apartment(houseNumber, apartmentNumber, level, totalSpace, priceUsd, statusObj, livingSpace, rooms);
        apartmentService.addApartment(apartment);
        model.addAttribute("allObjects", objectService.getAll());

        return "redirect:/objects";
    }

    @RequestMapping(value = "/parking/add", method = RequestMethod.POST)
    public String objectAdd(@RequestParam String houseNumber,
                            @RequestParam String level,
                            @RequestParam double totalSpace,
                            @RequestParam double priceUsd,
                            @RequestParam String status,
                            @RequestParam String parkingNumber,
                            Model model) {
        StatusObj statusObj = getObjectStatusEnum(status);
        Parking parking = new Parking(houseNumber, level, totalSpace, priceUsd, statusObj, parkingNumber);
        parkingService.addParking(parking);
        model.addAttribute("allObjects", objectService.getAll());

        return "redirect:/objects";
    }

    @RequestMapping("/object_edit")
    public String getObjectOfSale(@RequestParam(value = "toUpdate", required = false) long toUpdate, Model model) {
        Manager dbUser = getUser();
        ObjectOfSale objectOfSale = objectService.getById(toUpdate);
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("id", toUpdate);
        if (objectOfSale.getType().equals("Квартира")) {
            model.addAttribute("editObject", apartmentService.getById(toUpdate));
            model.addAttribute("statusList", getObjectStatus());
            return "object_edit";
        }
        if (objectOfSale.getType().equals("Паркинг")) {
            model.addAttribute("editObject", parkingService.getById(toUpdate));
            model.addAttribute("statusList", getObjectStatus());
            return "object_edit";
        }
        return "object_edit";
    }

    @RequestMapping(value = "/apartment/update", method = RequestMethod.POST)
    public String objectUpdate(@RequestParam String id,
                               @RequestParam String houseNumber,
                               @RequestParam String apartmentNumber,
                               @RequestParam String level,
                               @RequestParam double totalSpace,
                               @RequestParam double priceUsd,
                               @RequestParam String status,
                               @RequestParam Double livingSpace,
                               @RequestParam int rooms,
                               @RequestParam String discount,
                               @RequestParam("upfile") MultipartFile file,
                               Model model) {
        StatusObj statusObj = getObjectStatusEnum(status);
        double disc = getDouble(discount);
        Apartment apartment = new Apartment(houseNumber, apartmentNumber, level, totalSpace, priceUsd, disc, statusObj,
                livingSpace, rooms);
        apartment.setPlan(addFileToDocument(file));
        apartment.setId(Long.parseLong(id));
        apartmentService.editApartment(apartment);
        model.addAttribute("allObjects", objectService.getAll());

        return "redirect:/objects";
    }

    @RequestMapping(value = "/parking/update", method = RequestMethod.POST)
    public String objectUpdate(@RequestParam String id,
                               @RequestParam String houseNumber,
                               @RequestParam String parkingNumber,
                               @RequestParam String level,
                               @RequestParam double totalSpace,
                               @RequestParam double priceUsd,
                               @RequestParam String status,
                               @RequestParam String discount,
                               @RequestParam("upfile") MultipartFile file,
                               Model model) {
        StatusObj statusObj = getObjectStatusEnum(status);
        double disc = getDouble(discount);
        Parking parking = new Parking(houseNumber, level, totalSpace, priceUsd, statusObj, parkingNumber, disc);
        parking.setPlan(addFileToDocument(file));
        parking.setId(Long.parseLong(id));
        parkingService.editParking(parking);
        model.addAttribute("allObjects", objectService.getAll());

        return "redirect:/objects";
    }

    @RequestMapping("/object_info")
    public String objectInfo(@RequestParam(value = "toInfo", required = false) long toInfo, Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("getObject", objectService.getById(toInfo));

        return "object_info";
    }

    @RequestMapping(value = "/object/delete", method = RequestMethod.POST)
    public ResponseEntity<Void> objectDelete(@RequestParam(value = "toDelete", required = false) long toDelete, Model model) {
        objectService.delete(toDelete);
        model.addAttribute("allObjects", objectService.getAll());

        return new ResponseEntity<>(HttpStatus.OK);
    }

    private List<String> getObjectStatus() {
        List<String> statusList = new ArrayList<>();
        statusList.add("Свободен");
        statusList.add("Резерв");
        statusList.add("Не продается");
        statusList.add("Продан");

        return statusList;
    }

    private StatusObj getObjectStatusEnum(String status) {
        StatusObj statusObj = null;
        switch (status) {
            case "Продан":
                statusObj = StatusObj.SOLD;
                break;
            case "Резерв":
                statusObj = StatusObj.RESERVE;
                break;
            case "Свободен":
                statusObj = StatusObj.FREE;
                break;
            case "Не продается":
                statusObj = StatusObj.NOT_SALE;
                break;
        }
        return statusObj;
    }

    @RequestMapping("/documents")
    public String documents(Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("allDocuments", documentService.getAll());
        model.addAttribute("documentStatusList", getDocumentStatus());
        model.addAttribute("clientsList", clientService.getAll());
        model.addAttribute("contractList", contractService.getAll());

        return "documents";
    }

    @RequestMapping(value = "/document/add", method = RequestMethod.POST)
    public String documentAdd(@RequestParam String name,
                              @RequestParam String status,
                              @RequestParam long clientId,
                              @RequestParam long contractId,
                              @RequestParam String info,
                              @RequestParam("upfiles[]") MultipartFile[] files,
                              Model model) {
        Manager dbUser = getUser();
        Client client = clientService.getById(clientId);
        Contract contract = contractService.getById(contractId);
        StatusDoc statusDoc = getDocumentStatusEnum(status);
        Document document = new Document(name, info, statusDoc, client, dbUser, contract);
        document.addFiles(addFilesToDocument(files));
        documentService.addDocument(document);
        model.addAttribute("allDocuments", documentService.getAll());

        return "redirect:/documents";
    }

    @RequestMapping("/document_edit")
    public String getDocument(@RequestParam(value = "toUpdate", required = false) long toUpdate, Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("id", toUpdate);
        model.addAttribute("editDocument", documentService.getById(toUpdate));
        model.addAttribute("documentStatusList", getDocumentStatus());
        model.addAttribute("clientsList", clientService.getAll());
        model.addAttribute("contractList", contractService.getAll());

        return "document_edit";
    }

    @RequestMapping(value = "/document/update", method = RequestMethod.POST)
    public String documentUpdate(@RequestParam long id,
                                 @RequestParam String name,
                                 @RequestParam String status,
                                 @RequestParam long clientId,
                                 @RequestParam long contractId,
                                 @RequestParam String info,
                                 @RequestParam("upfiles[]") MultipartFile[] files,
                                 Model model) {
        Manager dbUser = getUser();
        Client client = clientService.getById(clientId);
        Contract contract = contractService.getById(contractId);
        StatusDoc statusDoc = getDocumentStatusEnum(status);
        Document document = new Document(name, info, statusDoc, client, dbUser, contract);
        document.addFiles(addFilesToDocument(files));
        document.setId(id);
        documentService.editDocument(document);
        model.addAttribute("allDocuments", documentService.getAll());

        return "redirect:/documents";
    }

    @RequestMapping("/document_info")
    public String documentInfo(@RequestParam(value = "toInfo", required = false) long toInfo, Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("getDocument", documentService.getById(toInfo));

        return "document_info";
    }

    @RequestMapping(value = "/document/delete", method = RequestMethod.POST)
    public ResponseEntity<Void> documentDelete(@RequestParam(value = "toDelete", required = false) long toDelete, Model model) {
        documentService.delete(toDelete);
        model.addAttribute("allDocuments", documentService.getAll());

        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping(value = "/delete/document_file", method = RequestMethod.POST)
    public ResponseEntity<Void> documentFileDelete(@RequestParam(value = "toDelete", required = false) long toDelete, Model model) {
        uploadFileService.delete(toDelete);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    private List<String> getDocumentStatus() {
        List<String> statusList = new ArrayList<>();
        statusList.add("На утверждение");
        statusList.add("Согласовано");
        statusList.add("Отказано");

        return statusList;
    }

    private StatusDoc getDocumentStatusEnum(String status) {
        StatusDoc statusDoc = null;
        switch (status) {
            case "На утверждение":
                statusDoc = StatusDoc.FOR_APPROVAL;
                break;
            case "Согласовано":
                statusDoc = StatusDoc.AGREED;
                break;
            case "Отказано":
                statusDoc = StatusDoc.DENIED;
                break;
        }
        return statusDoc;
    }

    private ArrayList<UploadFile> addFilesToDocument(MultipartFile[] files) {
        ArrayList<UploadFile> addFiles = new ArrayList<>();
        if (files != null && files.length > 0) {
            if (!files[0].isEmpty()) {
                for (MultipartFile file : files) {
                    try {
                        String fileName = file.getOriginalFilename();
                        byte[] uploadBytes = file.getBytes();
                        MessageDigest md5 = MessageDigest.getInstance("MD5");
                        byte[] digest = md5.digest(uploadBytes);
                        String hashName = new BigInteger(1, digest).toString(16);
                        String newPath = filePath + "inbox/" + hashName;
                        String ext = FilenameUtils.getExtension(fileName);
                        File dest = new File(newPath + "." + ext);
                        if (!dest.exists()) {
                            file.transferTo(dest);
                        }
                        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
                        UploadFile uploadFile = new UploadFile(fileName, hashName, ext, sdf.format(dest.lastModified()), file.getSize());
                        addFiles.add(uploadFile);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return addFiles;
    }

    private UploadFile addFileToDocument(MultipartFile file) {
        UploadFile uploadFile = null;
        if (file != null) {
            try {
                String fileName = file.getOriginalFilename();
                byte[] uploadBytes = file.getBytes();
                MessageDigest md5 = MessageDigest.getInstance("MD5");
                byte[] digest = md5.digest(uploadBytes);
                String hashName = new BigInteger(1, digest).toString(16);
                String newPath = filePath + "inbox/" + hashName;
                String ext = FilenameUtils.getExtension(fileName);
                File dest = new File(newPath + "." + ext);
                if (!dest.exists()) {
                    file.transferTo(dest);
                }
                SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
                uploadFile = new UploadFile(fileName, hashName, ext, sdf.format(dest.lastModified()), file.getSize());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return uploadFile;
    }

    @RequestMapping(value = "/download/inbox/{id}/{hash}", method = RequestMethod.GET)
    public void fileDownload(HttpServletResponse response,
                             @PathVariable(value = "id") long id,
                             @PathVariable(value = "hash") String fileHash) {
        UploadFile uploadFile = uploadFileService.getById(id);
        if (!uploadFile.getFileHash().equals(fileHash)) return;

        String newPath = filePath + "inbox/" + uploadFile.getFileHash() + "." + uploadFile.getFileType();
        File file = new File(newPath);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/" + uploadFile.getFileType());
        response.setContentLength(new Long(file.length()).intValue());
        String originalFileName = uploadFile.getFileName();
        try {
            byte[] fileNameBytes = originalFileName.getBytes("utf-8");
            String dispositionFileName = "";
            for (byte b : fileNameBytes) {
                dispositionFileName += (char) (b & 0xff);
            }
            response.setHeader("Content-Disposition", "attachment; filename=\"" + dispositionFileName + "\"");
            try {
                FileCopyUtils.copy(new FileInputStream(file), response.getOutputStream());
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/reports")
    public String reports(Model model) throws IOException {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());

        return "reports";
    }

    @RequestMapping("/tasks")
    public String tasks(Model model) {
        Manager dbUser = getUser();
        model.addAttribute("fullName", dbUser.getFullName());

        return "tasks";
    }

    @ExceptionHandler(IOException.class)
    public String handleBadFileNameException(Exception ex, Model model) {
        model.addAttribute("error", ex.getMessage());
        return "error_404";
    }
}