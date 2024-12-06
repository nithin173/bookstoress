<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Management</title>
    <style>
        /* Reset and Basic Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #444;
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        /* Link Button Styles */
        a {
            text-decoration: none;
            color: #fff;
            padding: 10px 15px;
            border-radius: 4px;
            font-size: 14px;
        }

        a[href*="EditBookServlet"] {
            background-color: #ffc107;
        }

        a[href*="EditBookServlet"]:hover {
            background-color: #e0a800;
        }

        a[href*="DeleteBookServlet"] {
            background-color: #dc3545;
        }

        a[href*="DeleteBookServlet"]:hover {
            background-color: #bd2130;
        }

        a[href*="addBook.jsp"] {
            display: inline-block;
            margin: 20px 0;
            background-color: #28a745;
            text-align: center;
        }

        a[href*="addBook.jsp"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h1>Book Management</h1>
    <table>
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="book" items="${books}">
            <tr>
                <td>${book.title}</td>
                <td>${book.author}</td>
                <td>${book.price}</td>
                <td>${book.stock}</td>
                <td>
                    <a href="EditBookServlet?bookId=${book.bookId}">Edit</a>
                    <a href="DeleteBookServlet?bookId=${book.bookId}" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="addBook.jsp">Add New Book</a>
</body>
</html>
