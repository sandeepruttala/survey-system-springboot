package com.survey.controllers;

import com.survey.models.Question;
import com.survey.models.SurveyResponse;
import com.survey.models.User;
import com.survey.models.Survey;
import com.survey.service.QuestionService;
import com.survey.service.SurveyResponseService;
import com.survey.service.SurveyService;
import com.survey.service.UserService;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;
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
    @Autowired
    private SurveyResponseService surveyResponseService;

    @PostMapping("/save")
    public String save(User user) {
        userService.saveUser(user);
        return "redirect:/login";

    }

    @PostMapping("/authenticate")
    public String authenticate(User user, HttpSession session) {
        boolean isUserAuthenticated = userService.authenticateUser(user);
        if (isUserAuthenticated) {
            User u = userService.getAllUsers().stream().filter(user1 -> user1.getUsername().equals(user.getUsername())).findFirst().get();
            session.setAttribute("id", u.getId());
            session.setAttribute("username", user.getUsername());
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
    List<Question> questions = survey.getQuestions();
    questions.clear();

    for (int i = 0; i < question.size(); i++) {
        Question q = new Question();
        q.setQuestion(question.get(i));
        q.setOption1(option1.get(i));
        q.setOption2(option2.get(i));
        q.setOption3(option3.get(i));
        q.setOption4(option4.get(i));
        q.setSurvey(survey);
        questionService.saveQuestion(q);
        questions.add(q);
    }

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
        List<Question> questions = survey.getQuestions();
        questions.clear();

        for (int i = 0; i < question.size(); i++) {
            Question q = new Question();
            q.setQuestion(question.get(i));
            q.setOption1(option1.get(i));
            q.setOption2(option2.get(i));
            q.setOption3(option3.get(i));
            q.setOption4(option4.get(i));
            q.setSurvey(survey);
            questionService.saveQuestion(q);
            questions.add(q);
        }

        surveyService.saveSurvey(survey);
        return "redirect:/home";
    }

    @PostMapping("/saveResponse/{surveyId}")
    public String saveResponse(@PathVariable("surveyId") Long surveyId, HttpServletRequest request, HttpSession session) {
        if (session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        Survey survey = surveyService.getSurveybyid(surveyId);
        List<String> answers = new ArrayList<>();

        int count = 0;
        while (request.getParameter("question" + count) != null) {
            String response = request.getParameter("question" + count);
            answers.add(response);
            count++;
        }

        User respondent = userService.getUserById((Long) session.getAttribute("id"));
        SurveyResponse surveyResponse = new SurveyResponse(survey, respondent, answers);
        surveyResponseService.saveSurveyResponse(surveyResponse);

        return "redirect:/home";
    }

    @PostMapping("/export_responses/{id}")
    public void exportResponses(@PathVariable Long id, HttpServletResponse response) throws IOException {

        List<SurveyResponse> surveyResponse = surveyResponseService.getSurveyResponsesBySurveyId(id);
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"survey-responses-" + id + ".csv\"");
        PrintWriter writer = response.getWriter();
        writer.println("Survey Title, Respondent, Response");
        for (SurveyResponse res : surveyResponse) {
//            writer.println(sr.getSurvey().getTitle() + "," + sr.getRespondent().getUsername() + "," + sr.getAnswers());
            String respondentName = res.getRespondent().getUsername();
                String answers = String.join(",", res.getAnswers());
                writer.printf("%d,%s,\"%s\"%n", res.getId(), respondentName, answers);
        }
        writer.flush();
    }
}
