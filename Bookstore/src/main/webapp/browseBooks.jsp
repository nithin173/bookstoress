<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Browse Books</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #444;
        }

        form {
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
        }

        form input[type="text"] {
            width: 300px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        form button {
            padding: 10px 15px;
            margin-left: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        form button:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        table th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        table td form {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        table td form input[type="number"] {
            width: 50px;
            padding: 5px;
            margin-right: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            text-align: center;
        }

        table td form button {
            padding: 5px 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        table td form button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h1>Browse Books</h1>
    <form action="SearchBooksServlet" method="get">
        <input type="text" name="query" placeholder="Search books...">
        <button type="submit">Search</button>
    </form>
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
                <td>${book.price}</td>
                <td>${book.stock}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/user/PurchaseBookServlet" method="post">
                        <input type="hidden" name="bookId" value="${book.bookId}">
                        <input type="number" name="quantity" min="1" max="${book.stock}" required>
                        <button type="submit">Buy</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
