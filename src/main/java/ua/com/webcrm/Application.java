package ua.com.webcrm;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import ua.com.webcrm.entity.Manager;
import ua.com.webcrm.entity.enums.ManagerRole;
import ua.com.webcrm.service.ManagerService;

/**
 * Created by Максим Беседа on 25.08.2016.
 */
@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Bean
    public CommandLineRunner demo(final ManagerService managerService) {
        return new CommandLineRunner() {
            @Override
            public void run(String... strings) throws Exception {
                managerService.addManager(new Manager("admin", "0000", ManagerRole.ADMIN, "admin", "7110eda4d09e062aa5e4a390b0a572ac0d2c0220"));
            }
        };
    }
}