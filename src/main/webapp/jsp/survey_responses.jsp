<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <title>Survey Responses</title>
</head>
<body>
    <h1>Survey Responses for Survey ID: ${id} (${survey.title})</h1>
    <table border="1">
        <tr>
            <th>Response ID</th>
            <th>Respondent Name</th>
            <th>Answers</th>
        </tr>
        <c:forEach var="response" items="${responses}">
            <tr>
                <td>${response.id}</td>
                <td>${response.respondent.username}</td>
                <td>
                    <c:forEach var="answer" items="${response.answers}">
                            <li>${answer}</li>
                        </c:forEach>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="/view_all_surveys">Back to Surveys</a>
</body>