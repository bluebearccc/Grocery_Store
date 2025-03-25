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
    AccountOrderDAO aodao = new AccountOrderDAO();
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
        //PROCESS DATA
        String url = processUrl(request, response);
        List<Product> ProductList = getProductList();

        //SET DATA INTO REQUEST
        request.setAttribute("ProductList", ProductList);

        //REQUEST FORWARDING
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

    public String processUrl(HttpServletRequest request, HttpServletResponse response) {
        String url;
        //get site that user want to navigate to
        String site = request.getParameter("site") == null ? "default" : request.getParameter("site").trim().toLowerCase();

        //get site's url
        url = switch (site) {
            case "contact" -> {
                yield "view/homepage/contact.jsp";
            }
            case "about" -> {
                yield "view/homepage/about.jsp";
            }
            default -> {
                yield "view/homepage/home.jsp";
            }
        };

        return url;
    }

    public List<Product> getProductList() {
        return pdao.getThreeLastestProduct();
    }
}
