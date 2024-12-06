<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
        }
        .form-control {
            margin-bottom: 15px;
        }
        .form-control label {
            display: block;
            font-weight: bold;
        }
        .form-control input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Book</h1>

        <c:if test="${book != null}">
            <form action="EditBookServlet" method="post">
                <div class="form-control">
                    <label for="title">Title:</label>
                    <input type="text" name="title" id="title" value="${book.title}" required>
                </div>
                <div class="form-control">
                    <label for="author">Author:</label>
                    <input type="text" name="author" id="author" value="${book.author}" required>
                </div>
                <div class="form-control">
                    <label for="price">Price:</label>
                    <input type="number" step="0.01" name="price" id="price" value="${book.price}" required>
                </div>
                <div class="form-control">
                    <label for="stock">Stock:</label>
                    <input type="number" name="stock" id="stock" value="${book.stock}" required>
                </div>
                <input type="hidden" name="bookId" value="${book.bookId}">
                <button type="submit" class="btn">Update Book</button>
            </form>
        </c:if>

        <c:if test="${error != null}">
            <p style="color: red;">${error}</p>
        </c:if>

        <c:if test="${success != null}">
            <p style="color: green;">${success}</p>
        </c:if>

        <a href="manageBooks.jsp">Back to Manage Books</a>
    </div>
</body>
</html>
