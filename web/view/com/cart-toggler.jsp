<%-- 
    Document   : cart-toggler
    Created on : Feb 25, 2025, 8:25:12 AM
    Author     : Tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="mini-cart">
            <div class="mini-cart__overlay mini-cart__toggler"></div>
            <div class="mini-cart__content">
                <div class="mini-cart__top">
                    <h3 class="mini-cart__title">Shopping Cart</h3>
                    <span class="mini-cart__close mini-cart__toggler"><i class="organik-icon-close"></i></span>
                </div><!-- /.mini-cart__top -->
                <div class="mini-cart__item">
                    <img src="${pageContext.request.contextPath}/images/products/cart-1-1.jpg" alt="">
                    <div class="mini-cart__item-content">
                        <div class="mini-cart__item-top">
                            <h3><a href="home?site=product-details">Banana</a></h3>
                            <p>$9.99</p>
                        </div><!-- /.mini-cart__item-top -->
                        <div class="quantity-box">
                            <button type="button" class="sub">-</button>
                            <input type="number" id="1" value="1" />
                            <button type="button" class="add">+</button>
                        </div>
                    </div><!-- /.mini-cart__item-content -->
                </div><!-- /.mini-cart__item -->
                <div class="mini-cart__item">
                    <img src="${pageContext.request.contextPath}/images/products/cart-1-2.jpg" alt="">
                    <div class="mini-cart__item-content">
                        <div class="mini-cart__item-top">
                            <h3><a href="home?site=product-details">Tomato</a></h3>
                            <p>$9.99</p>
                        </div><!-- /.mini-cart__item-top -->
                        <div class="quantity-box">
                            <button type="button" class="sub">-</button>
                            <input type="number" id="2" value="1" />
                            <button type="button" class="add">+</button>
                        </div>
                    </div><!-- /.mini-cart__item-content -->
                </div><!-- /.mini-cart__item -->
                <div class="mini-cart__item">
                    <img src="${pageContext.request.contextPath}/images/products/cart-1-3.jpg" alt="">
                    <div class="mini-cart__item-content">
                        <div class="mini-cart__item-top">
                            <h3><a href="home?site=product-details">Bread</a></h3>
                            <p>$9.99</p>
                        </div><!-- /.mini-cart__item-top -->
                        <div class="quantity-box">
                            <button type="button" class="sub">-</button>
                            <input type="number" id="3" value="1" />
                            <button type="button" class="add">+</button>
                        </div>
                    </div><!-- /.mini-cart__item-content -->
                </div><!-- /.mini-cart__item -->
                <a href="checkout" class="thm-btn mini-cart__checkout">Proceed To Checkout</a>
            </div><!-- /.mini-cart__content -->
        </div>
    </div>
</html>