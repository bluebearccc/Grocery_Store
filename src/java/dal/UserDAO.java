/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.User;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author admin
 */
public class UserDAO extends DBContext {

    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();

        return list;
    }

    public boolean validateUser(String username, String password) {
        String sql = "SELECT [user__id]\n"
                + "      ,[username]\n"
                + "      ,[fullname]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[address]\n"
                + "      ,[phone]\n"
                + "      ,[role]\n"
                + "      ,[balance]\n"
                + "  FROM [dbo].[Users]\n"
                + "  WHERE username = ? AND password = ?";
        connection = getConnection();
        try (PreparedStatement pre = connection.prepareStatement(sql);) {
            pre.setString(1, username);
            pre.setString(2, password);
            try (ResultSet re = pre.executeQuery()) {
                return re.next();
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        System.out.println(dao.validateUser("user01", "pass123"));
    }
}
