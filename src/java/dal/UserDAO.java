/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.User;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class UserDAO extends DBContext {

    public void deleteUser(int id) {
        connection = getConnection();
        String sql = "DELETE FROM [dbo].[Users]\n"
                + "      WHERE user__id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setObject(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println("Exception at UpdateUser" + e.getMessage());
            }
        }

    }

    public int UpdateUser(User u) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [username] = ?\n"
                + "      ,[fullname] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[role] = ?\n"
                + "      ,[balance] = ?\n"
                + " WHERE  user__id = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getFullname());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getAddress());
            ps.setString(6, u.getPhone());
            ps.setBoolean(7, u.isRole());
            ps.setFloat(8, u.getBalance());
            ps.setInt(9, u.getUser__id());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at UpdateUser" + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println("Exception at UpdateUser" + e.getMessage());
            }
        }
        return -1;
    }

    public User CreateUser(User u) {
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "           ([username]\n"
                + "           ,[fullname]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[address]\n"
                + "           ,[phone]\n"
                + "           ,[role]\n"
                + "           ,[balance])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getFullname());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getAddress());
            ps.setString(6, u.getPhone());
            ps.setBoolean(7, u.isRole());
            ps.setFloat(8, u.getBalance());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at CreateUser" + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println("Exception at CreateUser" + e.getMessage());
            }
        }
        return getUser(u.getUsername(), u.getPassword());
    }

    public List<User> searchUsers(String keyword) {
        List<User> list = new ArrayList<>();
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
                + "  WHERE\n"
                + "	[fullname] LIKE ?";
        connection = getConnection();
        try {
            ps = connection.prepareStatement(sql);
            ps.setObject(1, "%" + keyword + "%");

            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("user__id");
                String username = rs.getString("username");
                String fullname = rs.getString("fullname");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                boolean role = rs.getBoolean("role");
                float balance = rs.getFloat("balance");
                list.add(new User(id, username, fullname, password, email, address, phone, role, balance));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public User getUser(String username, String password) {
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
                if (re.next()) {
                    return new User(re.getInt("user__id"), re.getString("username"), re.getString("fullname"), re.getString("password"), re.getString("email"),
                            re.getString("address"), re.getString("phone"), re.getBoolean("role"), re.getFloat("balance"));
                }
            }
        } catch (Exception e) {
            System.out.println("Exception at getUser" + e.getMessage());
        }
        return null;
    }

    public List<User> getAllUsers() {
        connection = getConnection();
        List<User> listUsers = new ArrayList<>();
        String sql = "SELECT [user__id]\n"
                + "      ,[username]\n"
                + "      ,[fullname]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[address]\n"
                + "      ,[phone]\n"
                + "      ,[role]\n"
                + "      ,[balance]\n"
                + "  FROM [dbo].[Users]";

        try {
            ps = connection.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("user__id");
                String username = rs.getString("username");
                String fullname = rs.getString("fullname");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                boolean role = rs.getBoolean("role");
                float balance = rs.getFloat("balance");
                listUsers.add(new User(id, username, fullname, password, email, address, phone, role, balance));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listUsers;
    }
}
