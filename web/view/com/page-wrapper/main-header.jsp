<%-- 
    Document   : main-header
    Created on : Mar 6, 2025, 1:26:57 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .cart-container {
                position: relative;
                display: inline-block;
                border-radius: 8px;
                border: none;
            }

            .cart-badge {
                position: absolute;
                top: -6px;
                right: -15px;
                background-color: white;
                color:  black;
                border-radius: 50%;
                padding: 4px 10px;
                font-size: 15px;
                font-weight: bold;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            }

            /* Nội dung của cart (mặc định ẩn đi) */
            .cart-content {
                display: none;
                position: absolute;
                top: 40px;
                left: 0;
                background-color: #ffffff;
                padding: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 200px;
                border-radius: 8px;
            }

            /* Hiển thị nội dung khi hover vào giỏ hàng */
            .cart:hover .cart-content {
                display: block;
            }

            /* Tùy chỉnh nội dung bên trong */
            .cart-content p {
                margin: 5px 0;
                border-bottom: 1px solid #eee;
            }

        </style>
    </head>
    <header class="main-header">
        <div class="topbar">
            <div class="container">
                <div class="main-logo">
                    <a href="home" class="logo">
                        <img src="${pageContext.request.contextPath}/images/logo-dark.png" width="105" alt="">
                    </a>
                    <div class="mobile-nav__buttons">
                        <a href="home?site=about" ><i class="organik-icon-farmer"></i></a>
                        <div class="cart-container">
                            <a href="payment"><i class="organik-icon-shopping-cart"><span class="cart-badge">6</span></i></a>
                        </div>
                    </div><!-- /.mobile__buttons -->

                    <span class="fa fa-bars mobile-nav__toggler"></span>
                </div><!-- /.main-logo -->

                <div class="topbar__left">
                    <div class="topbar__social">
                        <a href="#" class="fab fa-twitter"></a>
                        <a href="#" class="fab fa-facebook-square"></a>
                        <a href="#" class="fab fa-instagram"></a>
                    </div><!-- /.topbar__social -->
                    <div class="topbar__info">
                        <i class="organik-icon-email"></i>
                        <p>Email <a href="#">haithangbip@gmail.com</a></p>
                    </div><!-- /.topbar__info -->
                </div><!-- /.topbar__left -->
                <div class="topbar__right">
                    <div class="topbar__info">
                        <i class="organik-icon-calling"></i>
                        <p>Phone <a href="#">0123456789</a></p>
                    </div><!-- /.topbar__info -->
                    <div class="topbar__buttons" style="gap: 15px">
                        <a href="home?site=about" ><i class="organik-icon-farmer"></i></a>
                        <div class="cart-container cart" id="cart_quantity">
                            <a href="payment">
                                <i class="organik-icon-shopping-cart">
                                    <span class="cart-badge" >
                                        <c:if test="${sessionScope.cart != null}">
                                            ${cart.getItems().size()}
                                        </c:if>
                                        <c:if test="${sessionScope.cart == null}">
                                            0
                                        </c:if>
                                    </span>
                                </i>
                            </a>
                            <div class="cart-content" id="cart-items">
                                <table>
                                    <c:forEach items="${sessionScope.cart.getItems()}" var="item">
                                        <tr>
                                            <td>
                                                <img src="${pageContext.request.contextPath}/${item.getProduct().getImage()}" alt="" style="width: 50px">
                                            </td>
                                            <td>
                                                <p>${item.getProduct().getProduct__name()} - ${item.getQuantity()}</p>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div><!-- /.topbar__buttons -->
                </div><!-- /.topbar__left -->

            </div><!-- /.container -->
        </div><!-- /.topbar -->
        <nav class="main-menu">
            <div class="container">
                <c:if test="${sessionScope.user == null}">
                    <div class="main-menu__login">
                        <a href="account?action=login"><i class="organik-icon-user"></i>Login</a>
                    </div><!-- /.main-menu__login -->
                    <div class="divider">/</div>
                    <div class="main-menu__login">
                        <a href="account?action=register">Register</a>
                    </div><!-- /.main-menu__login -->
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <div class="main-menu__login">
                        <c:if test="${sessionScope.user.isRole() == true}">
                            <a href="account"><i class="organik-icon-user"></i>Welcome ${sessionScope.user.getFullname()} !</a>
                        </c:if>
                        <c:if test="${sessionScope.user.isRole() == false}">
                            <a href="AdminController"><i class="organik-icon-user"></i>Welcome ${sessionScope.user.getFullname()} !</a>
                        </c:if>
                    </div><!-- /.main-menu__login -->
                </c:if>
                <ul class="main-menu__list">
                    <li>
                        <a href="home">Home</a>
                    </li>
                    <li>
                        <a href="home?site=about">About</a>
                    </li>
                    <li class="dropdown">
                        <a href="product">Shop</a>
                        <ul>
                            <li><a href="product">Shop</a></li>
                            <li><a href="productdetail">Product Details</a></li>
                        </ul>
                    </li>
                    <li><a href="home?site=contact">Contact</a></li>
                    <li><a href="payment">Cart</a></li>
                </ul>
                <c:if test="${sessionScope.user != null}">
                    <div class="main-menu__login">
                        <a href="account?action=logout"><i class="organik-icon-user-logout">🔓</i> Logout</a>
                    </div><!-- /.main-menu__login -->
                </c:if>    
            </div><!-- /.container -->
        </nav>
        <!-- /.main-menu -->
    </header>
</html>
