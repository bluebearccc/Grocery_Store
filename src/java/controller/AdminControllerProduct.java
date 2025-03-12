/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.SupplierDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.List;

/**
 *
 * @author Tranh
 */
public class AdminControllerProduct extends HttpServlet {

    ProductDAO productDao = new ProductDAO();
    CategoryDAO cateDao = new CategoryDAO();
    SupplierDAO supDao = new SupplierDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setAttribute("listAllProducts", productDao.getAllProducts());
        session.setAttribute("listAllCategories", cateDao.getAllCategories());
        session.setAttribute("listAllSuppliers", supDao.getAllSuppliers());
        request.getRequestDispatcher("view/dashboard/mngproduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        List<Product> list = productDao.getAllProducts();
        try {
            switch (action) {
                case "search":
                    list = searchProduct(request, response);
                    break;
                case "delete":
                    deleteAProduct(Integer.parseInt(request.getParameter("id")));
                    list = productDao.getAllProducts();
                    break;
                case "edit":
                    Product findProduct = productDao.searchProductById(Integer.parseInt(request.getParameter("id")));
                    request.setAttribute("findProduct", findProduct);
                    request.getRequestDispatcher("view/dashboard/updateproduct.jsp").forward(request, response);
                    return;
                case "submitEdit":
                    editProduct(request);
                    list = productDao.getAllProducts();
                    break;
                case "add":
                    request.getRequestDispatcher("view/dashboard/addProduct.jsp").forward(request, response);
                    break;
                default:
                    throw new IllegalArgumentException("Invalid action: " + action);
            }
        } catch (ServletException | IOException | IllegalArgumentException e) {
        }

        request.setAttribute("listAllProducts", list);
        request.setAttribute("searchValue", request.getParameter("valueSearch"));
        request.getRequestDispatcher("view/dashboard/mngproduct.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private List<Product> searchProduct(HttpServletRequest request, HttpServletResponse response) {
        String searchValue = request.getParameter("valueSearch");
        return productDao.searchProduct(searchValue);
    }

    private void deleteAProduct(int productId) {
        productDao.deleteProduct(productId);
    }

    private void editProduct(HttpServletRequest request) {
        int productId = Integer.parseInt(request.getParameter("id"));
        String newProductName = request.getParameter("name");
        int newSupplierId = Integer.parseInt(request.getParameter("supplier"));
        int newCateId = Integer.parseInt(request.getParameter("category"));
        String newQuantityPerUnit = request.getParameter("quantityperunit");
        double newUnitPrice = Double.parseDouble(request.getParameter("price"));
        String newDescription = request.getParameter("describe");
        productDao.editProduct(productId, newProductName, newSupplierId, newCateId, newQuantityPerUnit, newUnitPrice, newDescription);
    }

}
