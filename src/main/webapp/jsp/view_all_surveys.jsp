<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <title>View Surveys</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: "Google Sans", sans-serif;
            box-sizing: border-box;
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

        .heading {
            margin-top: 20px;
            font-size: 32px;
            font-weight: 600;
            color: #7248b9;
        }

        .back {
            padding: 10px 15px;
            border-radius: 2px;
            border: none;
            color: white;
            background-color: #7248b9;
            cursor: pointer;
            text-decoration: none;
            margin-bottom: 20px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th {
            background-color: #efe6ff;
            color: black;
            padding: 10px;
        }


    </style>
    <script src="https://kit.fontawesome.com/7d28e2d113.js" crossorigin="anonymous"></script>
</head>

<body>
    <p class="heading">View Surveys</p>
    <div style="height: 24px;"></div>
    <a href="home" class="back">
        <i class="fa-solid fa-arrow-left"></i>&nbsp;&nbsp;<span style="font-weight: 600;">Back</span></a>
    <table border="1">
        <tr>
            <th><span style="font-weight: 600;">Survey ID</span></th>
            <th><span style="font-weight: 600;">Survey Name</span></th>
            <th><span style="font-weight: 600;">Survey Description</span></th>
            <th><span style="font-weight: 600;">Actions</span></th>
            <th><span style="font-weight: 600;">View Responses</span></th>
        </tr>
        <c:forEach var="survey" items="${surveys}">
            <tr>
                <td style="text-align: center">${survey.id}</td>
                <td style="text-align: center">${survey.title}</td>
                <td style="text-align: center">${survey.description}</td>
                <td style=" text-align: center;">
                    <a href="survey/${survey.id}" style="color: #7248b9; text-decoration: none;">View</a><br>
                    <a href="edit_survey/${survey.id}"style="color: #7248b9; text-decoration: none;">Edit</a><br>
                    <a href="delete_survey/${survey.id}"style="color: #7248b9; text-decoration: none;">Delete</a>
                </td>
                <td style="text-align: center;">
                    <a href="survey_responses/${survey.id}" class="responses" style="color: #7248b9; text-decoration: none;">View Responses</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>

</html>