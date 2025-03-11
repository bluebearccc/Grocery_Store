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
        String categoryId = request.getParameter("categoryId") == null ? "all" : request.getParameter("categoryId");
        String productId = request.getParameter("productId") == null ? "3" : request.getParameter("productId").trim();
        String action = request.getParameter("action");
        String productName = request.getParameter("productName");
        List<Product> ProductList;
        List<Category> CategoryList = cdao.searchCategory("");
        if (productName == null) {
            ProductList = categoryId == null || categoryId.equals("all") ? pdao.searchProduct("") : pdao.searchProductByCate(Integer.parseInt(categoryId));
        } else {
            ProductList = pdao.searchProduct(productName);
        }

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
        String QueryS = "";
        String url;
        url = switch (site) {
            case "product" -> {
                QueryS = "site=product&categoryId=" + categoryId + "&";
                if (productName == null) {
                    ProductList = categoryId == null || categoryId.equals("all") ? pdao.getProductPagination(page) : pdao.getProductPaginationByCate(Integer.parseInt(categoryId), page);
                }
                yield "view/homepage/product.jsp";
            }
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
        String requestURL = request.getRequestURL().toString() + "?";
        int totalRecord = categoryId == null || categoryId.equals("all") ? pdao.findTotalRecordPagnition() : pdao.findTotalRecordByCategory(Integer.parseInt(categoryId));
        String urlPattern = requestURL + QueryS;
        //total page
        int totalPage = totalRecord % CommonConst.RECORD_PER_PAGE == 0
                ? totalRecord / CommonConst.RECORD_PER_PAGE
                : (totalRecord / CommonConst.RECORD_PER_PAGE) + 1;
        //set total record, total page, page vao PageControl
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);
        pageControl.setUrlPattern(urlPattern);
        request.setAttribute("pageControl", pageControl);
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

    public String processUrl(HttpServletRequest request, HttpServletResponse response) {
        String url;
        //get site that user want to navigate to
        String site = request.getParameter("site") == null ? "default" : request.getParameter("site").trim().toLowerCase();

        //get site's url
        url = switch (site) {
            case "product" -> {
                yield "view/homepage/product.jsp";
            }
            case "product-details" -> {
                yield "view/homepage/product-details.jsp";
            }
            case "cart" -> {
                yield "view/homepage/cart.jsp";
            }
            case "contact" -> {
                yield "view/homepage/contact.jsp";
            }
            case "account" -> {
                yield "view/user/account.jsp";
            }
            case "about" -> {
                yield "view/homepage/about.jsp";
            }
            case "login" -> {
                yield "view/homepage/login.jsp";
            }
            case "logout" -> {
                request.getSession().removeAttribute(CommonConst.SESSION_ACCOUNT);
                yield "view/homepage/home.jsp";
            }
            case "register" -> {
                yield "view/homepage/register.jsp";
            }
            case "validatelogin" -> {
                yield "account";
            }
            case "registeruser" -> {
                yield "account";
            }
            default -> {
                yield "view/homepage/home.jsp";
            }
        };

        return url;
    }

    public void handlePage(HttpServletRequest request, HttpServletResponse response, String QueryS, String categoryId) {
        //get page
        String pageRaw = request.getParameter("page");
        int page;
        //validate page
        try {
            page = Integer.parseInt(pageRaw);
            if (page <= 0) {
                page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }
        String requestURL = request.getRequestURL().toString() + "?";
        String urlPattern = requestURL + QueryS;
        //calculate totalRecord by categoryId
        int totalRecord = categoryId.equals("all") ? pdao.findTotalRecordPagnition() : pdao.findTotalRecordByCategory(Integer.parseInt(categoryId));
        //total page
        int totalPage = totalRecord % CommonConst.RECORD_PER_PAGE == 0
                ? totalRecord / CommonConst.RECORD_PER_PAGE
                : (totalRecord / CommonConst.RECORD_PER_PAGE) + 1;
        //set total record, total page, page vao PageControl
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);
        pageControl.setUrlPattern(urlPattern);
    }

    public List<Product> getProductList(HttpServletRequest request, HttpServletResponse response) {
        return null;
    }

    public List<Category> getCategoryList(HttpServletRequest request, HttpServletResponse response) {
        return null;
    }
}
