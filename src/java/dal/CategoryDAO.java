/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Category;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FPT
 */
public class CategoryDAO extends DBContext {

    public int createCategory(Category category) {
        String sql = "INSERT INTO [dbo].[Categories] (category__name, description) VALUES (?, ?)";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, category.getCategory__name());
            ps.setString(2, category.getDescription());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at createCategory" + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println("Exception at createCategory" + e.getMessage());
            }
        }
        return -1;
    }

    public Category getCategoryById(int id) {
        String sql = "SELECT * FROM [dbo].[Categories] WHERE category__id = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Category(
                        rs.getInt("category__id"),
                        rs.getString("category__name"),
                        rs.getString("description")
                );
            }
        } catch (SQLException e) {
            System.out.println("Exception at getCategoryById" + e.getMessage());
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
                System.out.println("Exception at getCategoryById" + e.getMessage());
            }
        }
        return null;
    }

    public int updateCategory(Category category) {
        String sql = "UPDATE [dbo].[Categories] SET category__name = ?, description = ? WHERE category__id = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, category.getCategory__name());
            ps.setString(2, category.getDescription());
            ps.setInt(3, category.getCategory__id());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at updateCategory" + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println("Exception at updateCategory" + e.getMessage());
            }
        }
        return -1;
    }

    public int deleteCategory(int id) {
        String sql = "DELETE FROM [dbo].[Categories] WHERE category__id = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at deleteCategory" + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println("Exception at deleteCategory" + e.getMessage());
            }
        }
        return -1;
    }

    public List<Category> searchCategory(String name) {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Categories] WHERE category__name LIKE ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(
                        rs.getInt("category__id"),
                        rs.getString("category__name"),
                        rs.getString("description")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Exception at searchCategory" + e.getMessage());
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
                System.out.println("Exception at searchCategory" + e.getMessage());
            }
        }
        return list;
    }

    public List<Category> getAllCategories() {
        String sql = "SELECT [category__id]\n"
                + "      ,[category__name]\n"
                + "      ,[description]\n"
                + "  FROM [dbo].[Categories]";

        List<Category> list = new ArrayList<>();
        connection = getConnection();
        try {
            ps = connection.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("category__id");
                String categoryName = rs.getString("category__name");
                String des = rs.getString("description");
                list.add(new Category(id, categoryName, des));
            }
        } catch (Exception e) {
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
                System.out.println("Exception at searchCategory" + e.getMessage());
            }
        }
        return list;
    }
}
