/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import constant.CommonConst;
import dal.AccountOrderDAO;
import dal.UserDAO;
import entity.AccountOrder;
import entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author admin
 */
public class AccountController extends HttpServlet {

    UserDAO udao = new UserDAO();
    AccountOrderDAO aodao = new AccountOrderDAO();

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
        String action = request.getParameter("action") == null ? "defailt" : request.getParameter("action").trim();
        HttpSession session = request.getSession();

        switch (action) {
            case "login" ->
                request.getRequestDispatcher("view/homepage/login.jsp").forward(request, response);
            case "register" ->
                request.getRequestDispatcher("view/homepage/register.jsp").forward(request, response);
            case "logout" -> {
                session.invalidate();
                request.getRequestDispatcher("view/homepage/register.jsp").forward(request, response);
            }
            default -> {
                User u = (User) session.getAttribute(CommonConst.SESSION_ACCOUNT);
                if (u == null) {
                    request.setAttribute("currentPage", "account");
                    request.getRequestDispatcher("view/homepage/login.jsp").forward(request, response);
                } else {
                    List<AccountOrder> AccountOrderList = getAccountOrderList(request, u);
                    request.setAttribute("AccountOrderList", AccountOrderList);
                    request.getRequestDispatcher("view/user/account.jsp").forward(request, response);
                }
            }
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
        String site = request.getParameter("site") == null ? "default" : request.getParameter("site").trim().toLowerCase();
        HttpSession session = request.getSession();
        switch (site) {
            case "validatelogin" ->
                userLogin(request, response, session);
            case "registeruser" ->
                userRegister(request, response, session);
            case "alterinfo" ->
                userAlterInfo(request, response);
            default ->
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
        String remember = request.getParameter("remember");
        String currentPage = request.getParameter("remember");
        User u = udao.getUser(username, password);

        if (u != null) {
            session.setAttribute(CommonConst.SESSION_ACCOUNT, u);
            if (remember != null) {
                Cookie userCookie = new Cookie("userCookie", username.trim());
                Cookie passCookie = new Cookie("passCookie", password.trim());
                Cookie remCookie = new Cookie("remCookie", remember.trim());
                userCookie.setMaxAge(3600 * 2);
                passCookie.setMaxAge(3600 * 2);
                remCookie.setMaxAge(3600 * 2);
                response.addCookie(userCookie);
                response.addCookie(passCookie);
                response.addCookie(remCookie);
            }

            if (currentPage != null) {
                response.sendRedirect(currentPage);
            } else {
                response.sendRedirect("home");
            }
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
        String currentPage = request.getParameter("remember");

        if (!password.equals(passwordConfirm)) {
            request.setAttribute("error", "⚠️ password are not matching. Please try again!");
            request.getRequestDispatcher("view/homepage/register.jsp").forward(request, response);
        } else if (udao.getUser(username, password) != null) {
            request.setAttribute("error", "⚠️ Username already exist. Please try again!");
            request.getRequestDispatcher("view/homepage/register.jsp").forward(request, response);
        } else if (udao.getUserByEmail(email.trim()) != null) {
            request.setAttribute("error", "⚠️ Email already exist. Please try again!");
            request.getRequestDispatcher("view/homepage/register.jsp").forward(request, response);
        } else {
            User u = User.builder().username(username).fullname(fullname).password(password).email(email).phone(phone).address(address).role(true).balance(0).build();
            u = udao.CreateUser(u);
            session.setAttribute(CommonConst.SESSION_ACCOUNT, u);
            if (currentPage != null) {
                response.sendRedirect(currentPage);
            } else {
                response.sendRedirect("home");
            }
        }
    }

    private void userAlterInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String newPassword = request.getParameter("newpassword");
        String newPasswordConfirm = request.getParameter("newpasswordconfirm") == null || request.getParameter("newpasswordconfirm").equals("") ? request.getParameter("newpassword") : request.getParameter("newpasswordconfirm");
        if (!newPassword.equals(newPasswordConfirm)) {
            request.setAttribute("error", "⚠️ new password are not matching. Please try again!");
            request.getRequestDispatcher("account").forward(request, response);
        } else {
            User u = new User(Integer.parseInt(id), username, fullname, newPassword, email, address, phone, true, 0);
            udao.UpdateUser(u);
            request.getSession().setAttribute(CommonConst.SESSION_ACCOUNT, u);
            request.getRequestDispatcher("account").forward(request, response);
        }
    }

    public List<AccountOrder> getAccountOrderList(HttpServletRequest request, User u) {
        List<AccountOrder> list = null;
        if (u != null) {
            list = aodao.getAllAccountOrder(u.getUser__id(), 1);
        }
        return list;
    }
}
