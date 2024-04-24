<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <title>Edit Survey</title>
</head>

<body>
    <h1>Edit Survey</h1>
    <p>${survey.id}</p>
    <form action="/updateSurvey/${survey.id}" method="post">
        <input type="text" name="title" value="${survey.title}" placeholder="Title" required>
        <br>
        <textarea cols="30" rows="10" name="description" placeholder="Description" required>${survey.description}</textarea>
        <br>
        <h3>Questions</h3>
        <button type="button" id="addQuestion">Add Question</button>
        <div id="questions">
            <c:forEach var="question" items="${survey.questions}">
                <div>
                    <input type="text" name="question" value="${question.question}" placeholder="Question" required>
                    <br>
                    <input type="text" name="option1" value="${question.option1}" placeholder="Option 1" required>
                    <input type="text" name="option2" value="${question.option1}" placeholder="Option 2" required>
                    <input type="text" name="option3" value="${question.option3}" placeholder="Option 3" required>
                    <input type="text" name="option4" value="${question.option4}" placeholder="Option 4" required>
                    <br>
                </div>
            </c:forEach>
        </div>
        <button type="submit">UpdateSurvey</button>
    </form>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('addQuestion').addEventListener('click', function() {
            let question = document.createElement('div');
            question.innerHTML = `
                <input type="text" name="question" placeholder="Question" required>
                <br>
                <input type="text" name="option1" placeholder="Option 1" required>
                <input type="text" name="option2" placeholder="Option 2" required>
                <input type="text" name="option3" placeholder="Option 3" required>
                <input type="text" name="option4" placeholder="Option 4" required>
                <br>
            `;
            document.querySelector('#questions').appendChild(question);
        });
    });
    </script>
</body>