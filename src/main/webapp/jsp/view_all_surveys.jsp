<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Surveys</title>
</head>
<body>
    <h1>View Surveys</h1>
    <a href="home">Back</a>
    <br>
    <br>
    <table border="1">
        <tr>
            <th>Survey ID</th>
            <th>Survey Name</th>
            <th>Survey Description</th>
            <th>Actions</th>
            <td>View Responses</td>
        </tr>
        <c:forEach var="survey" items="${surveys}">
            <tr>
                <td>${survey.id}</td>
                <td>${survey.title}</td>
                <td>${survey.description}</td>
                <td>
                    <a href="survey/${survey.id}">View</a> |
                    <a href="edit_survey/${survey.id}">Edit</a> |
                    <a href="delete_survey/${survey.id}">Delete</a>
                </td>
                <td>
                    <a href="survey_responses/${survey.id}">View Responses</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
