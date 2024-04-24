<!DOCTYPE html>
<head>
    <title>Create Survey</title>
</head>

<body>
    <h1>Create Survey</h1>
    <form action="/saveSurvey" method="post">
        <input type="text" name="title" placeholder="Title" required>
        <br>
        <textarea cols="30" rows="10" name="description" placeholder="Description" required></textarea>
        <br>
        <h3>Questions</h3>
        <button type="button" id="addQuestion">Add Question</button>
        <div id="questions">
            <!-- Dynamic questions will be added here -->
        </div>
        <button type="submit">Create Survey</button>
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
