<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOC TYPE html>
<html>
<head>
    <title>Search Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            text-align: center;
        }
        form {
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
        }
        input[type="text"] {
            padding: 8px;
            width: 300px;
            margin-right: 10px;
        }
        button {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .no-results {
            text-align: center;
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Search Books</h1>

        <form action="SearchBooksServlet" method="get">
            <input type="text" name="query" placeholder="Enter book title or author..." required>
            <button type="submit">Search</button>
        </form>

        <c:if test="${books != null && not empty books}">
            <table>
                <tr>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="book" items="${books}">
                    <tr>
                        <td>${book.title}</td>
                        <td>${book.author}</td>
                        <td>$${book.price}</td>
                        <td>${book.stock}</td>
                        <td>
                            <form action="PurchaseBookServlet" method="post">
                                <input type="hidden" name="bookId" value="${book.bookId}">
                                <input type="number" name="quantity" min="1" max="${book.stock}" required>
                                <button type="submit">Buy</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

        <c:if test="${books != null && empty books}">
            <p class="no-results">No books found matching your query.</p>
        </c:if>

       <a href="${pageContext.request.contextPath}/browseBooks.jsp">Back to Browse</a>

    </div>
</body>
</html>


