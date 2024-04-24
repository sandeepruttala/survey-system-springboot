package com.survey.service;
import com.survey.models.Survey;
import com.survey.repo.SurveyRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

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

    public List<Survey> findSurveysByCreatorId(Long id) {
        return surveyRepo.findByCreatorId(id);
    }

    public List<Survey> searchSurveyByQuery(String query){
        Pattern pattern = Pattern.compile(query, Pattern.CASE_INSENSITIVE);
        List<Survey> surveys = surveyRepo.findAll();

        return surveys.stream()
                .filter(survey -> pattern.matcher(survey.getTitle()).find())
                .collect(Collectors.toList());
    }
}
