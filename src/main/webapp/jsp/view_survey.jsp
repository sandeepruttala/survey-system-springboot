<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <title>Survey: ${survey.title}</title>
</head>
<body>

    <h1>${survey.title}</h1>
    <p>${survey.description}</p>

    <form action="submit" method="post">
        <c:forEach var="question" items="${survey.questions}">
            <h2>${question.question}</h2>
            <input type="radio" name="question" value="${question.option1}">${question.option1}<br>
            <input type="radio" name="question" value="${question.option2}">${question.option2}<br>
            <input type="radio" name="question" value="${question.option3}">${question.option3}<br>
            <input type="radio" name="question" value="${question.option4}">${question.option4}<br>
        </c:forEach>
        <input type="submit" value="Submit" />
    </form>

</body>