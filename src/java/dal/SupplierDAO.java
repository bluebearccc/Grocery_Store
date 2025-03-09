/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Supplier;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author FPT
 */
public class SupplierDAO extends DBContext {

    public int createSupplier(Supplier supplier) {
        String sql = "INSERT INTO [dbo].[Supplier] "
                + "([company__name], [contact__name], [phone]) "
                + "VALUES (?, ?, ?)";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, supplier.getCompany__name());
            ps.setString(2, supplier.getContact__name());
            ps.setString(3, supplier.getPhone());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at createSupplier: " + e.getMessage());
        } finally {
            closeResources();
        }
        return -1;
    }

    public Supplier getSupplier(int supplierId) {
        String sql = "SELECT * FROM [dbo].[Supplier] WHERE supplier__id = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, supplierId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Supplier(
                        rs.getInt("supplier__id"),
                        rs.getString("company__name"),
                        rs.getString("contact__name"),
                        rs.getString("phone")
                );
            }
        } catch (SQLException e) {
            System.out.println("Exception at getSupplier: " + e.getMessage());
        } finally {
            closeResources();
        }
        return null;
    }

    public int updateSupplier(Supplier supplier) {
        String sql = "UPDATE [dbo].[Supplier] SET "
                + "[company__name] = ?, [contact__name] = ?, [phone] = ? "
                + "WHERE [supplier__id] = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, supplier.getCompany__name());
            ps.setString(2, supplier.getContact__name());
            ps.setString(3, supplier.getPhone());
            ps.setInt(4, supplier.getSupplier__id());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at updateSupplier: " + e.getMessage());
        } finally {
            closeResources();
        }
        return -1;
    }

    public int deleteSupplier(int supplierId) {
        String sql = "DELETE FROM [dbo].[Supplier] WHERE supplier__id = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, supplierId);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at deleteSupplier: " + e.getMessage());
        } finally {
            closeResources();
        }
        return -1;
    }

    public List<Supplier> searchSuppliersByName(String name) {
        List<Supplier> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Supplier] WHERE company__name LIKE ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Supplier(
                        rs.getInt("supplier__id"),
                        rs.getString("company__name"),
                        rs.getString("contact__name"),
                        rs.getString("phone")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Exception at searchSuppliersByName: " + e.getMessage());
        } finally {
            closeResources();
        }
        return list;
    }

    public List<Supplier> getAllSuppliers() {
        List<Supplier> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Supplier]";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Supplier(
                        rs.getInt("supplier__id"),
                        rs.getString("company__name"),
                        rs.getString("contact__name"),
                        rs.getString("phone")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Exception at getAllSuppliers: " + e.getMessage());
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
