package user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import dao.BookDAO;
import dao.OrderDAO;
import model.Book;
import model.User;

public class PurchaseBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the book ID and quantity from the form
        String bookId = request.getParameter("bookId");
        String quantityStr = request.getParameter("quantity");

        // Get the logged-in user from the session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            // If the user is not logged in, redirect to the login page
            response.sendRedirect(request.getContextPath() + "/user/login.jsp");
            return;
        }

        // Validate the input
        if (bookId == null || quantityStr == null || quantityStr.isEmpty()) {
            request.setAttribute("error", "Please select a valid book and quantity.");
            request.getRequestDispatcher("/user/browseBooks.jsp").forward(request, response);
            return;
        }

        int bookIdInt = Integer.parseInt(bookId);
        int quantity = Integer.parseInt(quantityStr);

        // Get the book details
        BookDAO bookDAO = new BookDAO();
        Book book = bookDAO.getBookByID(bookIdInt);

        if (book == null) {
            request.setAttribute("error", "Book not found.");
            request.getRequestDispatcher("/user/browseBooks.jsp").forward(request, response);
            return;
        }

        // Check if the book is available in the desired quantity
        if (book.getStock() < quantity) {
            request.setAttribute("error", "Not enough stock available.");
            request.getRequestDispatcher("/user/browseBooks.jsp").forward(request, response);
            return;
        }

        // Process the purchase (you can add more logic like storing an order in the database)
        OrderDAO orderDAO = new OrderDAO();
        boolean success = orderDAO.createOrder(user.getUserId(), bookIdInt, quantity);

        if (success) {
            // Reduce the stock from the database
            bookDAO.updateStock(bookIdInt, book.getStock() - quantity);

            // Provide feedback to the user
            request.setAttribute("success", "Purchase successful! Your order will be processed.");
            request.getRequestDispatcher("/user/browseBooks.jsp").forward(request, response);
        } else {
            // If the purchase failed, show an error
            request.setAttribute("error", "There was an issue processing your purchase.");
            request.getRequestDispatcher("/user/browseBooks.jsp").forward(request, response);
        }
    }
}
