/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import constant.CommonConst;
import dal.*;
import entity.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author admin
 */
public class HomeController extends HttpServlet {

    ProductDAO pdao = new ProductDAO();
    CategoryDAO cdao = new CategoryDAO();
    SupplierDAO sdao = new SupplierDAO();
    PageControl pageControl = new PageControl();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String site = request.getParameter("site") == null ? "default" : request.getParameter("site").trim().toLowerCase();
        String categoryId = request.getParameter("categoryId");
        String productId = request.getParameter("productId") == null ? "3" : request.getParameter("productId").trim();
        List<Product> ProductList;
        List<Category> CategoryList = cdao.searchCategory("");
        ProductList = categoryId == null || categoryId.equals("all") ? pdao.searchProduct("") : pdao.searchProductByCate(Integer.parseInt(categoryId));
        Product pro = pdao.getProduct(Integer.parseInt(productId));
        Category cate = cdao.getCategoryById(pro.getCategory__id());
        Supplier sup = sdao.getSupplier(pro.getSupplier__id());
        String pageRaw = request.getParameter("page");
        int page;
        try {
            page = Integer.parseInt(pageRaw);
            if (page <= 0) {
                page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }
        String requestURL = request.getRequestURL().toString() + "?";
        int totalRecord = pdao.findTotalRecordByCategory(page);
        String urlPattern = requestURL; //+ queryS
        //total page
        int totalPage = totalRecord % CommonConst.RECORD_PER_PAGE == 0
                ? totalRecord / CommonConst.RECORD_PER_PAGE
                : (totalRecord / CommonConst.RECORD_PER_PAGE) + 1;
        //set total record, total page, page vao PageControl
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);
        pageControl.setUrlPattern(urlPattern);
        String url;
        url = switch (site) {
            case "product" ->
                "view/homepage/product.jsp";
            case "product-details" -> {
                request.setAttribute(CommonConst.SESSION_PRODUCT, pro);
                request.setAttribute(CommonConst.SESSION_CATEGORY, cate);
                request.setAttribute(CommonConst.SESSION_SUPPLIER, sup);
                request.setAttribute("SameCategoryList", pdao.searchProductSameCate(pro));
                yield "view/homepage/product-details.jsp";
            }
            case "cart" ->
                "view/homepage/cart.jsp";
            case "contact" ->
                "view/homepage/contact.jsp";
            case "account" ->
                "view/user/account.jsp";
            case "about" ->
                "view/homepage/about.jsp";
            case "login" ->
                "view/homepage/login.jsp";
            case "logout" -> {
                request.getSession().removeAttribute(CommonConst.SESSION_ACCOUNT);
                ProductList = pdao.getThreeLastestProduct();
                yield "view/homepage/home.jsp";
            }
            case "register" ->
                "view/homepage/register.jsp";
            default -> {
                ProductList = pdao.getThreeLastestProduct();
                yield "view/homepage/home.jsp";
            }
        };

        request.setAttribute("ProductList", ProductList);
        request.setAttribute("CategoryList", CategoryList);
        request.getRequestDispatcher(url).forward(request, response);
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
        String site = request.getParameter("site") == null ? "default" : request.getParameter("site").trim().toLowerCase();
        switch (site) {
            case "validatelogin" ->
                request.getRequestDispatcher("account").forward(request, response);
            case "registeruser" ->
                request.getRequestDispatcher("account").forward(request, response);
            default ->
                doGet(request, response);
        }

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

}
