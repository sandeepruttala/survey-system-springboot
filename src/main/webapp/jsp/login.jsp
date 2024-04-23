<!DOCTYPE html>
<head>
    <title>Surveys: Login</title>
</head>

<body>
    <h1>Surveys: Login</h1>
    <form action="authenticate" method="post">
        <input type="text" name="username" id="username" placeholder="Username" required>
        <br>
        <input type="password" name="password" id="password" placeholder="Password" required>
        <br>
        <input type="submit" value="Login">
    </form>
    <p>Don't have an account? <a href="/register">Register here</a></p>
</body>