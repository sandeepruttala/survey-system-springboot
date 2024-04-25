<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<head>
    <title>Edit Survey</title>
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

        .heading {
            font-size: 32px;
            font-weight: 600;
        }

        .form {
            width: 700px;
            margin: auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        .display {
            padding: 15px;
            width: 100%;
            border: 2px solid #8f8f8f;
            border-radius: 2px;
            font-size: 16px;
        }

        .display:focus {
            border: 2px solid #7248b9;
            outline: none;
        }

        textarea {
            height: 20vh;
            padding: 15px;
            width: 100%;
            border: 2px solid #8f8f8f;
            border-radius: 2px;
            font-size: 16px;
        }

        textarea:focus {
            border: 2px solid #7248b9;
            outline: none;
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

        #questions input {
            padding: 15px;
            width: 650px;
            border: 2px solid #8f8f8f;
            border-radius: 2px;
            font-size: 16px;
        }
    </style>
</head>

<body>
    <form action="/updateSurvey/${survey.id}" method="post" class="form">
        <p class="heading">Edit Survey</p>
        <div style="height: 24px;"></div>
        <input type="text" name="title" value="${survey.title}" placeholder="Title" class="display">
        <div style="height: 16px;"></div>
        <textarea cols="30" rows="10" name="description" placeholder="Description"
            required>${survey.description}</textarea>
        <div style="height: 40px;"></div>

        <button type="button" id="addQuestion">Add Question</button>
        <div style="height: 16px;"></div>
        <div id="questions">
            <c:forEach var="question" items="${survey.questions}">
                <div>
                    <input type="text" name="question" value="${question.question}" placeholder="Question"
                        style="background-color: #f2e5fd;">
                    <div style="height: 16px;"></div>
                    <input type="text" name="option1" value="${question.option1}" placeholder="Option 1" required>
                    <div style="height: 16px;"></div>
                    <input type="text" name="option2" value="${question.option2}" placeholder="Option 2" required>
                    <div style="height: 16px;"></div>
                    <input type="text" name="option3" value="${question.option3}" placeholder="Option 3" required>
                    <div style="height: 16px;"></div>
                    <input type="text" name="option4" value="${question.option4}" placeholder="Option 4" required>
                    <br>
                </div>
                <br>
            </c:forEach>
        </div>
        <div style="height: 40px;"></div>
        <button type="submit">Update Survey</button>
    </form>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('addQuestion').addEventListener('click', function () {
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