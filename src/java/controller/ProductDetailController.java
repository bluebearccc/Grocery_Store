/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import constant.CommonConst;
import dal.CategoryDAO;
import dal.ProductDAO;
import dal.SupplierDAO;
import entity.Category;
import entity.Product;
import entity.Supplier;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author admin
 */
public class ProductDetailController extends HttpServlet {

    ProductDAO pdao = new ProductDAO();
    CategoryDAO cdao = new CategoryDAO();
    SupplierDAO sdao = new SupplierDAO();

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("productId") == null || request.getParameter("productId").equals("0") ? "3" : request.getParameter("productId").trim();
        //GET DATA FROM DAO
        Product pro = pdao.getProduct(Integer.parseInt(productId));
        Category cate = cdao.getCategoryById(pro.getCategory__id());
        Supplier sup = sdao.getSupplier(pro.getSupplier__id());
        request.setAttribute(CommonConst.SESSION_PRODUCT, pro);
        request.setAttribute(CommonConst.SESSION_SUPPLIER, sup);
        request.setAttribute(CommonConst.SESSION_CATEGORY, cate);
        List<Product> ProductList = getProductList(pro);

        request.setAttribute("ProductList", ProductList);
        request.getRequestDispatcher("view/homepage/product-details.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public List<Product> getProductList(Product p) {
        List<Product> list = pdao.searchProductSameCate(p);
        return list;
    }
}
