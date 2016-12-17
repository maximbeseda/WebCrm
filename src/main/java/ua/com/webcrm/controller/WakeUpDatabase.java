package ua.com.webcrm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import ua.com.webcrm.service.ManagerService;


@Service
@EnableScheduling
public class WakeUpDatabase {

    @Autowired
    private ManagerService managerService;

    @Scheduled(fixedDelay = 21600000)
    public void smartQuery(){
        managerService.getAll();
    }
}
