package com.survey.controllers;

import com.survey.models.Survey;
import com.survey.models.SurveyResponse;
import com.survey.service.SurveyResponseService;
import org.springframework.ui.Model;
import com.survey.service.QuestionService;
import com.survey.service.SurveyService;
import com.survey.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import jakarta.servlet.http.HttpSession;

import java.util.List;

@Controller
public class GetController {

    @Autowired
    private UserService userService;
    @Autowired
    private SurveyService surveyService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private SurveyResponseService surveyResponseService;

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

    @GetMapping("/view_all_surveys")
    public String viewSurvey(HttpSession session, Model model){
        if (session.getAttribute("isAuthenticated") == null) {
            return "redirect:/login";
        }
        Long userId = (Long) session.getAttribute("id");
        List<Survey> surveys = surveyService.findSurveysByCreatorId(userId);
        model.addAttribute("surveys", surveys);
        return "view_all_surveys";
    }

    @GetMapping("/survey/{id}")
    public String viewSurvey(Model model, @PathVariable Long id){
        Survey survey = surveyService.getSurveybyid(id);
        model.addAttribute("survey", survey);
        return "view_survey";
    }

    @GetMapping("/delete_survey/{id}")
    public String deleteSurvey(@PathVariable Long id){
        surveyService.deleteSurvey(id);
        return "redirect:/view_all_surveys";
    }

    @GetMapping("/edit_survey/{id}")
    public String editSurvey(Model model, @PathVariable Long id){
        Survey survey = surveyService.getSurveybyid(id);
        model.addAttribute("survey", survey);
        return "edit_survey";
    }

    @GetMapping("/search_survey")
    public String searchSurvey(@RequestParam String query, Model model){
        List<Survey> surveys = surveyService.searchSurveyByQuery(query);
        model.addAttribute("surveys",surveys);
        return "home";
    }

    @GetMapping("/survey_responses/{id}")
    public String surveyResponses(Model model, @PathVariable Long id){
        Survey survey = surveyService.getSurveybyid(id);
        List<SurveyResponse> surveyResponses = surveyResponseService.getSurveyResponsesBySurveyId(id);
        model.addAttribute("responses", surveyResponses);
        model.addAttribute("survey", survey);
        return "survey_responses";
    }
}
