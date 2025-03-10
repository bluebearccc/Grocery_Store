/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.account;

import dal.admin.UserDAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Tranh
 */
public class ManageAccount extends HttpServlet {
    UserDAO userDao = new UserDAO();
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
            out.println("<title>Servlet ManageAccount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageAccount at " + request.getContextPath() + "</h1>");
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
        List<User> list = userDao.getAllUsers();
        request.setAttribute("listAccounts", list);
        request.getRequestDispatcher("dashboard/mngaccount.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        String searchValue = request.getParameter("valueSearch");
        List<User> list = userDao.getAllUsers();
        switch (action) {
            case "search":
                list = searchUsersByName(searchValue);
                break;
            case "delete":
                deleteUserById(Integer.parseInt(request.getParameter("id").trim()));
                list = userDao.getAllUsers();
                break;
            default:
                throw new AssertionError();
        }
        request.setAttribute("listAccounts", list);
        request.setAttribute("searchValue", searchValue);
        request.getRequestDispatcher("dashboard/mngaccount.jsp").forward(request, response);
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
    
    private List<User> searchUsersByName(String keyword){
        if (keyword == null) {
            keyword = "";
        }
        if (keyword != null || !keyword.isEmpty()) {
            return userDao.searchUsers(keyword);
        }
        return userDao.getAllUsers();
    } 
    
    private void deleteUserById(int id){
        userDao.deleteUser(id);
    }
}
