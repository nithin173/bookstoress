package user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import dao.BookDAO;
import model.Book;
import java.util.List;

public class SearchBooksServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");

        // You need to implement this method to fetch books based on the search query
        BookDAO bookDAO = new BookDAO();
        List<Book> books = bookDAO.searchBooks(query);

        request.setAttribute("books", books);
        request.getRequestDispatcher("/user/browseBooks.jsp").forward(request, response);
    }
}
