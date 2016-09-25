package ua.com.webcrm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;

/**
 * Created by Максим Беседа on 25.08.2016.
 */
@Configuration
@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

//    @Bean
//    public CommandLineRunner demo(final ManagerService managerService, ContractTypeService contractTypeService) {
//        return strings -> {
//            managerService.addManager(new Manager("Максим Беседа", "0000", ManagerRole.ADMIN, "admin", "7110eda4d09e062aa5e4a390b0a572ac0d2c0220"));
//            managerService.addManager(new Manager("Максим Беседа", "1111", ManagerRole.SALES_MANAGER, "manager", "7110eda4d09e062aa5e4a390b0a572ac0d2c0220"));
//            contractTypeService.addContractType(new ContractType("Договор купли-продажи ЦБ"));
//            contractTypeService.addContractType(new ContractType("Предварительный договор"));
//            contractTypeService.addContractType(new ContractType("Основной договор"));
//        };
//    }
}
