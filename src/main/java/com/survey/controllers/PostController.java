package com.survey.controllers;

import com.survey.models.User;
import com.survey.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import jakarta.servlet.http.HttpSession;

@Controller
public class PostController {

    @Autowired
    private UserService userService;
    @Autowired
    private HttpSession session;

    @PostMapping("/save")
    public String save(User user) {
        userService.saveUser(user);
        return "redirect:/login";

    }

    @PostMapping("/authenticate")
    public String authenticate(User user) {
        boolean isUserAuthenticated = userService.authenticateUser(user);
        if (isUserAuthenticated) {
            session.setAttribute("username", user.getUsername());
            session.setAttribute("id", user.getId());
            session.setAttribute("isAuthenticated", true);
            return "redirect:/home";
        } else {
            return "redirect:/login";
        }
    }
}
