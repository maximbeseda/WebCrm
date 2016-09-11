package ua.com.webcrm.controller;

import org.springframework.beans.factory.annotation.Autowired;
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
import ua.com.webcrm.entity.enums.StatusObj;
import ua.com.webcrm.service.*;

import java.util.ArrayList;
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

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam(required = false) String email, @RequestParam(required = false) String phone) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        Manager dbUser = managerService.getByLogin(login);
        dbUser.setEmail(email);
        dbUser.setPhone(phone);

        managerService.editManager(dbUser);

        return "redirect:/";
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String admin(Model model) {
        Manager dbUser = getUser();

        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("allUsers", managerService.getAll());
        return "users";
    }

    @RequestMapping("/unauthorized")
    public String unauthorized(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("login", user.getUsername());
        return "unauthorized";
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
        return "contracts";
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
        model.addAttribute("statusList", getStatusObjs());
        return "objects";
    }

    private List<StatusObj> getStatusObjs() {
        List<StatusObj> statusObjList = new ArrayList<>();
        statusObjList.add(StatusObj.Продан);
        statusObjList.add(StatusObj.Резерв);
        statusObjList.add(StatusObj.Свободен);
        statusObjList.add(StatusObj.Не_продается);
        return statusObjList;
    }

    @RequestMapping(value = "/apartment/add", method = RequestMethod.POST)
    public String objectAdd(@RequestParam String houseNumber,
                            @RequestParam String apartmentNumber,
                            @RequestParam String level,
                            @RequestParam Double totalSpace,
                            @RequestParam Double priceUsd,
                            @RequestParam StatusObj status,
                            @RequestParam Double livingSpace,
                            @RequestParam Integer rooms,
                            Model model) {
        Apartment apartment = new Apartment(houseNumber, apartmentNumber, level, totalSpace, priceUsd, status, livingSpace, rooms);
        apartmentService.addApartment(apartment);
        model.addAttribute("allObjects", objectService.getAll());
        return "redirect:/objects";
    }

    @RequestMapping(value = "/parking/add", method = RequestMethod.POST)
    public String objectAdd(@RequestParam String houseNumber,
                            @RequestParam String level,
                            @RequestParam Double totalSpace,
                            @RequestParam Double priceUsd,
                            @RequestParam StatusObj status,
                            @RequestParam String parkingNumber,
                            Model model) {
        Parking parking = new Parking(houseNumber, level, totalSpace, priceUsd, status, parkingNumber);
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
            model.addAttribute("statusList", getStatusObjs());
            return "object_edit";
        }
        if (objectOfSale.getType().equals("Паркинг")) {
            model.addAttribute("editObject", parkingService.getById(toUpdate));
            model.addAttribute("statusList", getStatusObjs());
            return "object_edit";
        }
        return "index"; // <--- Здесь надо бы вернуть какую то ошибку, но пока пусть буде так!
    }

    @RequestMapping(value = "/apartment/update", method = RequestMethod.POST)
    public String objectUpdate(@RequestParam String id,
                               @RequestParam String houseNumber,
                               @RequestParam String apartmentNumber,
                               @RequestParam String level,
                               @RequestParam Double totalSpace,
                               @RequestParam Double priceUsd,
                               @RequestParam StatusObj status,
                               @RequestParam Double livingSpace,
                               @RequestParam Integer rooms,
                               @RequestParam Double discount,
                               Model model) {
        Apartment apartment = new Apartment(houseNumber, apartmentNumber, level, totalSpace, priceUsd, discount, status, livingSpace, rooms);
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
                               @RequestParam Double totalSpace,
                               @RequestParam Double priceUsd,
                               @RequestParam StatusObj status,
                               @RequestParam Double discount,
                               Model model) {
        Parking parking = new Parking(houseNumber, level, totalSpace, priceUsd, status, parkingNumber, discount);
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
