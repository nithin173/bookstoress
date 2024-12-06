       <table>
           <tr>
               <th>Title</th>
               <th>Author</th>
               <th>Price</th>
               <th
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
