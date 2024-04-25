<!DOCTYPE html>
<html>
<head>
    <title>Error Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Google Sans", sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f8f8;
            color: #333;
            text-align: center;
            padding: 20px;
        }

        h1 {
            font-size: 2rem;
            color: #ff6347; /* Using a tomato color to highlight error */
        }

        p {
            font-size: 1.2rem;
            margin-top: 20px;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #7248b9;
            color: white;
            text-decoration: none;
            border-radius: 2px;
            font-weight: 500;
        }

        a:hover {
            background-color: #5f3e8c;
        }
    </style>
</head>

<body>
    <div>
        <h1>Oops! That's an Error.</h1>
        <p>Try refreshing the page or contact the administrator if the problem persists.</p>
        <a href="/home">Go Home</a> <!-- Assuming your home URL is just the root -->
    </div>
</body>
</html>
