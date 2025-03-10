package dal.admin;

import entity.Supplier;
import entity.User;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext {

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

    public void deleteUser(int id) {
        connection = getConnection();
        String sql = "DELETE FROM [dbo].[Users]\n"
                + "      WHERE user__id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setObject(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void insertUser(String username, String fullname, String password, String email, String address, String phone, int role, float balance) {
        try {
            connection = getConnection();

            String sql = "INSERT INTO [dbo].[Users] "
                    + "([username], [fullname], [password], [email], [address], [phone], [role], [balance]) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            ps = connection.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, fullname);
            ps.setString(3, password);
            ps.setString(4, email);
            ps.setString(5, address);
            ps.setString(6, phone);
            ps.setInt(7, role);
            ps.setFloat(8, balance);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
    }

    public List<Supplier> getAllSuppliers() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
