<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<c:set var="count" value="${0}" />--%>

<!DOCTYPE html>

<head>
    <title>Survey Responses</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Google sans;
        }

        html,
        body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
        }

        button {
            color: white;
            background-color: #7248b9;
            border: none;
            padding: 10px;
            font-size: 1rem;
            font-weight: 600;
            width: 100%;
            border-radius: 2px;
            cursor: pointer;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th {
            background-color: #f5f1fc;
            font-weight: 600;
            padding: 10px;
        }

        td {
            padding: 10px;
        }
    </style>
    <script src="https://kit.fontawesome.com/7d28e2d113.js" crossorigin="anonymous"></script>
</head>

<body>
    <h1 style="font-size: 24px; font-weight: 600; margin-top: 40px;">Survey Responses for Survey ID: ${id}
        (${survey.title})</h1>
    <div style="height: 32px;"></div>
    <a href="/view_all_surveys"
        style="text-decoration: none; background-color: #7248b9; padding: 7px 15px; color: white; font-weight: 600; border-radius: 2px;">
        <i class="fa-solid fa-arrow-left"></i>&nbsp;
        Back to Surveys
    </a>
    <div style="height: 16px;"></div>
    <table border="1">
        <tr>
            <th>Response ID</th>
            <th>Respondent Name</th>
            <th>Answers</th>
        </tr>
        <c:forEach var="response" items="${responses}">
            <c:set var="count" value="${1}" />
            <tr style="text-align: center;">
                <td>${response.id}</td>
                <td>${response.respondent.username}</td>
                <td>
                    <c:forEach var="answer" items="${response.answers}">
                        <div style="text-align: left">${count}.&nbsp;${answer}</div>
                            <c:set var="count" value="${count + 1}" />
                    </c:forEach>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div style="height: 40px;"></div>
    <form action="/export_responses/${id}" method="post">
        <button type="submit">
            <i class="fa-solid fa-file-export"></i>&nbsp;Export Responses</button>
    </form>
</body>