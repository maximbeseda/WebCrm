package ua.com.webcrm.entity.enums;

/**
 * Created by Максим Беседа on 24.08.2016.
 */
public enum StatusObj {
    SOLD, RESERVE, FREE, NOT_SALE;

    @Override
    public String toString() {
        return name();
    }
}
