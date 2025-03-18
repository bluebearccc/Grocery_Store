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
import entity.PageControl;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
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
public class ProductController extends HttpServlet {

    ProductDAO pdao = new ProductDAO();
    CategoryDAO cdao = new CategoryDAO();
    SupplierDAO sdao = new SupplierDAO();
    PageControl pageControl = new PageControl();

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
        HttpSession session = request.getSession();
        //GET DATA FROM REQUEST
        String categoryId = request.getParameter("categoryId") == null || request.getParameter("categoryId").equals("") ? "all" : request.getParameter("categoryId");
        String productName = request.getParameter("productName");
        String pageRaw = request.getParameter("page");
        int min = Integer.parseInt(request.getParameter("min") == null ? "0" : request.getParameter("min"));
        int max = Integer.parseInt(request.getParameter("max") == null ? "200" : request.getParameter("max"));
        //HANDLE PAGE
        handlePageProduct(request, categoryId, min, max, productName == null ? "" : productName, pageRaw);
        //GET DATA FROM DAO
        List<Product> ProductList = getProductList(productName, categoryId, pageControl.getPage(), min, max);
        List<Category> CategoryList = getCategoryList();

        request.setAttribute("pageControl", pageControl);
        request.setAttribute("ProductList", ProductList);
        request.setAttribute("CategoryList", CategoryList);

        if (pageRaw != null) {
            paginationPage(request, response, pageControl, ProductList);
        } else {
            request.getRequestDispatcher("view/homepage/product.jsp").forward(request, response);
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

    public void handlePageProduct(HttpServletRequest request, String categoryId, int min, int max, String name, String pageRaw) {
        //get page
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
                = categoryId.equals("all") ? pdao.findTotalRecordPagnition(min, max, name)
                : pdao.findTotalRecordByCategory(Integer.parseInt(categoryId), min, max, name);

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
                        + "                <a href=\"productdetail&productId=" + p.getProduct__id() + "\"><i class=\"organik-icon-visibility\"></i></a>\n"
                        + "            </div><!-- /.product-card__image-content -->\n"
                        + "        </div><!-- /.product-card__image -->\n"
                        + "        <div class=\"product-card__content\">\n"
                        + "            <div class=\"product-card__left\">\n"
                        + "                <h3><a href=\"productdetail\">" + p.getProduct__name() + "</a></h3>\n"
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
            if (!ProductList.isEmpty()) {
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

            }
            out.print("</ul><!-- /.post-pagination -->");

        } catch (IOException e) {
        }

    }

    public List<Product> getProductList(String productName, String categoryId, int page, int min, int max) {
        if (min > max) {
            int temp = min;
            min = max;
            max = temp;
        }

        List<Product> list = null;

        //co min max
        if (min != CommonConst.MIN_PRICE || max != CommonConst.MAX_PRICE) {
            if (categoryId.equals("all")) {
                if (productName != null) {
                    list = pdao.getProductsInRangeNamePagination(min, max, page, productName);
                } else {
                    list = pdao.getProductsInRangePagination(min, max, pageControl.getPage());
                }
            } else {
                if (productName != null) {
                    list = pdao.getProductsInRangePaginationCateName(min, max, page, Integer.parseInt(categoryId), productName);
                } else {
                    list = pdao.getProductsInRangePaginationCate(min, max, pageControl.getPage(), Integer.parseInt(categoryId));
                }
            }
            //co category
        } else if (!categoryId.equals("all")) {
            if (productName != null) {
                list = pdao.getProductPaginationByCateName(Integer.parseInt(categoryId), pageControl.getPage(), productName);
            } else {
                list = pdao.getProductPaginationByCate(Integer.parseInt(categoryId), pageControl.getPage());
            }
            // khong co category - min - max
        } else {
            if (productName != null) {
                list = pdao.getProductByNamePagination(productName, pageControl.getPage());
            } else {
                list = pdao.getProductByNamePagination("", pageControl.getPage());
            }
        }
        return list;
    }

    public List<Category> getCategoryList() {
        List<Category> list = cdao.searchCategory("");
        return list;
    }
}
