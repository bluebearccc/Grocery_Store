/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import constant.CommonConst;
import dal.ProductDAO;
import entity.Cart;
import entity.Item;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class PaymentController extends HttpServlet {

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
        request.getRequestDispatcher("view/homepage/cart.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        ProductDAO pdao = new ProductDAO();
        User u = (User) session.getAttribute(CommonConst.SESSION_ACCOUNT);
        Cart cart;

        String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("productId"));
        String currentPage = request.getParameter("currentPage") == null ? "home" : request.getParameter("currentPage");
        cart = (Cart) session.getAttribute(CommonConst.SESSION_CART);

        if (u == null) {
            session.setAttribute("currentPage", currentPage + "&productId=" + productId);
            request.getRequestDispatcher("home?site=login").forward(request, response);
            return;
        }

        switch (action) {
            case "add":
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                float price = Float.parseFloat(request.getParameter("price"));
                Item i = new Item(pdao.getProduct(productId), quantity, price);
                if (cart == null) {
                    cart = new Cart();
                    session.setAttribute(CommonConst.SESSION_CART, cart);
                }
                cart.addItem(i);
                response.sendRedirect("home?site=" + currentPage + "&productId=" + productId);
                break;
            case "delete":
                if (cart != null) {
                    cart.removeItem(productId);
                }
                response.sendRedirect("home?site=cart");
                break;
            default:
                throw new AssertionError();
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
