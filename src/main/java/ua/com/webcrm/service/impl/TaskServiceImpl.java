package ua.com.webcrm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.com.webcrm.entity.Task;
import ua.com.webcrm.repository.TaskRepository;
import ua.com.webcrm.service.TaskService;

import java.util.List;


@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskRepository taskRepository;

    @Override
    @Transactional
    public Task addTask(Task task) {
        Task savedTask = taskRepository.save(task);
        return savedTask;
    }

    @Override
    @Transactional
    public void delete(long id) {
        taskRepository.delete(id);
    }

    @Override
    @Transactional
    public Task getByName(String name) {
        return taskRepository.findByName(name);
    }

    @Override
    @Transactional
    public Task editTask(Task task) {
        return taskRepository.save(task);
    }

    @Override
    @Transactional
    public List<Task> getAll() {
        return taskRepository.findAll();
    }
}
