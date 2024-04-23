package com.survey.repo;

import com.survey.models.SurveyResponse;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SurveyResponseRepo extends JpaRepository<SurveyResponse, Long> {

}
