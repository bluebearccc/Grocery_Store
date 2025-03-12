/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

/**
 *
 * @author Tranh
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB trước khi lưu vào ổ cứng
        maxFileSize = 1024 * 1024 * 10, // Kích thước tối đa file: 10MB
        maxRequestSize = 1024 * 1024 * 50 // Tổng request tối đa: 50MB
)
public class AdminAddProduct extends HttpServlet {

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
            out.println("<title>Servlet AdminAddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAddProduct at " + request.getContextPath() + "</h1>");
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
        addProduct(request, response);
        request.getRequestDispatcher("view/dashboard/mngproduct.jsp").forward(request, response);
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

    private void addProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            String productName = request.getParameter("productName");
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            int supplierId = Integer.parseInt(request.getParameter("supplierId"));
            String quantityPerUnit = request.getParameter("quantityPerUnit");
            double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
            int quantityInStock = Integer.parseInt(request.getParameter("unitInStock"));
            int quantitySold = Integer.parseInt(request.getParameter("quantitySold"));
            int starRating = Integer.parseInt(request.getParameter("starRating"));
            String description = request.getParameter("description");
            Date releaseDate = new Date();
            Calendar c = Calendar.getInstance();
            
            releaseDate = c.getTime();
            java.sql.Date date = new java.sql.Date(releaseDate.getTime());
            //image
            String pathOfFile = null;
            Part part = request.getPart("image");
            if (part.getSubmittedFileName() == null
                    || part.getSubmittedFileName().trim().isEmpty()
                    || part == null) {
                pathOfFile = null;
            } else {
                //duong dan luu anh
                String path = request.getServletContext().getRealPath("/img");
                File dir = new File(path);
                //xem duong dan ton tai chua
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                File image = new File(dir, part.getSubmittedFileName());

                part.write(image.getAbsolutePath());
                pathOfFile = request.getContextPath() + "/img/" + image.getName();
            }

            new ProductDAO().createProduct(productName, supplierId, categoryId, quantityPerUnit, (float) unitPrice, quantityInStock, quantitySold, starRating, pathOfFile, description, date);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
