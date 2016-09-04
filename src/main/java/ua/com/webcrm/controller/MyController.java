package ua.com.webcrm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.com.webcrm.entity.Manager;
import ua.com.webcrm.service.ManagerService;

/**
 * Created by Максим Беседа on 25.08.2016.
 */
@Controller
public class MyController {

    @Autowired
    private ManagerService managerService;

    public Manager getUser (){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        return managerService.getByLogin(login);
    }

    @RequestMapping(value = "/")
    public String index(Model model){
        Manager dbUser = getUser();

        model.addAttribute("fullName", dbUser.getFullName());
        model.addAttribute("login", dbUser.getLogin());
        model.addAttribute("roles", dbUser.getRole());
        model.addAttribute("email", dbUser.getEmail());

        return "index";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam(required = false) String email, @RequestParam(required = false) String phone) {
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        Manager dbUser = managerService.getByLogin(login);
        dbUser.setEmail(email);
        dbUser.setPhone(phone);

        managerService.editManager(dbUser);

        return "redirect:/";
    }

    @RequestMapping("/users")
    public String admin(Model model){
        Manager dbUser = getUser();

        model.addAttribute("fullName", dbUser.getFullName());
        return "users";
    }

    @RequestMapping("/unauthorized")
    public String unauthorized(Model model){
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("login", user.getUsername());
        return "unauthorized";
    }

    @RequestMapping("/analytics")
    public String analytics(Model model){
        Manager dbUser = getUser();

        model.addAttribute("fullName", dbUser.getFullName());
        return "analytics";
    }

    @RequestMapping("/contacts")
    public String contacts(Model model){
        Manager dbUser = getUser();

        model.addAttribute("fullName", dbUser.getFullName());
        return "contacts";
    }

    @RequestMapping("/contracts")
    public String contracts(Model model){
        Manager dbUser = getUser();

        model.addAttribute("fullName", dbUser.getFullName());
        return "contracts";
    }

    @RequestMapping("/documents")
    public String documents(Model model){
        Manager dbUser = getUser();

        model.addAttribute("fullName", dbUser.getFullName());
        return "documents";
    }

    @RequestMapping("/objects")
    public String objects(Model model){
        Manager dbUser = getUser();

        model.addAttribute("fullName", dbUser.getFullName());
        return "objects";
    }

    @RequestMapping("/reports")
    public String reports(Model model){
        Manager dbUser = getUser();

        model.addAttribute("fullName", dbUser.getFullName());
        return "reports";
    }

    @RequestMapping("/tasks")
    public String tasks(Model model){
        Manager dbUser = getUser();

        model.addAttribute("fullName", dbUser.getFullName());
        return "tasks";
    }
}
