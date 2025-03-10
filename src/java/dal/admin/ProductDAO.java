package dal.admin;

import entity.Product;
import java.util.ArrayList;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductDAO extends DBContext {

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
        } catch (Exception e) {
        }
        return listProduct;
    }

    public List<Product> searchProductsByKeyword(String keyword) {
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
                + "  FROM [dbo].[Products]\n"
                + "  WHERE [product__name] LIKE ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setObject(1, "%" + keyword + "%");

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
        } catch (Exception e) {
        }
        return listProduct;
    }

    public boolean addNewProduct(String productName, int supplierId, int cateId,
            String quantityPerUnit, double unitPrice, int unitInStock,
            String imagePath,
            String description, Date releaseDate) {

        String sql = "INSERT INTO [dbo].[Products] "
                + "([product_name], [supplier_id], [category_id], [quantity_per_unit], "
                + "[unit_price], [unit_in_stock], [quantity_sold], [star_rating], "
                + "[image], [description], [release_date]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        System.out.println("Product Name: " + productName);
        System.out.println("Supplier ID: " + supplierId);
        System.out.println("Category ID: " + cateId);
        System.out.println("Quantity Per Unit: " + quantityPerUnit);
        System.out.println("Unit Price: " + unitPrice);
        System.out.println("Quantity: " + unitInStock);
        System.out.println("Image Path: " + imagePath);
        System.out.println("Description: " + description);
        System.out.println("Release Date: " + releaseDate);
        
        try {
            connection = getConnection();

            ps = connection.prepareStatement(sql);
            ps.setString(1, productName);
            ps.setInt(2, supplierId);
            ps.setInt(3, cateId);
            ps.setString(4, quantityPerUnit);
            ps.setDouble(5, unitPrice);
            ps.setInt(6, unitInStock);
            ps.setInt(7, 0);
            ps.setInt(8, 5);
            ps.setString(9, imagePath); // Lưu đường dẫn ảnh
            ps.setString(10, description);
            ps.setDate(11, new java.sql.Date(releaseDate.getTime()));

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            return false;
        }
        

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
            e.printStackTrace();
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
        } catch (Exception e) {
            System.out.println(e);
        }
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
        } catch (Exception e) {
        }
        return null;
    }

}
