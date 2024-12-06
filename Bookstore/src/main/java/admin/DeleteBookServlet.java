package admin;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import dao.BookDAO;

public class DeleteBookServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        BookDAO bookDAO = new BookDAO();

        if (bookDAO.deleteBook(bookId)) {
            response.sendRedirect(request.getContextPath() + "/admin/manageBooks.jsp");
        } else {
            response.sendRedirect("/admin/manageBooks.jsp?error=Failed to delete book.");
        }
    }
}
