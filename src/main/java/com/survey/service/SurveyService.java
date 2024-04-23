package com.survey.service;
import com.survey.models.Survey;
import com.survey.repo.SurveyRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SurveyService {

    @Autowired
    private SurveyRepo surveyRepo;

    public Survey saveSurvey(Survey survey) {
        return surveyRepo.save(survey);
    }

    public Survey getSurveybyid(Long id) {
        return surveyRepo.findById(id).get();
    }

    public List<Survey> getAllSurveys() {
        return surveyRepo.findAll();
    }

    public void deleteSurvey(Long id) {
        surveyRepo.deleteById(id);
    }
}
