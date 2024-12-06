package admin;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import dao.BookDAO;
import model.Book;

public class AddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        Book book = new Book(title, author, price, stock);
        BookDAO bookDAO = new BookDAO();

        if (bookDAO.addBook(book)) {
            response.sendRedirect(request.getContextPath() + "/admin/manageBooks.jsp");
        } else {
            request.setAttribute("error", "Failed to add book.");
            request.getRequestDispatcher("/admin/addBook.jsp").forward(request, response);
        }
    }
}
