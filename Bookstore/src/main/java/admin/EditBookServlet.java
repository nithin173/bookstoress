package admin;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import dao.BookDAO;
import model.Book;

public class EditBookServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        BookDAO bookDAO = new BookDAO();
        Book book = bookDAO.getBookByID(bookId);
        request.setAttribute("book", book);
        request.getRequestDispatcher("editBook.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        Book book = new Book(bookId, title, author, price, stock);
        BookDAO bookDAO = new BookDAO();

        if (bookDAO.updateBook(book)) {
            response.sendRedirect(request.getContextPath() + "/admin/manageBooks.jsp");
        } else {
            request.setAttribute("error", "Failed to update book.");
            request.getRequestDispatcher("/admin/editBook.jsp").forward(request, response);
        }
    }
}
