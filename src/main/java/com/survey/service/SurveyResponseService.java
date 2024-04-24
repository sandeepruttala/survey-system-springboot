package com.survey.service;

import com.survey.models.SurveyResponse;
import com.survey.repo.SurveyResponseRepo;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;


@Service
public class SurveyResponseService {

    @Autowired
    private SurveyResponseRepo surveyResponseRepo;

    public void saveSurveyResponse(SurveyResponse surveyResponse) {
        surveyResponseRepo.save(surveyResponse);
    }

}
