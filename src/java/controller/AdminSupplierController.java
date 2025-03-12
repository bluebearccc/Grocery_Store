/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dal.SupplierDAO;
import entity.Supplier;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author Tranh
 */
public class AdminSupplierController extends HttpServlet {

    SupplierDAO dao = new SupplierDAO();

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
            out.println("<title>Servlet ManageSupplier</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageSupplier at " + request.getContextPath() + "</h1>");
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
        List<Supplier> listSuppliers = new SupplierDAO().getAllSuppliers();
        request.setAttribute("listAllSupplier", listSuppliers);
        request.getRequestDispatcher("view/dashboard/supplier.jsp").forward(request, response);
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
        String action = request.getParameter("action").trim();
        List<Supplier> list = dao.getAllSuppliers();
        switch (action) {
            case "search":
                list = new SupplierDAO().searchSuppliersByName(request.getParameter("valueSearch"));
                break;
            case "delete":
                deleteSupllier(Integer.parseInt(request.getParameter("id")));
                list = dao.getAllSuppliers();
                break;
            case "edit":
                request.setAttribute("find", dao.getSupplier(Integer.parseInt(request.getParameter("id"))));
                request.getRequestDispatcher("view/dashboard/updatesupplier.jsp").forward(request, response);
                break;
            case "submitEdit":
                editASupplier(request, response);
                list = dao.getAllSuppliers();
                break;
            case "add":
                addNewSupplier(request, response);
                list = dao.getAllSuppliers();
                break;
            default:
                throw new AssertionError();
        }
        request.setAttribute("listAllSupplier", list);
        request.setAttribute("searchValue", request.getParameter("valueSearch"));
        request.getRequestDispatcher("view/dashboard/supplier.jsp").forward(request, response);
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

    private void deleteSupllier(int id) {
        new SupplierDAO().deleteSupplier(id);
    }

    private void addNewSupplier(HttpServletRequest request, HttpServletResponse response) {
        String companyName = request.getParameter("CompanyName");
        String contactName = request.getParameter("ContactName");
        String phone = request.getParameter("Phone");
        dao.createSupplier(Supplier.builder()
                .company__name(companyName)
                .contact__name(contactName)
                .phone(phone)
                .build());
    }

    private void editASupplier(HttpServletRequest request, HttpServletResponse response) {
        String newCompanyName = request.getParameter("companyName");
        String newContactName = request.getParameter("contactName");
        String newPhone = request.getParameter("phone");
        dao.updateSupplier(new Supplier(Integer.parseInt(request.getParameter("id")), newCompanyName, newContactName, newPhone));
    }
}
