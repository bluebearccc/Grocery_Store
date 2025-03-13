/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Tranh
 */
public class MonthlyRevenue extends HttpServlet {

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
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            String year_raw = request.getParameter("year");
            int year = (year_raw == null ? 2023 : Integer.parseInt(year_raw));
            OrderDAO dao = new OrderDAO();
            double totalMoneyMonth1 = dao.totalMoneyMonth(1, year);
            double totalMoneyMonth2 = dao.totalMoneyMonth(2, year);
            double totalMoneyMonth3 = dao.totalMoneyMonth(3, year);
            double totalMoneyMonth4 = dao.totalMoneyMonth(4, year);
            double totalMoneyMonth5 = dao.totalMoneyMonth(5, year);
            double totalMoneyMonth6 = dao.totalMoneyMonth(6, year);
            double totalMoneyMonth7 = dao.totalMoneyMonth(7, year);
            double totalMoneyMonth8 = dao.totalMoneyMonth(8, year);
            double totalMoneyMonth9 = dao.totalMoneyMonth(9, year);
            double totalMoneyMonth10 = dao.totalMoneyMonth(10, year);
            double totalMoneyMonth11 = dao.totalMoneyMonth(11, year);
            double totalMoneyMonth12 = dao.totalMoneyMonth(12, year);

            request.setAttribute("totalMoneyMonth1", totalMoneyMonth1);
            request.setAttribute("totalMoneyMonth2", totalMoneyMonth2);
            request.setAttribute("totalMoneyMonth3", totalMoneyMonth3);
            request.setAttribute("totalMoneyMonth4", totalMoneyMonth4);
            request.setAttribute("totalMoneyMonth5", totalMoneyMonth5);
            request.setAttribute("totalMoneyMonth6", totalMoneyMonth6);
            request.setAttribute("totalMoneyMonth7", totalMoneyMonth7);
            request.setAttribute("totalMoneyMonth8", totalMoneyMonth8);
            request.setAttribute("totalMoneyMonth9", totalMoneyMonth9);
            request.setAttribute("totalMoneyMonth10", totalMoneyMonth10);
            request.setAttribute("totalMoneyMonth11", totalMoneyMonth11);
            request.setAttribute("totalMoneyMonth12", totalMoneyMonth12);
            request.setAttribute("year", year);

            request.getRequestDispatcher("view/dashboard/MonthlyRevenue.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
