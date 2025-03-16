/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.OrderDetail;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author FPT
 */
public class OrderDetailDAO extends DBContext {

    public int createOrderDetail(OrderDetail od) {
        String sql = "INSERT INTO [dbo].[OrderDetails] "
                + "([order__id], [product__id], [quantity], [unit__price]) "
                + "VALUES (?, ?, ?, ?)";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, od.getOrder__id());
            ps.setInt(2, od.getProduct__id());
            ps.setInt(3, od.getQuantity());
            ps.setDouble(4, od.getUnit__price());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at createOrderDetail: " + e.getMessage());
        } finally {
            closeResources();
        }
        return -1;
    }

    public OrderDetail getOrderDetail(int orderId, int productId) {
        String sql = "SELECT * FROM [dbo].[OrderDetails] "
                + "WHERE order__id = ? AND product__id = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ps.setInt(2, productId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new OrderDetail(
                        rs.getInt("order__id"),
                        rs.getInt("product__id"),
                        rs.getInt("quantity"),
                        rs.getDouble("unit__price")
                );
            }
        } catch (SQLException e) {
            System.out.println("Exception at getOrderDetail: " + e.getMessage());
        } finally {
            closeResources();
        }
        return null;
    }

    public int updateOrderDetail(OrderDetail od) {
        String sql = "UPDATE [dbo].[OrderDetails] SET "
                + "[quantity] = ?, [unit__price] = ? "
                + "WHERE [order__id] = ? AND [product__id] = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, od.getQuantity());
            ps.setDouble(2, od.getUnit__price());
            ps.setInt(3, od.getOrder__id());
            ps.setInt(4, od.getProduct__id());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at updateOrderDetail: " + e.getMessage());
        } finally {
            closeResources();
        }
        return -1;
    }

    public int deleteOrderDetail(int orderId, int productId) {
        String sql = "DELETE FROM [dbo].[OrderDetails] "
                + "WHERE order__id = ? AND product__id = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ps.setInt(2, productId);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at deleteOrderDetail: " + e.getMessage());
        } finally {
            closeResources();
        }
        return -1;
    }

    public List<OrderDetail> searchOrderDetailsByOrderId(int orderId) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[OrderDetails] WHERE order__id = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(
                        rs.getInt("order__id"),
                        rs.getInt("product__id"),
                        rs.getInt("quantity"),
                        rs.getDouble("unit__price")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Exception at searchOrderDetailsByOrderId: " + e.getMessage());
        } finally {
            closeResources();
        }
        return list;
    }

    public List<OrderDetail> getAllOrderDetails() {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[OrderDetails]";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(
                        rs.getInt("order__id"),
                        rs.getInt("product__id"),
                        rs.getInt("quantity"),
                        rs.getDouble("unit__price")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Exception at getAllOrderDetails: " + e.getMessage());
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

    public int totalMoney() {
        int total = 0;
        String sql = "SELECT SUM(quantity * unit__price) FROM OrderDetails";
        try {
            connection = getConnection(); // Ensure this method is properly implemented
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1); // Retrieve the sum value
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print exception for debugging
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
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return total;
    }
}
