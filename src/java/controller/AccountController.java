/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import constant.CommonConst;
import dal.UserDAO;
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
public class AccountController extends HttpServlet {

    UserDAO udao = new UserDAO();

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
        HttpSession session = request.getSession();
        switch (site) {
            case "validatelogin":
                userLogin(request, response, session);
                break;
            case "registeruser":
                userRegister(request, response, session);
                break;
            default:
                request.getRequestDispatcher("view/homepage/home.jsp").forward(request, response);
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

    public void userLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User u = udao.getUser(username, password);
        if (u != null) {
            session.setAttribute(CommonConst.SESSION_ACCOUNT, u);
            response.sendRedirect("home");
        } else {
            request.setAttribute("error", "⚠️ Incorrect username or password. Please try again!");
            request.getRequestDispatcher("view/homepage/login.jsp").forward(request, response);
        }
    }

    private void userRegister(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String passwordConfirm = request.getParameter("password-confirm");
        if (!password.equals(passwordConfirm)) {
            request.setAttribute("error", "⚠️ password are not matching. Please try again!");
            request.getRequestDispatcher("view/homepage/register.jsp").forward(request, response);
        }

        User u = User.builder().username(username).fullname(fullname).password(password).email(email).phone(phone).address(address).role(true).balance(0).build();
        u = udao.CreateUser(u);
        session.setAttribute(CommonConst.SESSION_ACCOUNT, u);
        response.sendRedirect("home");
    }
}
