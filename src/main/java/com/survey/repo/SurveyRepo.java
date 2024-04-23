package com.survey.repo;

import com.survey.models.Survey;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SurveyRepo extends JpaRepository<Survey, Long> {

}
