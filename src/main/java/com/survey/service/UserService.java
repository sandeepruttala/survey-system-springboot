package com.survey.service;

import com.survey.models.User;
import com.survey.repo.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepo userRepo;

    public User saveUser(User user) {
        return userRepo.save(user);
    }

    public User getUserbyid(Long id) {
        return userRepo.findById(id).get();
    }

   public List<User> getAllUsers() {
        return userRepo.findAll();
    }

    public boolean authenticateUser(User user) {
        List<User> users = userRepo.findAll();
        for (User u : users) {
            if (u.getUsername().equals(user.getUsername()) && u.getPassword().equals(user.getPassword())) {
                return true;
            }
        }
        return false;
    }
}
