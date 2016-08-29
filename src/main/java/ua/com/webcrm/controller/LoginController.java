package ua.com.webcrm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Максим Беседа on 25.08.2016.
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {
    @RequestMapping
    public String loginPage() {
        return "login";
    }
}
