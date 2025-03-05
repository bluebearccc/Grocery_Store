<%-- 
    Document   : main-header
    Created on : Mar 6, 2025, 1:26:57 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <header class="main-header">
        <div class="topbar">
            <div class="container">
                <div class="main-logo">
                    <a href="index-2.html" class="logo">
                        <img src="${pageContext.request.contextPath}/images/logo-dark.png" width="105" alt="">
                    </a>
                    <div class="mobile-nav__buttons">
                        <a href="#" class="search-toggler"><i class="organik-icon-magnifying-glass"></i></a>
                        <a href="#" class="mini-cart__toggler"><i class="organik-icon-shopping-cart"></i></a>
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
                        <p>Email <a href="mailto:info@organik.com">info@organik.com</a></p>
                    </div><!-- /.topbar__info -->
                </div><!-- /.topbar__left -->
                <div class="topbar__right">
                    <div class="topbar__info">
                        <i class="organik-icon-calling"></i>
                        <p>Phone <a href="tel:+92-666-888-0000">92 666 888 0000</a></p>
                    </div><!-- /.topbar__info -->
                    <div class="topbar__buttons">
                        <a href="#" class="search-toggler"><i class="organik-icon-magnifying-glass"></i></a>
                        <a href="#" class="mini-cart__toggler"><i class="organik-icon-shopping-cart"></i></a>
                    </div><!-- /.topbar__buttons -->
                </div><!-- /.topbar__left -->

            </div><!-- /.container -->
        </div><!-- /.topbar -->
        <nav class="main-menu">
            <div class="container">
                <div class="main-menu__login">
                    <a href="#"><i class="organik-icon-user"></i>Login / Register</a>
                </div><!-- /.main-menu__login -->
                <ul class="main-menu__list">
                    <li>
                        <a href="index-2.html">Home</a>
                    </li>
                    <li>
                        <a href="about.html">About</a>
                    </li>
                    <li class="dropdown">
                        <a href="view/homepage/product.jsp">Shop</a>
                        <ul>
                            <li><a href="view/homepage/product.jsp">Shop</a></li>
                            <li><a href="product-details.html">Product Details</a></li>
                            <li><a href="cart.html">Cart Page</a></li>
                            <li><a href="checkout.html">Checkout</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="news.html">News</a>
                        <ul>
                            <li><a href="news.html">News</a></li>
                            <li><a href="news-details.html">News Details</a></li>
                        </ul>
                    </li>
                    <li><a href="contact.html">Contact</a></li>
                </ul>
                <div class="main-menu__language">
                    <img src="${pageContext.request.contextPath}/images/resources/flag-1-1.jpg" alt="">
                    <label class="sr-only" for="language-select">select language</label>
                    <!-- /#language-select.sr-only -->
                    <select class="selectpicker" id="language-select-header">
                        <option value="english">English</option>
                        <option value="arabic">Arabic</option>
                    </select>
                </div><!-- /.main-menu__language -->
            </div><!-- /.container -->
        </nav>
        <!-- /.main-menu -->
    </header>
</html>
