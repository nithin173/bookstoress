<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
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
            margin: 0 15px;
            padding: 12px 20px;
            text-decoration: none;
            background: #007bff;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .nav-links a:hover {
            background: #0056b3;
        }
        .nav-links a:active {
            background-color: #004085;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to the Admin Dashboard</h1>
        <p style="text-align:center;">Here you can manage books and view orders.</p>

        <!-- Navigation Links -->
        <div class="nav-links">
            <a href="addBook.jsp">Add New Book</a>
            <a href="manageBooks.jsp">Manage Books</a>
            <a href="viewOrders.jsp">View Orders</a>
        </div>

        <!-- Logout Link -->
        <div class="nav-links" style="margin-top: 30px;">
            <a href="logout.jsp">Logout</a>
        </div>
    </div>
</body>
</html>
