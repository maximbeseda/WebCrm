package ua.com.webcrm.entity.enums;


public enum StatusObj {
    SOLD, RESERVE, FREE, NOT_SALE;

    @Override
    public String toString() {
        return name();
    }
}
