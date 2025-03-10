package controller.admin.product;

import dal.admin.CategoryDAO;
import dal.admin.ProductDAO;
import dal.admin.SupplierDAO;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

public class ManageProduct extends HttpServlet {

    ProductDAO productDao = new ProductDAO();
    CategoryDAO cateDao = new CategoryDAO();
    SupplierDAO supDao = new SupplierDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> list = productDao.getAllProducts();
        HttpSession session = request.getSession();
        request.setAttribute("listAllProduct", list);
        session.setAttribute("listCC", cateDao.getAllCategories());
        session.setAttribute("list", supDao.getAllSuppliers());
        request.getRequestDispatcher("dashboard/mngproduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        List<Product> list = productDao.getAllProducts();
        HttpSession session = request.getSession();

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
                    session.setAttribute("findProduct", findProduct);
                    request.getRequestDispatcher("dashboard/updateproduct.jsp").forward(request, response);
                    return;
                default:
                    throw new IllegalArgumentException("Invalid action: " + action);
            }
        } catch (Exception e) {
            session.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            e.printStackTrace();
        }

        request.setAttribute("listAllProduct", list);
        request.setAttribute("searchValue", request.getParameter("valueSearch"));
        request.getRequestDispatcher("dashboard/mngproduct.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private List<Product> searchProduct(HttpServletRequest request, HttpServletResponse response) {
        String searchValue = request.getParameter("valueSearch");
        return productDao.searchProductsByKeyword(searchValue);
    }

    private void deleteAProduct(int productId) {
        productDao.deleteProductById(productId);
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
