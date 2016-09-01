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

    @RequestMapping(value = "/")
    public String index(Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        Manager dbUser = managerService.getByLogin(login);

        model.addAttribute("login", login);
        model.addAttribute("roles", user.getAuthorities());
        model.addAttribute("email", dbUser.getEmail());
        model.addAttribute("phone", dbUser.getPhone());

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

    @RequestMapping("/admin")
    public String admin(){
        return "admin";
    }

    @RequestMapping("/unauthorized")
    public String unauthorized(Model model){
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("login", user.getUsername());
        return "unauthorized";
    }

    @RequestMapping("/analytics")
    public String analytics(){
        return "analytics";
    }

    @RequestMapping("/contacts")
    public String contacts(){
        return "contacts";
    }

    @RequestMapping("/contracts")
    public String contracts(){
        return "contracts";
    }

    @RequestMapping("/documents")
    public String documents(){
        return "documents";
    }

    @RequestMapping("/objects")
    public String objects(){
        return "objects";
    }

    @RequestMapping("/reports")
    public String reports(){
        return "reports";
    }

    @RequestMapping("/tasks")
    public String tasks(){
        return "tasks";
    }
}
