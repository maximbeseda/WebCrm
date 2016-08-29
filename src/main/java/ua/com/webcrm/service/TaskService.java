package ua.com.webcrm.service;

import ua.com.webcrm.entity.Task;

import java.util.List;

/**
 * Created by Максим Беседа on 26.08.2016.
 */
public interface TaskService {
    Task addTask(Task task);
    void delete(long id);
    Task getByName(String name);
    Task editTask(Task task);
    List<Task> getAll();
}
