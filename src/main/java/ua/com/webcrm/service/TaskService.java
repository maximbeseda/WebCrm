package ua.com.webcrm.service;

import ua.com.webcrm.entity.Task;

import java.util.List;


public interface TaskService {
    Task addTask(Task task);
    void delete(long id);
    Task getByName(String name);
    Task editTask(Task task);
    List<Task> getAll();
}
