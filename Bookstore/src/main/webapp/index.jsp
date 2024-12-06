<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOC TYPE html>
<html>
<head>
    <title>Bookstore</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .nav-links {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .nav-links a {
            margin: 0 10px;
            padding: 10px 20px;
            text-decoration: none;
            background: #007bff;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .nav-links a:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to the Bookstore</h1>
        <p style="text-align:center;">Your one-stop destination for all your reading needs!</p>
        <div class="nav-links">
            <!-- Links for Users -->
            <a href="login.jsp">Login</a>
            <a href="searchBooks.jsp">Browse Books</a>

            <!-- Admin Section -->
            <a href="adminDashboard.jsp">Admin Dashboard</a>
        </div>
    </div>
</body>
</html>
