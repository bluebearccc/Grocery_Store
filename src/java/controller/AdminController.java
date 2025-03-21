/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import dal.SupplierDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Tranh
 */
public class AdminController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        String site = request.getParameter("site");
        request.setAttribute("totalProduct", new ProductDAO().totalProduct());
        request.setAttribute("totalSoldProduct", new ProductDAO().totalQuantitySold());
        request.setAttribute("totalUser", new UserDAO().totalUser());
        request.setAttribute("totalCate", new CategoryDAO().totalCategory());
        request.setAttribute("totalSupplier", new SupplierDAO().totalSupplier());
        request.setAttribute("totalMoney", new OrderDetailDAO().totalMoney());
        session.setAttribute("listAllCategories", new CategoryDAO().getAllCategories());
        session.setAttribute("listAllSuppliers", new SupplierDAO().getAllSuppliers());
        if (site == null) {
            response.sendRedirect("AdminController?site=maindashboard");
            return;
        }
        switch (site) {
            case "maindashboard":
                request.getRequestDispatcher("view/dashboard/dashboard.jsp").forward(request, response);
                return;
            case "product":
                request.getRequestDispatcher("AdminControllerProduct").forward(request, response);
                return;
            case "supplier":
                response.sendRedirect("AdminSupplierController");
                return;
            case "account":
                response.sendRedirect("AdminControllerAccount");
                return;
            case "monthlyRevenue":
                response.sendRedirect("MonthlyRevenue");
                return;
            case "manageCategory":
                response.sendRedirect("AdminCategoryController");
                return;
            case "manageOrders":
                response.sendRedirect("AdminOrderDetail");
                return;
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
