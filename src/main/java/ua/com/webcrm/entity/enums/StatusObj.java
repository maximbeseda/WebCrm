package ua.com.webcrm.entity.enums;

/**
 * Created by Максим Беседа on 24.08.2016.
 */
public enum StatusObj {
    Продан, Резерв, Свободен, Не_продается;

    @Override
    public String toString() {
        return name();
    }
}
