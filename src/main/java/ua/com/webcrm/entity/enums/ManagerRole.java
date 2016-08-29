package ua.com.webcrm.entity.enums;

/**
 * Created by Максим Беседа on 24.08.2016.
 */
public enum ManagerRole {
    ADMIN, SALES_MANAGER, CONTRACT_DEP_MANAGER, HEAD_OF_SALES_DEP, HEAD_OF_CONTRACT_DEP;

    @Override
    public String toString() {
        return "ROLE_" + name();
    }
}
