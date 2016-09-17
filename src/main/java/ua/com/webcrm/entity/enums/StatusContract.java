package ua.com.webcrm.entity.enums;

/**
 * Created by Максим Беседа on 24.08.2016.
 */
public enum StatusContract {
    SIGNED, PREPARE, APPROVED, CANCELED;

    @Override
    public String toString() {
        return name();
    }
}
