<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
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
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin: 10px 0 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="number"] {
            padding: 10px;
            font-size: 16px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            padding: 10px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .back-link {
            text-align: center;
            margin-top: 15px;
        }
        .back-link a {
            text-decoration: none;
            color: #007bff;
        }
        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Book</h1>
        <form action="AddBookServlet" method="post">
            <label for="title">Book Title:</label>
            <input type="text" id="title" name="title" placeholder="Enter book title" required>

            <label for="author">Author:</label>
            <input type="text" id="author" name="author" placeholder="Enter author name" required>

            <label for="price">Price:</label>
            <input type="number" id="price" name="price" placeholder="Enter book price" step="0.01" required>

            <label for="stock">Stock Quantity:</label>
            <input type="number" id="stock" name="stock" placeholder="Enter stock quantity" required>

            <button type="submit">Add Book</button>
        </form>
        <div class="back-link">
            <a href="manageBooks.jsp">Back to Manage Books</a>
        </div>
    </div>
</body>
</html>
