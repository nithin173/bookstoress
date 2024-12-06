<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOC TYPE html>
<html>
<head>
    <title>Purchase Book</title>
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
        <h1>Purchase Confirmation</h1>

        <c:if test="${book != null}">
            <p><strong>Book Title:</strong> ${book.title}</p>
            <p><strong>Author:</strong> ${book.author}</p>
            <p><strong>Price:</strong> $${book.price}</p>
            <p><strong>Stock Available:</strong> ${book.stock}</p>

            <form action="PurchaseBookServlet" method="post">
                <div class="form-control">
                    <label for="quantity">Quantity:</label>
                    <input type="number" name="quantity" id="quantity" min="1" max="${book.stock}" required>
                </div>
                <input type="hidden" name="bookId" value="${book.bookId}">
                <button type="submit" class="btn">Confirm Purchase</button>
            </form>
        </c:if>

        <c:if test="${error != null}">
            <p style="color: red;">${error}</p>
        </c:if>

        <c:if test="${success != null}">
            <p style="color: green;">${success}</p>
        </c:if>

        <a href="browseBooks.jsp">Back to Browse</a>
    </div>
</body>
</html>
