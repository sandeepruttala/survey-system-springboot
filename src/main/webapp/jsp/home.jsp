<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <title>Surveys: Home</title>
</head>

<body>
    <h1>Welcome to the Surveys Home Page</h1>
    <p>Logged in as ${username}</p>
    <p>id: ${id}</p>
    <a href="create_survey">Create Survey</a>
    <br>
    <a href="view_all_surveys">View your Surveys</a>
    <br>
    <a href="logout">Logout</a>
    <div class="explore">
        <form action="search_survey" method="get">
            <input type="text" name="query">
                <button type="submit">search</button>
        </form>
    </div>
    <div class="search-results">
        <h2>Search Results</h2>
        <ul>
            <c:forEach var="survey" items="${surveys}">
                <li>
                    <a href="survey/${survey.id}">${survey.title}</a>
                </li>
            </c:forEach>
        </ul>
    </div>
</body>