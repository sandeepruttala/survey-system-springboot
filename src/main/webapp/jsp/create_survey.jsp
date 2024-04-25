<!DOCTYPE html>

<head>
    <title>Create Survey</title>
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
            justify-content: center;
            align-items: center;
        }

        .heading {
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

        .none {
            padding: 15px;
            width: 300px;
            border: 2px solid #8f8f8f;
            border-radius: 2px;
            font-size: 16px;
        }
    </style>
</head>

<body>
    <form action="/saveSurvey" method="post" class="form">
        <p class="heading">Create Survey</p>
        <div style="height: 24px;"></div>
        <input type="text" name="title" placeholder="Title" class="display" required>
        <div style="height: 16px;"></div>
        <textarea cols="30" rows="10" name="description" placeholder="Description" required></textarea>
        <div style="height: 40px;"></div>
        <button type="button" id="addQuestion">Add Question</button>
        <div id="questions">
            <!-- Dynamic questions will be added here -->
        </div>
        <div style="height: 16px;"></div>
        <button type="submit">Create Survey</button>
    </form>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            let count = 0;
            document.getElementById('addQuestion').addEventListener('click', function () {
                let question = document.createElement('div');
                question.innerHTML = `
                <div style="height: 16px;"></div>
                <input type="text" name="question" placeholder="Question" class="none" required>
                <div style="height: 16px;"></div>
                <input type="text" name="option1" placeholder="Option 1" class="none" required>
                <div style="height: 16px;"></div>
                <input type="text" class="none" name="option2" placeholder="Option 2" required>
                <div style="height: 16px;"></div>
                <input type="text" name="option3" placeholder="Option 3" class="none" required>
                <div style="height: 16px;"></div>
                <input type="text" name="option4" placeholder="Option 4" class="none" required>
                <div style="height: 16px;"></div>
            `;
                document.querySelector('#questions').appendChild(question);
            });
        });
    </script>
</body>