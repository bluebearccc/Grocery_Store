/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import constant.CommonConst;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import entity.Cart;
import entity.Item;
import entity.Order;
import entity.OrderDetail;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.Iterator;

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
        OrderDAO odao = new OrderDAO();
        OrderDetailDAO oddao = new OrderDetailDAO();
        User u = (User) session.getAttribute(CommonConst.SESSION_ACCOUNT);
        Cart cart;

        String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("productId") == null ? "0" : request.getParameter("productId"));
        String currentPage = request.getParameter("currentPage") == null ? "home" : request.getParameter("currentPage").trim();
        cart = (Cart) session.getAttribute(CommonConst.SESSION_CART);

        if (u == null && action.equals("add")) {
            if (productId != 0) {
                request.setAttribute("currentPage", currentPage + "?productId=" + productId);
            }
            request.setAttribute("action", "login");
            request.getRequestDispatcher("account").forward(request, response);
        }

        switch (action) {
            case "add" -> {
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                float price = Float.parseFloat(request.getParameter("price"));
                Item i = new Item(pdao.getProduct(productId), quantity, price);
                if (cart == null) {
                    cart = new Cart();
                    session.setAttribute(CommonConst.SESSION_CART, cart);
                }
                cart.addItem(i);
                response.sendRedirect(currentPage + "?productId=" + productId);
            }
            case "delete" -> {
                if (cart != null) {
                    cart.removeItem(productId);
                }
                updateCart(response, cart);
            }
            case "update" -> {
                if (cart != null) {
                    String product[] = request.getParameterValues("productId");
                    String quantity[] = request.getParameterValues("quantity");

                    if (quantity != null && product != null) {
                        for (int i = 0; i < quantity.length; i++) {
                            if (!product[i].trim().isEmpty() && !quantity[i].trim().isEmpty()) {
                                cart.getItemById(Integer.parseInt(product[i])).setQuantity(Integer.parseInt(quantity[i]));
                            }
                        }
                    }
                    updateCart(response, cart);
                }
            }
            case "checkout" -> {
                if (cart != null && u != null) {
                    Calendar c = Calendar.getInstance();
                    java.sql.Date date = new java.sql.Date(c.getTime().getTime());
                    int orderId = odao.createOrderGetId(Order.builder().user__id(u.getUser__id()).order__date(date).build());
                    Iterator<Item> iterator = cart.getItems().iterator();
                    while (iterator.hasNext()) {
                        Item i = iterator.next();
                        oddao.createOrderDetail(OrderDetail.builder().order__id(orderId).product__id(i.getProduct().getProduct__id()).quantity(i.getQuantity()).unit__price(i.getPrice()).build());
                        pdao.editProductQuantity(i.getProduct().getProduct__id(), i.getProduct().getUnit__in__stock() - i.getQuantity(), i.getProduct().getQuantity__sold() + i.getQuantity());
                        iterator.remove();
                    }
                    updateCart(response, cart);
                }
            }
            case "updateSmallCart" -> {
                if (cart != null) {
                    updateSmallCart(response, cart);
                }
            }
            default ->
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

    public void updateSmallCart(HttpServletResponse response, Cart cart) {
        try (PrintWriter out = response.getWriter()) {
            out.print("<a href=\"payment\">\n"
                    + "                                <i class=\"organik-icon-shopping-cart\">\n"
                    + "                                    <span class=\"cart-badge\" >\n");
            if (cart != null) {
                out.print(cart.getItems().size() + "\n");
            }
            if (cart == null) {
                out.print("0\n");
            }

            out.print("                                    </span>\n"
                    + "                                </i>\n"
                    + "                            </a>\n"
                    + "                            <div class=\"cart-content\" id=\"cart-items\">\n"
                    + "                             <table>\n");

            for (Item item : cart.getItems()) {
                out.print("<tr>\n"
                        + " <td>\n"
                        + "<img src=\"/Grocery_Store/" + item.getProduct().getImage() + "\" alt=\"\" style=\"width: 50px\">\n"
                        + "</td>\n"
                        + " <td>\n"
                        + "<p>" + item.getProduct().getProduct__name() + "-" + item.getQuantity() + "</p>"
                        + "</td>\n"
                        + "</tr>\n");
            }
            out.print(" </table>\n"
                    + "</div>\n");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateCart(HttpServletResponse response, Cart cart) {
        try (PrintWriter out = response.getWriter()) {
            out.print(" <div class=\"container\">\n"
                    + "                    <div class=\"table-responsive\">\n"
                    + "                        <table class=\"table cart-table\">\n"
                    + "                            <thead>\n"
                    + "                                <tr>\n"
                    + "                                    <th>Item</th>\n"
                    + "                                    <th>Remains</th>\n"
                    + "                                    <th>Price</th>\n"
                    + "                                    <th>Quantity</th>\n"
                    + "                                    <th>Total</th>\n"
                    + "                                    <th>Remove</th>\n"
                    + "                                </tr>\n"
                    + "                            </thead>\n"
                    + "                            <tbody id=\"tableContent\">\n");

            for (Item item : cart.getItems()) {
                out.print("                                    <tr>\n"
                        + "                                        <td>\n"
                        + "                                            <div class=\"product-box\">\n"
                        + "                                                <img src=\"/Grocery_Store/" + item.getProduct().getImage() + "\" alt=\"\" style=\"width: 270px; height: 283px\">\n"
                        + "                                                <h3><a href=\"productdetail\">" + item.getProduct().getProduct__name() + "</a></h3>\n"
                        + "                                            </div><!-- /.product-box -->\n"
                        + "                                        </td>\n"
                        + "                                        <td>" + item.getProduct().getUnit__in__stock() + "</td>"
                        + "                                        <td>$" + item.getPrice() + "</td>\n"
                        + "                                        <td>\n"
                        + "                                            <div>\n"
                        + "                                                <button type=\"button\" class=\"compute\" onclick=\"decreaseQuantity(this), update()\">-</button>\n"
                        + "                                                <input type=\"text\" class=\"productQuantity\" required oninput=\"checkQuantity(this, " + item.getProduct().getUnit__in__stock() + ")\" name=\"productQuantity\" value=\"" + item.getQuantity() + "\" style=\"width: 50px;\n"
                        + "                                                       text-align: center;\n"
                        + "                                                       border: none;\n"
                        + "                                                       outline: none;\n"
                        + "                                                       font-size: 20px;\n"
                        + "                                                       background-color: #f9f9f9;\"/>"
                        + "                                               <button type=\"button\" class=\"compute\" onclick=\"increaseQuantity(this, " + item.getProduct().getUnit__in__stock() + "), update()\">+</button>"
                        + "                                            </div>"
                        + "                                        </td>\n"
                        + "                                        <td>\n"
                        + "                                            " + item.getPrice() * item.getQuantity() + "\n"
                        + "                                        </td>\n"
                        + "                                             <td>\n"
                        + "                                            <input type=\"hidden\" name=\"productId\" value=\"" + item.getProduct().getProduct__id() + "\">\n"
                        + "                                            <button onclick=\"deleteProduct(this)\" style=\"background: none; border: none\"><i class=\"organik-icon-close remove-icon\"></i></button>\n"
                        + "                                        </td>"
                        + "                                    </tr>\n");
            }

            out.print("                            </tbody>\n"
                    + "                        </table><!-- /.table -->\n"
                    + "                    </div><!-- /.table-responsive -->\n"
                    + "                    <div class=\"row\">\n"
                    + "                        <div class=\"col-lg-4\">\n"
                    + "                            <ul id=\"total-money\" class=\"cart-total list-unstyled\">\n"
                    + "                                <li>\n"
                    + "                                    <span>Subtotal</span>\n"
                    + "                                    <span>$" + cart.getTotalMoney() + " USD</span>\n"
                    + "                                </li>\n"
                    + "                                <li>\n"
                    + "                                    <span>Free Ship</span>\n"
                    + "                                    <span>$2.0 USD</span>\n"
                    + "                                </li>\n"
                    + "                                <li>\n"
                    + "                                    <span>Total</span>\n"
                    + "                                    <span>$" + (cart.getTotalMoney() + 2) + " USD</span>\n"
                    + "                                </li>\n"
                    + "                            </ul><!-- /.cart-total -->\n"
                    + "                            <div class=\"button-box\">\n"
                    + "                                    <button onclick=\"update()\" class=\"thm-btn\">Update</button><!-- /.thm-btn -->\n"
                    + "                                    <button onclick=\"checkout()\" class=\"thm-btn\">Checkout</button><!-- /.thm-btn -->\n"
                    + "                            </div><!-- /.button-box -->\n"
                    + "                        </div><!-- /.col-lg-4 -->\n"
                    + "                    </div><!-- /.row -->\n"
                    + "                </div><!-- /.container -->");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
