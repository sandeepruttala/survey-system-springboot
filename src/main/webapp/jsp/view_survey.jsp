<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="count" value="0" />
<c:set var="count" value="0" />
<!DOCTYPE html>

<head>
    <title>Survey: ${survey.title}</title>
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
            justify-content: center;
            align-items: center;
        }

        .h1 {
            font-size: 32px;
            font-weight: 600;
        }

        .form {
            width: 100%;
            max-width: 500px;
            margin: auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        input {
            margin-bottom: 10px;
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
    </style>
</head>

<body>

    <form action="/saveResponse/${survey.id}" method="post" class="form">
        <h1>${survey.title}</h1>
        <div style="height: 32px;"></div>
        <p>Created by <span style="font-weight: 600; color: #7248b9;">${survey.creator.username}</span></p>
        <div style="height: 16px;"></div>
        <!-- <p>${survey.description}</p> -->
        <div style="background-color: #f5f1fc; padding: 15px; border-radius: 2px; width: 100%;">
            <span style="font-weight: 600; color: #7248b9;">Description</span><br><br>
            <p style=" text-wrap: wrap;">${survey.description}</p>
        </div>

        <div style="height: 32px;"></div>
        <c:forEach var="question" items="${survey.questions}">
            <div style="background-color: #f5f1fc; padding: 15px; border-radius: 2px; width: 100%;">
                <h2 style="font-size: 16px; font-weight: 600; text-wrap: wrap;">${question.question}
                </h2>
                <div style="height: 16px;"></div>
                <input type="radio" name="question${count}" value="${question.option1}">&nbsp;${question.option1}<br>
                <input type="radio" name="question${count}" value="${question.option2}">&nbsp;${question.option2}<br>
                <input type="radio" name="question${count}" value="${question.option3}">&nbsp;${question.option3}<br>
                <input type="radio" name="question${count}" value="${question.option4}">&nbsp;${question.option4}<br>
                <c:set var="count" value="${count + 1}" />
            </div>
        </c:forEach>
        <div style="height: 40px;"></div>
        <button type="submit" value="Submit">Submit</button>
    </form>

</body>