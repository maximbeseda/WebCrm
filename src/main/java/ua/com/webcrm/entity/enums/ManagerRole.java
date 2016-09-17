package ua.com.webcrm.entity.enums;

/**
 * Created by Максим Беседа on 24.08.2016.
 */
public enum ManagerRole {
    ADMIN, SALES_MANAGER, CONTRACT_MANAGER, HEAD_SALES_MANAGER;

    @Override
    public String toString() {
        return "ROLE_" + name();
    }
}
