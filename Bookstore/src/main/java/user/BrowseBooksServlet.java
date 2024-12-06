package user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import dao.BookDAO;
import java.util.List;
import model.Book;

public class BrowseBooksServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookDAO bookDAO = new BookDAO();
        List<Book> books = bookDAO.getAllBooks();
        request.setAttribute("books", books);
        request.getRequestDispatcher("/user/browseBooks.jsp").forward(request, response);
    }
}
