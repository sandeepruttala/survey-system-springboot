package com.survey;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan("com.survey.models")
@EnableJpaRepositories("com.survey.repo")
public class SurveySystemSpringBootApplication {

    public static void main(String[] args) {
        SpringApplication.run(SurveySystemSpringBootApplication.class, args);
    }

}
