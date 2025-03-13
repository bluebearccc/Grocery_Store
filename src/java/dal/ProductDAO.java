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

    public int createProduct(String productName, int supplierId, int categoryId, String quantityPerUnit,
            float unitPrice, int unitInStock, int quantitySold, int starRating,
            String image, String description, Date releaseDate) {

        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([product__name]\n"
                + "           ,[supplier__id]\n"
                + "           ,[category__id]\n"
                + "           ,[quantity__per__unit]\n"
                + "           ,[unit__price]\n"
                + "           ,[unit__in__stock]\n"
                + "           ,[quantity__sold]\n"
                + "           ,[star__rating]\n"
                + "           ,[image]\n"
                + "           ,[describe]\n"
                + "           ,[release__date])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
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
            ps.setString(1, productName);
            ps.setInt(2, supplierId);
            ps.setInt(3, categoryId);
            ps.setString(4, quantityPerUnit);
            ps.setFloat(5, unitPrice);
            ps.setInt(6, unitInStock);
            ps.setInt(7, quantitySold);
            ps.setInt(8, starRating);
            ps.setString(9, image);
            ps.setString(10, description);
            ps.setDate(11, releaseDate);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Lỗi tại createProduct: " + e.getMessage());
            e.printStackTrace();
            return -1;
        } finally {
            closeResources();
        }
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
            String image;
            if (rs.next()) {
                image = rs.getString("image");
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
                        image,
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

    public List<Product> getProductByNamePagination(String name, int page) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Products]"
                + " WHERE product__name LIKE ?"
                + " ORDER BY [product__id]\n"
                + " OFFSET ? ROWS \n"
                + " FETCH NEXT ? ROWS ONLY";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
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
            System.out.println("Exception at searchProductByPagination: " + e.getMessage());
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

    public List<Product> getProductPaginationByCateName(int cateId, int page, String name) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Products] WHERE category__id = ?"
                + "     AND [product__name] LIKE ?"
                + "	ORDER BY product__id \n"
                + "	OFFSET ? ROWS \n"
                + "	FETCH NEXT ? ROWS ONLY";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, cateId);
            ps.setString(2, "%" + name + "%");
            ps.setInt(3, (page - 1) * CommonConst.RECORD_PER_PAGE);
            ps.setInt(4, CommonConst.RECORD_PER_PAGE);
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
            System.out.println("Exception at getProductPaginationByCateName: " + e.getMessage());
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

    public int findTotalRecordByCategory(int cateId, int min, int max, String name) {
        int total = 0;
        String sql = "SELECT count(*) \n"
                + "	FROM Products\n"
                + "	WHERE category__id=? AND"
                + "     [unit__price] BETWEEN ? AND ?"
                + "     AND [product__name] LIKE ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, cateId);
            ps.setInt(2, min);
            ps.setInt(3, max);
            ps.setString(4, "%" + name + "%");
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

    public int findTotalRecordPagnition(int min, int max, String name) {
        int total = 0;
        String sql = "SELECT count(*) \n"
                + "	FROM Products\n"
                + "     WHERE [unit__price] BETWEEN ? AND ?"
                + "     AND [product__name] LIKE ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, min);
            ps.setInt(2, max);
            ps.setString(3, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Exception at findTotalRecordPagnition: " + e.getMessage());
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

    public void editProduct(int productId, String newProductName, int newSupplierId, int newCateId,
            String newQuantityPerUnit, double newUnitPrice,
            String newDescription) {

        String sql = "UPDATE [dbo].[Products]\n"
                + "SET [product__name] = ?, [supplier__id] = ?, [category__id] = ?, \n"
                + "    [quantity__per__unit] = ?, [unit__price] = ?, [describe] = ?\n"
                + "WHERE [product__id] = ?";

        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);

            ps.setString(1, newProductName);
            ps.setInt(2, newSupplierId);
            ps.setInt(3, newCateId);
            ps.setString(4, newQuantityPerUnit);
            ps.setDouble(5, newUnitPrice);
            ps.setString(6, newDescription);
            ps.setInt(7, productId);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Product with ID " + productId + " was updated successfully.");
            } else {
                System.out.println("No product found with ID " + productId);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        closeResources();
    }

    public void deleteProductById(int productId) {

        String sql = "DELETE FROM [dbo].[Products] WHERE [product__id] = ?";

        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);

            int rowsDeleted = ps.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("Product with ID " + productId + " was deleted successfully.");
            } else {
                System.out.println("No product found with ID " + productId);
            }
        } catch (SQLException e) {
        }
        closeResources();
    }

    public Product searchProductById(int idFind) {
        connection = getConnection();
        String sql = "SELECT [product__id]\n"
                + "      ,[product__name]\n"
                + "      ,[supplier__id]\n"
                + "      ,[category__id]\n"
                + "      ,[quantity__per__unit]\n"
                + "      ,[unit__price]\n"
                + "      ,[unit__in__stock]\n"
                + "      ,[quantity__sold]\n"
                + "      ,[star__rating]\n"
                + "      ,[image]\n"
                + "      ,[describe]\n"
                + "      ,[release__date]\n"
                + "  FROM [dbo].[Products]"
                + "  WHERE [product__id] = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setObject(1, idFind);
            rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("product__id");
                String productName = rs.getString("product__name");
                int supID = rs.getInt("supplier__id");
                int cateID = rs.getInt("category__id");
                String quantityPerUnit = rs.getString("quantity__per__unit");
                double unitPrice = rs.getDouble("unit__price");
                int unitInStock = rs.getInt("unit__in__stock");
                int quantitySold = rs.getInt("quantity__sold");
                int starRating = rs.getInt("star__rating");
                String image = rs.getString("image");
                String describe = rs.getString("describe");
                Date releaseDate = rs.getDate("release__date");

                return new Product(id, productName, supID, cateID, quantityPerUnit, (float) unitPrice, unitInStock, quantitySold, starRating, image, describe, releaseDate);

            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Product> getAllProducts() {
        List<Product> listProduct = new ArrayList<>();
        connection = getConnection();

        String sql = "SELECT [product__id]\n"
                + "      ,[product__name]\n"
                + "      ,[supplier__id]\n"
                + "      ,[category__id]\n"
                + "      ,[quantity__per__unit]\n"
                + "      ,[unit__price]\n"
                + "      ,[unit__in__stock]\n"
                + "      ,[quantity__sold]\n"
                + "      ,[star__rating]\n"
                + "      ,[image]\n"
                + "      ,[describe]\n"
                + "      ,[release__date]\n"
                + "  FROM [dbo].[Products]";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("product__id");
                String productName = rs.getString("product__name");
                int supID = rs.getInt("supplier__id");
                int cateID = rs.getInt("category__id");
                String quantityPerUnit = rs.getString("quantity__per__unit");
                double unitPrice = rs.getDouble("unit__price");
                int unitInStock = rs.getInt("unit__in__stock");
                int quantitySold = rs.getInt("quantity__sold");
                int starRating = rs.getInt("star__rating");
                String image = rs.getString("image");
                String describe = rs.getString("describe");
                Date releaseDate = rs.getDate("release__date");

                Product product = new Product(id, productName, supID, cateID, quantityPerUnit, (float) unitPrice, unitInStock, quantitySold, starRating, image, describe, releaseDate);
                listProduct.add(product);
            }
        } catch (SQLException e) {
        }
        return listProduct;
    }

    public int totalProduct() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Products";

        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return count;
    }

    public int totalQuantitySold() {
        int sum = 0;
        String sql = "SELECT sum(quantity__sold) FROM Products";

        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                sum = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return sum;
    }

    public List<Product> getProductsInRangePagination(int min, int max, int page) {
        if (max < min) {
            int temp = min;
            min = max;
            max = temp;
        }
        List<Product> listProduct = new ArrayList<>();
        connection = getConnection();

        String sql = "SELECT [product__id]\n"
                + "      ,[product__name]\n"
                + "      ,[supplier__id]\n"
                + "      ,[category__id]\n"
                + "      ,[quantity__per__unit]\n"
                + "      ,[unit__price]\n"
                + "      ,[unit__in__stock]\n"
                + "      ,[quantity__sold]\n"
                + "      ,[star__rating]\n"
                + "      ,[image]\n"
                + "      ,[describe]\n"
                + "      ,[release__date]\n"
                + "  FROM [dbo].[Products]"
                + "  WHERE [unit__price] BETWEEN ? AND ?"
                + "  ORDER BY [product__id]"
                + "	OFFSET ? ROWS \n"
                + "	FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, min);
            ps.setInt(2, max);
            ps.setInt(3, (page - 1) * CommonConst.RECORD_PER_PAGE);
            ps.setInt(4, CommonConst.RECORD_PER_PAGE);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("product__id");
                String productName = rs.getString("product__name");
                int supID = rs.getInt("supplier__id");
                int cateID = rs.getInt("category__id");
                String quantityPerUnit = rs.getString("quantity__per__unit");
                double unitPrice = rs.getDouble("unit__price");
                int unitInStock = rs.getInt("unit__in__stock");
                int quantitySold = rs.getInt("quantity__sold");
                int starRating = rs.getInt("star__rating");
                String image = rs.getString("image");
                String describe = rs.getString("describe");
                Date releaseDate = rs.getDate("release__date");

                Product product = new Product(id, productName, supID, cateID, quantityPerUnit, (float) unitPrice, unitInStock, quantitySold, starRating, image, describe, releaseDate);
                listProduct.add(product);
            }
        } catch (SQLException e) {
        }
        return listProduct;
    }

    public List<Product> getProductsInRangeNamePagination(int min, int max, int page, String name) {
        if (max < min) {
            int temp = min;
            min = max;
            max = temp;
        }
        List<Product> listProduct = new ArrayList<>();
        connection = getConnection();

        String sql = "SELECT [product__id]\n"
                + "      ,[product__name]\n"
                + "      ,[supplier__id]\n"
                + "      ,[category__id]\n"
                + "      ,[quantity__per__unit]\n"
                + "      ,[unit__price]\n"
                + "      ,[unit__in__stock]\n"
                + "      ,[quantity__sold]\n"
                + "      ,[star__rating]\n"
                + "      ,[image]\n"
                + "      ,[describe]\n"
                + "      ,[release__date]\n"
                + "  FROM [dbo].[Products]"
                + "  WHERE [product__name] LIKE ?"
                + " AND [unit__price] BETWEEN ? AND ?"
                + "  ORDER BY [product__id]"
                + "	OFFSET ? ROWS \n"
                + "	FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ps.setInt(2, min);
            ps.setInt(3, max);
            ps.setInt(4, (page - 1) * CommonConst.RECORD_PER_PAGE);
            ps.setInt(5, CommonConst.RECORD_PER_PAGE);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("product__id");
                String productName = rs.getString("product__name");
                int supID = rs.getInt("supplier__id");
                int cateID = rs.getInt("category__id");
                String quantityPerUnit = rs.getString("quantity__per__unit");
                double unitPrice = rs.getDouble("unit__price");
                int unitInStock = rs.getInt("unit__in__stock");
                int quantitySold = rs.getInt("quantity__sold");
                int starRating = rs.getInt("star__rating");
                String image = rs.getString("image");
                String describe = rs.getString("describe");
                Date releaseDate = rs.getDate("release__date");

                Product product = new Product(id, productName, supID, cateID, quantityPerUnit, (float) unitPrice, unitInStock, quantitySold, starRating, image, describe, releaseDate);
                listProduct.add(product);
            }
        } catch (SQLException e) {
        }
        return listProduct;
    }

    public List<Product> getProductsInRangePaginationCate(int min, int max, int page, int categoryId) {
        if (max < min) {
            int temp = min;
            min = max;
            max = temp;
        }
        List<Product> listProduct = new ArrayList<>();
        connection = getConnection();

        String sql = "SELECT [product__id]\n"
                + "      ,[product__name]\n"
                + "      ,[supplier__id]\n"
                + "      ,[category__id]\n"
                + "      ,[quantity__per__unit]\n"
                + "      ,[unit__price]\n"
                + "      ,[unit__in__stock]\n"
                + "      ,[quantity__sold]\n"
                + "      ,[star__rating]\n"
                + "      ,[image]\n"
                + "      ,[describe]\n"
                + "      ,[release__date]\n"
                + "  FROM [dbo].[Products]"
                + "  WHERE [category__id] = ? AND [unit__price] BETWEEN ? AND ?"
                + "  ORDER BY [product__id]"
                + "	OFFSET ? ROWS \n"
                + "	FETCH NEXT ? ROWS ONLY";
        System.out.println(sql);
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ps.setInt(2, min);
            ps.setInt(3, max);
            ps.setInt(4, (page - 1) * CommonConst.RECORD_PER_PAGE);
            ps.setInt(5, CommonConst.RECORD_PER_PAGE);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("product__id");
                String productName = rs.getString("product__name");
                int supID = rs.getInt("supplier__id");
                int cateID = rs.getInt("category__id");
                String quantityPerUnit = rs.getString("quantity__per__unit");
                double unitPrice = rs.getDouble("unit__price");
                int unitInStock = rs.getInt("unit__in__stock");
                int quantitySold = rs.getInt("quantity__sold");
                int starRating = rs.getInt("star__rating");
                String image = rs.getString("image");
                String describe = rs.getString("describe");
                Date releaseDate = rs.getDate("release__date");

                Product product = new Product(id, productName, supID, cateID, quantityPerUnit, (float) unitPrice, unitInStock, quantitySold, starRating, image, describe, releaseDate);
                listProduct.add(product);
            }
        } catch (SQLException e) {
        }
        return listProduct;
    }

    public List<Product> getProductsInRangePaginationCateName(int min, int max, int page, int categoryId, String name) {
        if (max < min) {
            int temp = min;
            min = max;
            max = temp;
        }
        List<Product> listProduct = new ArrayList<>();
        connection = getConnection();

        String sql = "SELECT [product__id]\n"
                + "      ,[product__name]\n"
                + "      ,[supplier__id]\n"
                + "      ,[category__id]\n"
                + "      ,[quantity__per__unit]\n"
                + "      ,[unit__price]\n"
                + "      ,[unit__in__stock]\n"
                + "      ,[quantity__sold]\n"
                + "      ,[star__rating]\n"
                + "      ,[image]\n"
                + "      ,[describe]\n"
                + "      ,[release__date]\n"
                + "  FROM [dbo].[Products]"
                + "  WHERE [category__id] = ? AND [unit__price] BETWEEN ? AND ?"
                + "  AND [product__name] LIKE ?"
                + "  ORDER BY [product__id]"
                + "	OFFSET ? ROWS \n"
                + "	FETCH NEXT ? ROWS ONLY";
        System.out.println(sql);
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ps.setInt(2, min);
            ps.setInt(3, max);
            ps.setString(4, "%" + name + "%");
            ps.setInt(5, (page - 1) * CommonConst.RECORD_PER_PAGE);
            ps.setInt(6, CommonConst.RECORD_PER_PAGE);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("product__id");
                String productName = rs.getString("product__name");
                int supID = rs.getInt("supplier__id");
                int cateID = rs.getInt("category__id");
                String quantityPerUnit = rs.getString("quantity__per__unit");
                double unitPrice = rs.getDouble("unit__price");
                int unitInStock = rs.getInt("unit__in__stock");
                int quantitySold = rs.getInt("quantity__sold");
                int starRating = rs.getInt("star__rating");
                String image = rs.getString("image");
                String describe = rs.getString("describe");
                Date releaseDate = rs.getDate("release__date");

                Product product = new Product(id, productName, supID, cateID, quantityPerUnit, (float) unitPrice, unitInStock, quantitySold, starRating, image, describe, releaseDate);
                listProduct.add(product);
            }
        } catch (SQLException e) {
        }
        return listProduct;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
//        for (Product product : dao.getProductPaginationByCateName(2, 1, "a")) {
//            System.out.println(product);
//        }
        System.out.println(dao.findTotalRecordPagnition(0, 200, ""));
    }
}
