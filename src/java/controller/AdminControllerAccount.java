/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;


import dal.UserDAO;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class AdminControllerAccount extends HttpServlet {

    private final UserDAO dao = new UserDAO(); // Reuse DAO instance

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> listAllUser = dao.getAllUsers();
        request.setAttribute("listAccounts", listAllUser);
        request.getRequestDispatcher("view/dashboard/mngaccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("AdminAccountController");
            return;
        }

        List<User> list;
        String valueSearch = request.getParameter("valueSearch");

        switch (action) {
            case "search":
                list = searchUserByName(valueSearch);
                break;
            case "delete":
                String idParam = request.getParameter("id");
                if (idParam != null && idParam.matches("\\d+")) {
                    dao.deleteUser(Integer.parseInt(idParam));
                }
                list = dao.getAllUsers();
                break;
            default:
                response.sendRedirect("AdminAccountController");
                return;
        }

        request.setAttribute("listAccounts", list);
        request.setAttribute("valueSearch", valueSearch);
        request.getRequestDispatcher("view/dashboard/mngaccount.jsp").forward(request, response);
    }

    private List<User> searchUserByName(String name) {
        if (name != null && !name.isEmpty()) {
            return dao.searchUsers(name);
        }
        return dao.getAllUsers();
    }
}
