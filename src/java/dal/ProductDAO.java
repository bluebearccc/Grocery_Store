/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import constant.CommonConst;
import entity.Product;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author FPT
 */
public class ProductDAO extends DBContext {

    public int createProduct(Product p) {
        String sql = "INSERT INTO [dbo].[Products] "
                + "([product__name], [supplier__id], [category__id], [quantity__per__unit], "
                + "[unit__price], [unit__in__stock], [quantity__sold], [star__rating], "
                + "[image], [describe], [release__date]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, p.getProduct__name());
            ps.setInt(2, p.getSupplier__id());
            ps.setInt(3, p.getCategory__id());
            ps.setString(4, p.getQuantity__per__unit());
            ps.setFloat(5, p.getUnit__price());
            ps.setInt(6, p.getUnit__in__stock());
            ps.setInt(7, p.getQuantity__sold());
            ps.setInt(8, p.getStar__rating());
            ps.setString(9, p.getImage());
            ps.setString(10, p.getDescribe());
            ps.setDate(11, new java.sql.Date(p.getRelease__date().getTime()));

            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at createProduct: " + e.getMessage());
        } finally {
            closeResources();
        }
        return -1;
    }

    public int updateProduct(Product p) {
        String sql = "UPDATE [dbo].[Products] SET "
                + "[product__name] = ?, [supplier__id] = ?, [category__id] = ?, "
                + "[quantity__per__unit] = ?, [unit__price] = ?, [unit__in__stock] = ?, "
                + "[quantity__sold] = ?, [star__rating] = ?, [image] = ?, "
                + "[describe] = ?, [release__date] = ? WHERE [product__id] = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, p.getProduct__name());
            ps.setInt(2, p.getSupplier__id());
            ps.setInt(3, p.getCategory__id());
            ps.setString(4, p.getQuantity__per__unit());
            ps.setFloat(5, p.getUnit__price());
            ps.setInt(6, p.getUnit__in__stock());
            ps.setInt(7, p.getQuantity__sold());
            ps.setInt(8, p.getStar__rating());
            ps.setString(9, p.getImage());
            ps.setString(10, p.getDescribe());
            ps.setDate(11, new java.sql.Date(p.getRelease__date().getTime()));
            ps.setInt(12, p.getProduct__id());

            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at updateProduct: " + e.getMessage());
        } finally {
            closeResources();
        }
        return -1;
    }

    public int deleteProduct(int productId) {
        String sql = "DELETE FROM [dbo].[Products] WHERE product__id = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception at deleteProduct: " + e.getMessage());
        } finally {
            closeResources();
        }
        return -1;
    }

    public Product getProduct(int productId) {
        String sql = "SELECT * FROM [dbo].[Products] WHERE product__id = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(
                        rs.getInt("product__id"),
                        rs.getString("product__name"),
                        rs.getInt("supplier__id"),
                        rs.getInt("category__id"),
                        rs.getString("quantity__per__unit"),
                        rs.getFloat("unit__price"),
                        rs.getInt("unit__in__stock"),
                        rs.getInt("quantity__sold"),
                        rs.getInt("star__rating"),
                        rs.getString("image"),
                        rs.getString("describe"),
                        rs.getDate("release__date")
                );
            }
        } catch (SQLException e) {
            System.out.println("Exception at getProduct: " + e.getMessage());
        } finally {
            closeResources();
        }
        return null;
    }

    public List<Product> searchProduct(String name) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Products] WHERE product__name LIKE ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("product__id"),
                        rs.getString("product__name"),
                        rs.getInt("supplier__id"),
                        rs.getInt("category__id"),
                        rs.getString("quantity__per__unit"),
                        rs.getFloat("unit__price"),
                        rs.getInt("unit__in__stock"),
                        rs.getInt("quantity__sold"),
                        rs.getInt("star__rating"),
                        rs.getString("image"),
                        rs.getString("describe"),
                        rs.getDate("release__date")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Exception at searchProduct: " + e.getMessage());
        } finally {
            closeResources();
        }
        return list;
    }

    public List<Product> searchProductByCate(int cateId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Products] WHERE category__id = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, cateId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("product__id"),
                        rs.getString("product__name"),
                        rs.getInt("supplier__id"),
                        rs.getInt("category__id"),
                        rs.getString("quantity__per__unit"),
                        rs.getFloat("unit__price"),
                        rs.getInt("unit__in__stock"),
                        rs.getInt("quantity__sold"),
                        rs.getInt("star__rating"),
                        rs.getString("image"),
                        rs.getString("describe"),
                        rs.getDate("release__date")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Exception at searchProductByCate: " + e.getMessage());
        } finally {
            closeResources();
        }
        return list;
    }

    public List<Product> searchProductSameCate(Product p) {
        List<Product> list = new ArrayList<>();
        String sql = "select top 3 * from Products where category__id = ? and product__id != ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, p.getCategory__id());
            ps.setInt(2, p.getProduct__id());
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("product__id"),
                        rs.getString("product__name"),
                        rs.getInt("supplier__id"),
                        rs.getInt("category__id"),
                        rs.getString("quantity__per__unit"),
                        rs.getFloat("unit__price"),
                        rs.getInt("unit__in__stock"),
                        rs.getInt("quantity__sold"),
                        rs.getInt("star__rating"),
                        rs.getString("image"),
                        rs.getString("describe"),
                        rs.getDate("release__date")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Exception at searchProductSameCate: " + e.getMessage());
        } finally {
            closeResources();
        }
        return list;
    }

    public List<Product> getThreeLastestProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT top 3 *\n"
                + "FROM Products\n"
                + "ORDER BY product__id DESC";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("product__id"),
                        rs.getString("product__name"),
                        rs.getInt("supplier__id"),
                        rs.getInt("category__id"),
                        rs.getString("quantity__per__unit"),
                        rs.getFloat("unit__price"),
                        rs.getInt("unit__in__stock"),
                        rs.getInt("quantity__sold"),
                        rs.getInt("star__rating"),
                        rs.getString("image"),
                        rs.getString("describe"),
                        rs.getDate("release__date")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Exception at getThreeProduct: " + e.getMessage());
        } finally {
            closeResources();
        }
        return list;
    }

    public List<Product> getProductPaginationByCate(int cateId, int page) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Products] WHERE category__id = ?"
                + "	ORDER BY product__id \n"
                + "	OFFSET ? ROWS \n"
                + "	FETCH NEXT ? ROWS ONLY";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, cateId);
            ps.setInt(2, (page - 1) * CommonConst.RECORD_PER_PAGE);
            ps.setInt(3, CommonConst.RECORD_PER_PAGE);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("product__id"),
                        rs.getString("product__name"),
                        rs.getInt("supplier__id"),
                        rs.getInt("category__id"),
                        rs.getString("quantity__per__unit"),
                        rs.getFloat("unit__price"),
                        rs.getInt("unit__in__stock"),
                        rs.getInt("quantity__sold"),
                        rs.getInt("star__rating"),
                        rs.getString("image"),
                        rs.getString("describe"),
                        rs.getDate("release__date")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Exception at searchProduct: " + e.getMessage());
        } finally {
            closeResources();
        }
        return list;
    }

    public List<Product> getProductPagination(int page) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Products]"
                + "	ORDER BY product__id \n"
                + "	OFFSET ? ROWS \n"
                + "	FETCH NEXT ? ROWS ONLY";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, (page - 1) * CommonConst.RECORD_PER_PAGE);
            ps.setInt(2, CommonConst.RECORD_PER_PAGE);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("product__id"),
                        rs.getString("product__name"),
                        rs.getInt("supplier__id"),
                        rs.getInt("category__id"),
                        rs.getString("quantity__per__unit"),
                        rs.getFloat("unit__price"),
                        rs.getInt("unit__in__stock"),
                        rs.getInt("quantity__sold"),
                        rs.getInt("star__rating"),
                        rs.getString("image"),
                        rs.getString("describe"),
                        rs.getDate("release__date")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Exception at searchProduct: " + e.getMessage());
        } finally {
            closeResources();
        }
        return list;
    }

    public int findTotalRecordByCategory(int cateId) {
        int total = 0;
        String sql = "SELECT count(*) \n"
                + "	FROM Products\n"
                + "	WHERE category__id=?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, cateId);
            rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Exception at findTotalRecordByCategory: " + e.getMessage());
        } finally {
            closeResources();
        }
        return total;
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
        ProductDAO dao = new ProductDAO();
        for (Product product : dao.getProductPagination(1)) {
            System.out.println(product);
        }
    }

}
