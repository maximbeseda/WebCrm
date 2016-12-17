package ua.com.webcrm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value = "/login")
public class LoginController {
    @RequestMapping
    public String loginPage() {
        return "login";
    }
}
