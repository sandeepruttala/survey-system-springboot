package com.survey.service;

import com.survey.models.SurveyResponse;
import com.survey.repo.SurveyResponseRepo;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


@Service
public class SurveyResponseService {

    @Autowired
    private SurveyResponseRepo surveyResponseRepo;

    public void saveSurveyResponse(SurveyResponse surveyResponse) {
        surveyResponseRepo.save(surveyResponse);
    }

    public List<SurveyResponse> getSurveyResponsesBySurveyId(Long id) {
        return surveyResponseRepo.findSurveyResponseBySurveyId(id);
    }
}
