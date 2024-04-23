package com.survey.service;

import com.survey.models.Question;
import com.survey.repo.QuestionRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class QuestionService {

     @Autowired
    private QuestionRepo questionRepo;

    public Question saveQuestion(Question question) {
        return questionRepo.save(question);
    }

    public Question getQuestionbyid(Long id) {
        return questionRepo.findById(id).get();
    }


    public void deleteQuestion(Long id) {
        questionRepo.deleteById(id);
    }

    public void deleteAllQuestions() {
        questionRepo.deleteAll();
    }

}
