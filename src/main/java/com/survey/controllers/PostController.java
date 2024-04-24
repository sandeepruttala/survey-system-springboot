package com.survey.controllers;

import com.survey.models.Question;
import com.survey.models.User;
import com.survey.models.Survey;
import com.survey.service.QuestionService;
import com.survey.service.SurveyService;
import com.survey.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class PostController {

    @Autowired
    private UserService userService;
    @Autowired
    private SurveyService surveyService;
    @Autowired
    private QuestionService questionService;

    @PostMapping("/save")
    public String save(User user) {
        userService.saveUser(user);
        return "redirect:/login";

    }

    @PostMapping("/authenticate")
    public String authenticate(User user, HttpSession session) {
        boolean isUserAuthenticated = userService.authenticateUser(user);
        if (isUserAuthenticated) {
            session.setAttribute("username", user.getUsername());
            List<User> users = userService.getAllUsers();
            for (User u : users) {
                if (u.getUsername().equals(user.getUsername()) && u.getPassword().equals(user.getPassword())) {
                    session.setAttribute("id", u.getId());
                }
            }
            session.setAttribute("isAuthenticated", true);
            return "redirect:/home";
        } else {
            return "redirect:/login";
        }
    }

    @PostMapping("/saveSurvey")
public String saveSurvey(HttpSession session,
                         @RequestParam String title,
                         @RequestParam String description,
                         @RequestParam List<String> question,
                         @RequestParam List<String> option1,
                         @RequestParam List<String> option2,
                         @RequestParam List<String> option3,
                         @RequestParam List<String> option4
                        ) {
    Survey survey = new Survey();
    survey.setTitle(title);
    survey.setDescription(description);
    survey.setCreator(userService.getUserById((Long) session.getAttribute("id")));
    surveyService.saveSurvey(survey);
    // Instead of setting a new list, use the getter and clear/add
    List<Question> questions = survey.getQuestions();
    questions.clear();  // Clears the existing list instead of creating a new one

    for (int i = 0; i < question.size(); i++) {
        Question q = new Question();
        q.setQuestion(question.get(i));
        q.setOption1(option1.get(i));
        q.setOption2(option2.get(i));
        q.setOption3(option3.get(i));
        q.setOption4(option4.get(i));
        q.setSurvey(survey);  // Maintain back reference
        questionService.saveQuestion(q);
        questions.add(q);    // Add to the existing list
    }

    // Now that we've modified the existing collection, we can save
    surveyService.saveSurvey(survey);
    return "redirect:/home";
}

    @PostMapping("/updateSurvey/{id}")
    public String updateSurvey(HttpSession session,
                               @PathVariable Long id,
                               @RequestParam String title,
                               @RequestParam String description,
                               @RequestParam List<String> question,
                               @RequestParam List<String> option1,
                               @RequestParam List<String> option2,
                               @RequestParam List<String> option3,
                               @RequestParam List<String> option4
    ) {
        Survey survey = surveyService.getSurveybyid(id);
        survey.setTitle(title);
        survey.setDescription(description);
        survey.setCreator(userService.getUserById((Long) session.getAttribute("id")));
        surveyService.saveSurvey(survey);
        // Instead of setting a new list, use the getter and clear/add
        List<Question> questions = survey.getQuestions();
        questions.clear();  // Clears the existing list instead of creating a new one

        for (int i = 0; i < question.size(); i++) {
            Question q = new Question();
            q.setQuestion(question.get(i));
            q.setOption1(option1.get(i));
            q.setOption2(option2.get(i));
            q.setOption3(option3.get(i));
            q.setOption4(option4.get(i));
            q.setSurvey(survey);  // Maintain back reference
            questionService.saveQuestion(q);
            questions.add(q);    // Add to the existing list
        }

        // Now that we've modified the existing collection, we can save
        surveyService.saveSurvey(survey);
        return "redirect:/home";
    }

}
