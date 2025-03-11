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
    </head>
    <header class="main-header">
        <div class="topbar">
            <div class="container">
                <div class="main-logo">
                    <a href="home" class="logo">
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
                        <p>Email <a href="#">haithangbip@gmail.com</a></p>
                    </div><!-- /.topbar__info -->
                </div><!-- /.topbar__left -->
                <div class="topbar__right">
                    <div class="topbar__info">
                        <i class="organik-icon-calling"></i>
                        <p>Phone <a href="#">0123456789</a></p>
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
                <c:if test="${sessionScope.user == null}">
                    <div class="main-menu__login">
                        <a href="home?site=login"><i class="organik-icon-user"></i>Login</a>
                    </div><!-- /.main-menu__login -->
                    <div class="divider">/</div>
                    <div class="main-menu__login">
                        <a href="home?site=register">Register</a>
                    </div><!-- /.main-menu__login -->
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <div class="main-menu__login">
                        <c:if test="${sessionScope.user.isRole() == true}">
                            <a href="home?site=account"><i class="organik-icon-user"></i>Welcome ${user.getFullname()} !</a>
                        </c:if>
                        <c:if test="${sessionScope.user.isRole() == false}">
                            <a href="home?site=admin"><i class="organik-icon-user"></i>Welcome ${user.getFullname()} !</a>
                        </c:if>
                    </div><!-- /.main-menu__login -->
                </c:if>
                <ul class="main-menu__list">
                    <li>
                        <a href="home?site=home">Home</a>
                    </li>
                    <li>
                        <a href="home?site=about">About</a>
                    </li>
                    <li class="dropdown">
                        <a href="home?site=product">Shop</a>
                        <ul>
                            <li><a href="home?site=product">Shop</a></li>
                            <li><a href="home?site=product-details">Product Details</a></li>
                            <li><a href="home?site=cart">Cart Page</a></li>
                        </ul>
                    </li>
                    <li><a href="home?site=contact">Contact</a></li>
                </ul>
                <c:if test="${sessionScope.user != null}">
                    <div class="main-menu__login">
                        <a href="home?site=logout"><i class="organik-icon-user-logout">🔓</i> Logout</a>
                    </div><!-- /.main-menu__login -->
                </c:if>    
            </div><!-- /.container -->
        </nav>
        <!-- /.main-menu -->
    </header>
</html>
