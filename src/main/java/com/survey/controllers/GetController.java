package com.survey.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import jakarta.servlet.http.HttpSession;

@Controller
public class GetController {

    @GetMapping("/error")
    public String error() {
        return "error";
    }

    @GetMapping("/")
    public String index() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @GetMapping("/home")
    public String home(HttpSession session){
        if (session.getAttribute("isAuthenticated") == null) {
            return "redirect:/login";
        }
        return "home";
    }

    @GetMapping("/create_survey")
    public String createSurvey(HttpSession session){
        if (session.getAttribute("isAuthenticated") == null) {
            return "redirect:/login";
        }
        return "create_survey";
    }

}
