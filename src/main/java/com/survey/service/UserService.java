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

   public List<User> getAllUsers() {
        return userRepo.findAll();
    }

    public boolean authenticateUser(User user) {
        return userRepo.existsByUsernameAndPassword(user.getUsername(), user.getPassword());
    }

    public User getUserById(Long id) {
        return userRepo.findById(id).get();
    }
}
