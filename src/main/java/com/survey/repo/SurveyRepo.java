package com.survey.repo;

import com.survey.models.Survey;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SurveyRepo extends JpaRepository<Survey, Long> {
    List<Survey> findByCreatorId(Long creatorId);
}
