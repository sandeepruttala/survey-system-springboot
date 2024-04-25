<!DOCTYPE html>

<head>
    <title>Surveys: Home</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: Sequel Sans;
            box-sizing: border-box;
        }

        body {
            background-color: #f5f1fc;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            padding: 15px;
            position: fixed;
            background: white;
            z-index: 1000;
            border-bottom: 2px solid #7248b966;
        }

        .heading {
            font-size: 20px;
            font-weight: 900;
            color: #7248b9;
        }

        button {
            padding: 12px 15px;
            border-radius: 2px;
            border: none;
            color: white;
            background-color: #7248b9;
            cursor: pointer;
        }

        ::placeholder {
            font-size: 16px;
            color: #8f8f8f;
        }

        input {
            width: 350px;
            padding: 10px;
            border: 2px solid #8f8f8f;
            border-radius: 2px;
            font-size: 14px;
        }

        input:focus {
            border: 2px solid #7248b9;
            outline: none;
        }

        .form {
            align-items: center;
        }

        .nav_bar {
            width: 220px;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            padding-top: 100px;
            background: white;
        }

        .nav_bar a {
            text-align: left;
            display: block;
            padding: 10px 15px;
            text-decoration: none;
            color: #7248b9;
            font-weight: 600;
        }

        .nav_bar a:hover {
            background: #f5f1fc;
        }

        .search-results {
            transform: translateY(220px);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .results li {
            padding: 10px;
            list-style: none;
        }

        .results {
            border-radius: 2px;
            background-color: white;
            width: 390px;
            border: 2px solid #7248b9;
            padding: 15px 10px;
        }

        #searchResults a {
            text-decoration: none;
            color: #7248b9;
        }
    </style>
    <script src="https://kit.fontawesome.com/7d28e2d113.js" crossorigin="anonymous"></script>
</head>

<body>
    <div class="header">
        <p class="heading">Surveys Home Page</p>
        <p>Welcome ${username}</p>
    </div>
    <nav class="nav_bar">
        <div>
            <a href="create_survey">Create Survey</a>
            <a href="view_all_surveys">View your Surveys</a>
        </div>
        <div style="height: 390px;"></div>
        <div>
            <a href="logout">Logout &nbsp;
                <i class="fa-solid fa-right-from-bracket"></i></a>
        </div>
    </nav>
    <div class="search-results">
        <form action="search_survey" method="get" class="form">
            <input type="text" name="query" id="searchInput" placeholder="Search" onkeyup="toggleSearchResults()"
                required>
            <button type="submit">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </form>
        <div style="height: 15px;"></div>
        <div class="results" id="searchResults" style="display: none;">
            <p style="color: #8f8f8f;">Search Results</p>
            <div style="height: 18px;"></div>
            <ul>
                <c:forEach var="survey" items="${surveys}">
                    <li>
                        <a href="survey/${survey.id}">${survey.title}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <script>
        // function toggleSearchResults() {
        //     var srchInput = document.getElementById('searchInput');
        //     var srchRslt = document.getElementById('searchResults');
        //     var btn = document.querySelector('button[type="submit"]');
        //
        //     if (srchInput.value.trim().length > 0) {
        //         btn.disabled = false;
        //         srchRslt.style.display = 'block';
        //     } else {
        //         btn.disabled = true;
        //         srchRslt.style.display = 'none';
        //     }
        // }

    </script>
</body>