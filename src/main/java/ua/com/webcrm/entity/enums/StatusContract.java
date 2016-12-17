package ua.com.webcrm.entity.enums;


public enum StatusContract {
    SIGNED, PREPARE, APPROVED, BROKEN, CANCELED;

    @Override
    public String toString() {
        return name();
    }
}
