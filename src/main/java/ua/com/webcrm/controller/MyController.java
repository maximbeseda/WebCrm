package ua.com.webcrm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.com.webcrm.entity.*;
import ua.com.webcrm.entity.enums.ContractType;
import ua.com.webcrm.entity.enums.ManagerRole;
import ua.com.webcrm.entity.enums.StatusContract;
import ua.com.webcrm.entity.enums.StatusObj;
import ua.com.webcrm.service.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Максим Беседа on 25.08.2016.
 */
@Controller
public class MyController {

    @Autowired
    private ManagerService managerService;
    @Autowired
    private ClientService clientService;
    @Autowired
    private ContractService contractService;
    @Autowired
    private ObjectService objectService;
    @Autowired
    private ApartmentService apartmentService;
    @Autowired
    private ParkingService parkingService;

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

        return "index";
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String admin(Model model) {
        Manager dbUser = getUser();

        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("allUsers", managerService.getAll());
        model.addAttribute("roleList", getRoleList());
        return "users";
    }

    private List<ManagerRole> getRoleList() {
        List<ManagerRole> roleList = new ArrayList<>();
        roleList.add(ManagerRole.ADMIN);
        roleList.add(ManagerRole.SALES_MANAGER);
        roleList.add(ManagerRole.CONTRACT_MANAGER);
        roleList.add(ManagerRole.HEAD_SALES_MANAGER);
        return roleList;
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

    @RequestMapping(value = "/user/delete", method = RequestMethod.POST)
    public ResponseEntity<Void> userDelete(@RequestParam(value = "toDelete", required = false) long toDelete, Model model) {
        if (!managerService.getById(toDelete).getRole().equals(ManagerRole.ADMIN)) {
            managerService.delete(toDelete);
        }
        model.addAttribute("allUsers", managerService.getAll());
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping("/analytics")
    public String analytics(Model model) {
        Manager dbUser = getUser();

        model.addAttribute("fullName", dbUser.getFullName());
        return "analytics";
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
        model.addAttribute("contractTypeList", getContractType());
        model.addAttribute("contractStatusList", getContractStatus());
        model.addAttribute("clientsList", clientService.getAll());
        model.addAttribute("objectsList", objectService.getAll());
        return "contracts";
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

    private List<String> getContractType() {
        List<String> typeList = new ArrayList<>();
        typeList.add("Договор купли-продажи ЦБ");
        typeList.add("Предварительный договор");
        typeList.add("Основной договор");
        return typeList;
    }

    private ContractType getContractTypeEnum(String status) {
        ContractType contractType = null;
        switch (status) {
            case "Договор купли-продажи ЦБ":
                contractType = ContractType.BONDS;
                break;
            case "Предварительный договор":
                contractType = ContractType.PRESALE;
                break;
            case "Основной договор":
                contractType = ContractType.SALE;
                break;
        }
        return contractType;
    }

    @RequestMapping(value = "/contract/add", method = RequestMethod.POST)
    public String contractAdd(@RequestParam String contractType,
                              @RequestParam String status,
                              @RequestParam String number,
                              @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
                              @RequestParam String amountString,
                              @RequestParam String rateString,
                              @RequestParam long clientId,
                              @RequestParam long objectId,
                              Model model) {
        Manager dbUser = getUser();
        ContractType type = getContractTypeEnum(contractType);
        Client client = clientService.getById(clientId);
        ObjectOfSale objectOfSale = objectService.getById(objectId);
        double amountUSD = getDouble(amountString);
        double rate = getDouble(rateString);
        StatusContract statusContract = getContractStatusEnum(status);
        Contract contract = new Contract(type, statusContract, number, date, amountUSD, rate, client, dbUser, objectOfSale);
        contractService.addContract(contract);
        model.addAttribute("allContracts", contractService.getAll());
        return "redirect:/contracts";
    }

    public double getDouble(String value){
        double result = 0.0;
        if (!value.equals("")){
            result = Double.parseDouble(value);
        }
        return result;
    }

    @RequestMapping("/contract_edit")
    public String getContract(@RequestParam(value = "toUpdate", required = false) long toUpdate, Model model) {
        Manager dbUser = getUser();

        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("id", toUpdate);
        model.addAttribute("editContract", contractService.getById(toUpdate));
        model.addAttribute("contractTypeList", getContractType());
        model.addAttribute("contractStatusList", getContractStatus());
        model.addAttribute("clientsList", clientService.getAll());
        model.addAttribute("objectsList", objectService.getAll());
        return "contract_edit";
    }

    @RequestMapping(value = "/contract/update", method = RequestMethod.POST)
    public String contractUpdate(@RequestParam long id,
                                 @RequestParam String contractType,
                                 @RequestParam String status,
                                 @RequestParam String number,
                                 @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
                                 @RequestParam String amountString,
                                 @RequestParam String rateString,
                                 @RequestParam long clientId,
                                 @RequestParam long objectId,
                                Model model) {
        Manager dbUser = getUser();
        ContractType type = getContractTypeEnum(contractType);
        Client client = clientService.getById(clientId);
        ObjectOfSale objectOfSale = objectService.getById(objectId);
        double amountUSD = getDouble(amountString);
        double rate = getDouble(rateString);
        StatusContract statusContract = getContractStatusEnum(status);
        Contract contract = new Contract(type, statusContract, number, date, amountUSD, rate, client, dbUser, objectOfSale);
        contract.setId(id);
        contractService.editContract(contract);
        model.addAttribute("allContracts", contractService.getAll());
        return "redirect:/contracts";
    }

    @RequestMapping(value = "/contract/delete", method = RequestMethod.POST)
    public ResponseEntity<Void> contractDelete(@RequestParam(value = "toDelete", required = false) long toDelete, Model model) {
        contractService.delete(toDelete);
        model.addAttribute("allContracts", contractService.getAll());
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping("/documents")
    public String documents(Model model) {
        Manager dbUser = getUser();

        model.addAttribute("fullName", dbUser.getFullName());
        return "documents";
    }

    @RequestMapping("/objects")
    public String objects(Model model) {
        Manager dbUser = getUser();

        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("allObjects", objectService.getAll());
        model.addAttribute("statusList", getObjectStatus());
        return "objects";
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
                               Model model) {
        StatusObj statusObj = getObjectStatusEnum(status);
        double disc = getDouble(discount);
        Apartment apartment = new Apartment(houseNumber, apartmentNumber, level, totalSpace, priceUsd, disc, statusObj,
                livingSpace, rooms);
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
                               Model model) {
        StatusObj statusObj = getObjectStatusEnum(status);
        double disc = getDouble(discount);
        Parking parking = new Parking(houseNumber, level, totalSpace, priceUsd, statusObj, parkingNumber, disc);
        parking.setId(Long.parseLong(id));
        parkingService.editParking(parking);
        model.addAttribute("allObjects", objectService.getAll());
        return "redirect:/objects";
    }

    @RequestMapping(value = "/object/delete", method = RequestMethod.POST)
    public ResponseEntity<Void> objectDelete(@RequestParam(value = "toDelete", required = false) long toDelete, Model model) {
        objectService.delete(toDelete);
        model.addAttribute("allObjects", objectService.getAll());
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping("/reports")
    public String reports(Model model) {
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
}
