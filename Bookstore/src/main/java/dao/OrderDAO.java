package dao;

import util.DatabaseConnection;

import java.sql.*;
import java.sql.Connection;
import java.sql.SQLException;
public class OrderDAO {

    // Method to create an order in the database
    public boolean createOrder(int userId, int bookId, int quantity) {
        try (Connection con = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO orders (user_id, book_id, quantity, order_date) VALUES (?, ?, ?, NOW())";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, userId);
                ps.setInt(2, bookId);
                ps.setInt(3, quantity);
                int rowsAffected = ps.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
