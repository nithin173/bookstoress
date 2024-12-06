package dao;

import java.sql.*;
import model.User;
import util.DatabaseConnection;

public class UserDAO {
    public User authenticate(String username, String password) {
        try (Connection con = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, username);
                ps.setString(2, password);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        return new User(
                                rs.getInt("user_id"),
                                rs.getString("username"),
                                rs.getString("role")
                        );
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
