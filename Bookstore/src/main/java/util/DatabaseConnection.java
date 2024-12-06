package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/book_store", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            throw new SQLException("Database connection failed.", e);
        }
    }
}
