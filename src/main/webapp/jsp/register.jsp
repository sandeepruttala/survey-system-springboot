<!DOCTYPE html>

<head>
    <title>Surveys: Register</title>
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

        p {
            font-size: 24px;
            font-weight: 900;
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
            padding: 15px;
            width: 100%;
            border: 2px solid #8f8f8f;
            border-radius: 2px;
            font-size: 16px;
        }

        input:focus {
            border: 2px solid #7248b9;
            outline: none;
        }

        ::placeholder {
            color: #b2b2b2;
        }

        button {
            color: white;
            background-color: #7248b9;
            border: none;
            padding: 15px;
            font-size: 1rem;
            font-weight: 900;
            width: 100%;
            border-radius: 2px;
            cursor: pointer;
        }

        a {
            text-decoration: none;
            color: #7248b9;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <form action="save" method="post" class="form">
        <p>Register to Surveys</p>
        <div style="height: 24px;"></div>
        <input type="text" name="username" id="username" placeholder="Username" required>
        <div style="height: 16px;"></div>
        <input type="password" name="password" id="password" placeholder="Password" required>
        <div style="height: 40px;"></div>
        <button type="submit">Login</button>
        <div style="height: 24px;"></div>
        <div><span style="color: #8f8f8f;">Don't have an account?</span> <a href="/register">Register here</a></div>
    </form>
</body>