/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAOTokenForget;
import dal.UserDAO;
import entity.TokenForgetPassword;
import entity.User;
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
public class RequestPassword extends HttpServlet {

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
            out.println("<title>Servlet RequestPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RequestPassword at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("view/user/RequestPassword.jsp").forward(request, response);
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
        UserDAO daoUser = new UserDAO();
        String email = request.getParameter("email");
        //email co ton tai trong db
        User user = daoUser.getUserByEmail(email);
        if (user == null) {
            request.setAttribute("mess", "email khong ton tai");
            request.getRequestDispatcher("view/user/RequestPassword.jsp").forward(request, response);
            return;
        }
        ResetService service = new ResetService();
        String token = service.generateToken();
        String linkReset = "http://localhost:9999/Grocery_Store/ResetPassword?token=" + token;
        TokenForgetPassword newTokenForget = new TokenForgetPassword(
                user.getUser__id(), false, token);
        
        DAOTokenForget daoToken = new DAOTokenForget();
        boolean isInsert = daoToken.insertTokenForget(newTokenForget);
        
        if (!isInsert) {
            request.setAttribute("mess", "have error in server");
            request.getRequestDispatcher("view/user/RequestPassword.jsp").forward(request, response);
            return;     
        }
        boolean isSend = service.sendEmail(email, linkReset, user.getUsername());
        if (!isSend) {
            request.setAttribute("mess", "can not send request");
            request.getRequestDispatcher("view/user/RequestPassword.jsp").forward(request, response);
            return;
        }
        request.setAttribute("mess", "send request success");
        request.getRequestDispatcher("view/user/RequestPassword.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
