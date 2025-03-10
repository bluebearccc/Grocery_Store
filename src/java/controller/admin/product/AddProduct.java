package controller.admin.product;

import dal.admin.CategoryDAO;
import dal.admin.ProductDAO;
import dal.admin.SupplierDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Date;

/**
 * Servlet for adding a new product
 */
@MultipartConfig(maxFileSize = 1024 * 1024 * 5) // 5MB limit
public class AddProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("listSup", new SupplierDAO().getAllSuppliers());
        request.setAttribute("listCate", new CategoryDAO().getAllCategories());
        request.getRequestDispatcher("dashboard/addProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String productName = request.getParameter("productName");
            int cateId = parseInteger(request, "categoryId", 0);
            int supplierId = parseInteger(request, "supplierId", 0);
            String quantityPerUnit = request.getParameter("quantityPerUnit");
            double unitPrice = parseDouble(request, "unitPrice", 0.0);
            int unitInStock = parseInteger(request, "quantity", 0);
            String describe = request.getParameter("description");
            Date releaseDate = parseDate(request.getParameter("releaseDate"));

            Part part = request.getPart("image");

            String path = request.getServletContext().getRealPath("/images");
            File dir = new File(path);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            String fileName = part.getSubmittedFileName();
            File image = new File(dir, fileName);
            part.write(image.getAbsolutePath());

            String imagePath = "images/" + fileName;

            new ProductDAO().addNewProduct(productName, supplierId, cateId, quantityPerUnit, unitPrice, unitInStock, imagePath, describe, releaseDate);
            response.sendRedirect("manageProduct");

        } catch (Exception e) {
            request.setAttribute("error", "Lỗi khi thêm sản phẩm: " + e.getMessage());
            doGet(request, response);
        }
    }

    private int parseInteger(HttpServletRequest request, String param, int defaultValue) {
        try {
            String value = request.getParameter(param);
            return (value == null || value.trim().isEmpty()) ? defaultValue : Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    private double parseDouble(HttpServletRequest request, String param, double defaultValue) {
        try {
            String value = request.getParameter(param);
            return (value == null || value.trim().isEmpty()) ? defaultValue : Double.parseDouble(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    private Date parseDate(String dateStr) {
        try {
            return Date.valueOf(dateStr);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for adding products";
    }
}
