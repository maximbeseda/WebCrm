package ua.com.webcrm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ua.com.webcrm.entity.Manager;
import ua.com.webcrm.service.ManagerService;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by Максим Беседа on 25.08.2016.
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private ManagerService managerService;

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        Manager manager = managerService.getByLogin(login);
        if (manager == null) {
            throw new UsernameNotFoundException(login + " not found");
        }

        Set<GrantedAuthority> roles = new HashSet<>();
        roles.add(new SimpleGrantedAuthority(manager.getRole().toString()));

        return new User(manager.getLogin(), manager.getPassword(), roles);
    }
}
