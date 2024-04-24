package com.survey.models;

import com.survey.models.Survey;
import com.survey.models.User;
import jakarta.persistence.*;
import java.util.List;

@Entity
public class SurveyResponse {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "survey_id", nullable = false)
    private Survey survey;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User respondent;

    @ElementCollection  // Use this for storing a list of strings
    private List<String> answers;

    // Constructors, getters, and setters
    public SurveyResponse() {
    }

    public SurveyResponse(Survey survey, User respondent, List<String> answers) {
        this.survey = survey;
        this.respondent = respondent;
        this.answers = answers;
    }

    // Standard getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Survey getSurvey() {
        return survey;
    }

    public void setSurvey(Survey survey) {
        this.survey = survey;
    }

    public User getRespondent() {
        return respondent;
    }

    public void setRespondent(User respondent) {
        this.respondent = respondent;
    }

    public List<String> getAnswers() {
        return answers;
    }

    public void setAnswers(List<String> answers) {
        this.answers = answers;
    }
}
