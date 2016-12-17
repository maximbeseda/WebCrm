package ua.com.webcrm.entity.enums;


public enum ManagerRole {
    ADMIN, SALES_MANAGER, CONTRACT_MANAGER, HEAD_SALES_MANAGER;

    @Override
    public String toString() {
        return "ROLE_" + name();
    }
}
