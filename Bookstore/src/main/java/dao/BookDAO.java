package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Book;
import util.DatabaseConnection;

public class BookDAO {

    public boolean addBook(Book book) {
        try (Connection con = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO books (title, author, price, stock) VALUES (?, ?, ?, ?)";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, book.getTitle());
                ps.setString(2, book.getAuthor());
                ps.setDouble(3, book.getPrice());
                ps.setInt(4, book.getStock());
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        try (Connection con = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM books";
            try (Statement stmt = con.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {
                while (rs.next()) {
                    Book book = new Book(
                            rs.getInt("book_id"),
                            rs.getString("title"),
                            rs.getString("author"),
                            rs.getDouble("price"),
                            rs.getInt("stock")
                    );
                    books.add(book);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    public boolean updateBook(Book book) {
        try (Connection con = DatabaseConnection.getConnection()) {
            String sql = "UPDATE books SET title=?, author=?, price=?, stock=? WHERE book_id=?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, book.getTitle());
                ps.setString(2, book.getAuthor());
                ps.setDouble(3, book.getPrice());
                ps.setInt(4, book.getStock());
                ps.setInt(5, book.getBookId());
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public Book getBookByID(int bookId) {
        Book book = null;
        String sql = "SELECT * FROM books WHERE book_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            // Set the book ID in the prepared statement
            ps.setInt(1, bookId);

            // Execute the query and process the result set
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    book = new Book(
                            rs.getInt("book_id"),
                            rs.getString("title"),
                            rs.getString("author"),
                            rs.getDouble("price"),
                            rs.getInt("stock")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    public boolean deleteBook(int bookId) {
        try (Connection con = DatabaseConnection.getConnection()) {
            String sql = "DELETE FROM books WHERE book_id=?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, bookId);
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public List<Book> searchBooks(String query) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books WHERE title LIKE ? OR author LIKE ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, "%" + query + "%");
            ps.setString(2, "%" + query + "%");

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Book book = new Book(
                            rs.getInt("book_id"),
                            rs.getString("title"),
                            rs.getString("author"),
                            rs.getDouble("price"),
                            rs.getInt("stock")
                    );
                    books.add(book);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }
    public boolean updateStock(int bookId, int newStock) {
        try (Connection con = DatabaseConnection.getConnection()) {
            String sql = "UPDATE books SET stock = ? WHERE book_id = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, newStock);
                ps.setInt(2, bookId);
                int rowsAffected = ps.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

