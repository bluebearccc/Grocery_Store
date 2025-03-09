/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Order;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author FPT
 */
public class OrderDAO extends DBContext {

    public int createOrder(Order o) {
        String sql = "INSERT INTO [dbo].[Orders] "
                + "([user__id], [order__date]) "
                + "VALUES (?, ?)";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, o.getUser__id());
            ps.setDate(2, new java.sql.Date(o.getOrder__date().getTime()));
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at createOrder: " + e.getMessage());
        } finally {
            closeResources();
        }
        return -1;
    }

    public Order getOrder(int orderId) {
        String sql = "SELECT * FROM [dbo].[Orders] WHERE order__id = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Order(
                        rs.getInt("order__id"),
                        rs.getInt("user__id"),
                        rs.getDate("order__date")
                );
            }
        } catch (SQLException e) {
            System.out.println("Exception at getOrder: " + e.getMessage());
        } finally {
            closeResources();
        }
        return null;
    }

    public int updateOrder(Order o) {
        String sql = "UPDATE [dbo].[Orders] SET "
                + "[user__id] = ?, [order__date] = ? "
                + "WHERE [order__id] = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, o.getUser__id());
            ps.setDate(2, new java.sql.Date(o.getOrder__date().getTime()));
            ps.setInt(3, o.getOrder__id());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at updateOrder: " + e.getMessage());
        } finally {
            closeResources();
        }
        return -1;
    }

    public int deleteOrder(int orderId) {
        String sql = "DELETE FROM [dbo].[Orders] WHERE order__id = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at deleteOrder: " + e.getMessage());
        } finally {
            closeResources();
        }
        return -1;
    }

    public List<Order> searchOrderByUserId(int userId) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Orders] WHERE user__id = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(
                        rs.getInt("order__id"),
                        rs.getInt("user__id"),
                        rs.getDate("order__date")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Exception at searchOrderByUserId: " + e.getMessage());
        } finally {
            closeResources();
        }
        return list;
    }

    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Orders]";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(
                        rs.getInt("order__id"),
                        rs.getInt("user__id"),
                        rs.getDate("order__date")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Exception at getAllOrders: " + e.getMessage());
        } finally {
            closeResources();
        }
        return list;
    }

    private void closeResources() {
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
            System.out.println("Exception at closeResources: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        for (Order allOrder : dao.getAllOrders()) {
            System.out.println(allOrder);
        }
    }
}
