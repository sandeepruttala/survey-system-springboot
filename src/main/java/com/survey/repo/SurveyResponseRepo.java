package com.survey.repo;

import com.survey.models.SurveyResponse;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SurveyResponseRepo extends JpaRepository<SurveyResponse, Long> {
    public List<SurveyResponse> findSurveyResponseBySurveyId(long id);
}
