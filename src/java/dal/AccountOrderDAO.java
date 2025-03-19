/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import constant.CommonConst;
import entity.AccountOrder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class AccountOrderDAO extends DBContext {

    public List<AccountOrder> getAllAccountOrder(int userId, int page) {
        List<AccountOrder> list = new ArrayList<>();
        String sql = "SELECT o.order__id, o.user__id, o.order__date, d.quantity, d.unit__price, p.product__name \n"
                + "FROM Orders o \n"
                + "INNER JOIN OrderDetails d ON o.order__id = d.order__id\n"
                + "INNER JOIN Products p ON p.product__id = d.product__id\n"
                + "WHERE o.user__id = ?\n"
                + " ORDER BY o.order__id\n"
                + " OFFSET ? ROWS \n"
                + " FETCH NEXT ? ROWS ONLY";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, (page - 1) * CommonConst.RECORD_PER_PAGE);
            ps.setInt(3, CommonConst.RECORD_PER_PAGE);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new AccountOrder(rs.getInt("order__id"), rs.getInt("user__id"), rs.getDate("order__date"), rs.getString("product__name"), rs.getInt("quantity"), rs.getDouble("unit__price")));
            }
        } catch (SQLException e) {
            System.out.println("Exception at getAllOrderDetails: " + e.getMessage());
        } finally {
            closeResources();
        }
        return list;
    }
    
    public List<AccountOrder> getAllAccountOrders() {
        List<AccountOrder> list = new ArrayList<>();
        String sql = "SELECT o.order__id, o.user__id, o.order__date, d.quantity, d.unit__price, p.product__name \n"
                + "FROM Orders o \n"
                + "INNER JOIN OrderDetails d ON o.order__id = d.order__id\n"
                + "INNER JOIN Products p ON p.product__id = d.product__id\n";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new AccountOrder(rs.getInt("order__id"), rs.getInt("user__id"), rs.getDate("order__date"), rs.getString("product__name"), rs.getInt("quantity"), rs.getDouble("unit__price")));
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
    

}
