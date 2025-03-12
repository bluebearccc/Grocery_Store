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
import java.io.PrintWriter;
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
        HttpSession session = request.getSession();
        //GET DATA FROM REQUEST
        String categoryId = request.getParameter("categoryId") == null || request.getParameter("categoryId").equals("") ? "all" : request.getParameter("categoryId");
        String productId = request.getParameter("productId") == null ? "3" : request.getParameter("productId").trim();
        String productName = request.getParameter("productName");
        String pageRaw = request.getParameter("page");
        int min = Integer.parseInt(request.getParameter("min") == null ? "0" : request.getParameter("min"));
        int max = Integer.parseInt(request.getParameter("max") == null ? "200" : request.getParameter("max"));

        //GET DATA FROM DAO
        Product pro = pdao.getProduct(Integer.parseInt(productId));

        //PROCESS DATA
        String url = processUrl(request, response);
        handlePage(request, response, categoryId, min, max);
        List<Product> ProductList = getProductList(request, url, productName, categoryId, pro, pageControl.getPage(), pageRaw, min, max);
        List<Category> CategoryList = getCategoryList(request);
        Category cate = null;
        Supplier sup = null;

        if (pro != null) {
            cate = cdao.getCategoryById(pro.getCategory__id());
            sup = sdao.getSupplier(pro.getSupplier__id());
            session.setAttribute(CommonConst.SESSION_PRODUCT, pro);
            request.setAttribute(CommonConst.SESSION_SUPPLIER, sup);
            request.setAttribute(CommonConst.SESSION_CATEGORY, cate);
        }

        //SET DATA INTO REQUEST
        request.setAttribute("pageControl", pageControl);
        request.setAttribute("ProductList", ProductList);
        request.setAttribute("CategoryList", CategoryList);
        //REQUEST FORWARDING
        if (pageRaw != null) {
            paginationPage(request, response, pageControl, ProductList);
        } else {
            request.getRequestDispatcher(url).forward(request, response);
        }
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
        String url = processUrl(request, response);
        request.getRequestDispatcher(url).forward(request, response);
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
            case "maindashboard" -> {
                yield "AdminController";
            }
            case "product-details" -> {
                yield "view/homepage/product-details.jsp";
            }
            case "cart" -> {
                yield "payment";
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
            case "alterinfo" -> {
                yield "account";
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

    public void handlePage(HttpServletRequest request, HttpServletResponse response, String categoryId, int min, int max) {
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
        //calculate totalRecord by categoryId
        int totalRecord
                = categoryId.equals("all") ? pdao.findTotalRecordPagnition(min, max) : pdao.findTotalRecordByCategory(Integer.parseInt(categoryId), min, max);

        //total page
        int totalPage = totalRecord % CommonConst.RECORD_PER_PAGE == 0
                ? totalRecord / CommonConst.RECORD_PER_PAGE
                : (totalRecord / CommonConst.RECORD_PER_PAGE) + 1;

        //set total record, total page, page vao PageControl
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);
    }

    public void paginationPage(HttpServletRequest request, HttpServletResponse response, PageControl pg, List<Product> ProductList) {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print("<div class=\"product-sorter\">\n"
                    + " <div class=\"product-sorter__select\">\n"
                    + "     <img src=\"/Grocery_Store/images/logo-dark.png\" width=\"105\" alt=\"\">\n"
                    + " </div><!-- /.product-sorter__select -->\n"
                    + "</div><!-- /.product-sorter -->"
                    + "<div class=\"row\">\n");
            for (Product p : ProductList) {
                out.print("<div class=\"col-md-6 col-lg-4\">\n"
                        + "    <div class=\"product-card\">\n"
                        + "        <div class=\"product-card__image\">\n"
                        + "            <img src=\"/Grocery_Store/" + p.getImage() + "\" alt=\"\">\n"
                        + "            <div class=\"product-card__image-content\">\n"
                        + "                <a href=\"home?site=product-details&productId=" + p.getProduct__id() + "\"><i class=\"organik-icon-visibility\"></i></a>\n"
                        + "                <a href=\"home?site=cart\"><i class=\"organik-icon-shopping-cart\"></i></a>\n"
                        + "            </div><!-- /.product-card__image-content -->\n"
                        + "        </div><!-- /.product-card__image -->\n"
                        + "        <div class=\"product-card__content\">\n"
                        + "            <div class=\"product-card__left\">\n"
                        + "                <h3><a href=\"home?site=product-details\">" + p.getProduct__name() + "</a></h3>\n"
                        + "                <p>$" + p.getUnit__price() + "</p>\n"
                        + "            </div><!-- /.product-card__left -->\n"
                        + "            <div class=\"product-card__right\">\n");

                for (int i = 1; i <= p.getStar__rating(); i++) {
                    out.print("<i class=\"fa fa-star\"></i>\n");
                }

                out.print("            </div><!-- /.product-card__right -->\n"
                        + "        </div><!-- /.product-card__content -->\n"
                        + "    </div><!-- /.product-card -->\n"
                        + "</div><!-- /.col-md-6 col-lg-4 -->");
            }

            out.print("</div><!-- /.row -->"
                    + "<ul id=\"paginationButton\" class=\"list-unstyled post-pagination d-flex justify-content-center\" style=\"margin-top: 30px\">\n");

            if (pageControl.getPage() > 1) {
                out.print("    <li><a onclick=\"loadPage(" + (pageControl.getPage() - 1) + ")\"><i class=\"fa fa-angle-left\"></i></a></li>\n");
            }
            if (pageControl.getPage() == 1) {
                out.print("    <li><a onclick=\"loadPage(" + pageControl.getPage() + ")\"><i class=\"fa fa-angle-left\"></i></a></li>\n");
            }
            for (int i = 1; i <= pageControl.getTotalPage(); i++) {
                out.print("<li><a onclick=\"loadPage(" + i + ")\">" + i + "</a></li>\n");
            }
            if (pageControl.getPage() < pageControl.getTotalPage()) {
                out.print("<li><a onclick=\"loadPage(" + (pageControl.getPage() + 1) + ")\"><i class=\"fa fa-angle-right\"></i></a></li>\n");
            }
            if (pageControl.getPage() == pageControl.getTotalPage()) {
                out.print("<li><a onclick=\"loadPage(" + pageControl.getPage() + ")\"><i class=\"fa fa-angle-right\"></i></a></li>\n");
            }
            out.print("</ul><!-- /.post-pagination -->");

        } catch (IOException e) {
        }

    }

    public List<Product> getProductList(HttpServletRequest request, String url, String productName, String categoryId, Product p, int page, String pageRaw, int min, int max) {
        if (min > max) {
            int temp = min;
            min = max;
            max = temp;
        }

        List<Product> list = null;

        if (min != CommonConst.MIN_PRICE || max != CommonConst.MAX_PRICE) {
            if (categoryId.equals("all")) {
                return pdao.getProductsInRangePagination(min, max, pageControl.getPage());
            } else {
                return pdao.getProductsInRangePaginationCate(min, max, pageControl.getPage(), Integer.parseInt(categoryId));
            }
        }

        if (url.contains("home.jsp")) {
            list = pdao.getThreeLastestProduct();
        } else if (url.contains("product.jsp")) {
            if (pageRaw != null) {
                if (categoryId.equals("all")) {
                    list = pdao.getProductPagination(pageControl.getPage());
                } else {
                    list = pdao.getProductPaginationByCate(Integer.parseInt(categoryId), page);
                }
            } else {    //load into product without page - set page to 1
                if (productName == null) {
                    list = categoryId == null || categoryId.equals("all")
                            ? pdao.getProductPagination(page)
                            : pdao.getProductPaginationByCate(Integer.parseInt(categoryId), page);
                } else { //search by name 
                    list = pdao.searchProduct(productName);
                }
            }
        } else if (url.contains("product-details") && p != null) {
            list = pdao.searchProductSameCate(p);
        }
        return list;
    }

    public List<Category> getCategoryList(HttpServletRequest request) {
        List<Category> list = cdao.searchCategory("");
        return list;
    }
}
