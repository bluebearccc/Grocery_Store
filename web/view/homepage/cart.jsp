<%-- 
    Document   : cart
    Created on : Mar 6, 2025, 12:46:39 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Cart Page || Oganik</title>
        <!-- favicons Icons -->
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/images/favicons/apple-touch-icon.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/images/favicons/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicons/favicon-16x16.png" />
        <link rel="manifest" href="${pageContext.request.contextPath}/images/favicons/site.webmanifest" />
        <meta name="description" content="Agriculture Farm & Farmers" />

        <!-- fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com/" />
        <link href="https://fonts.googleapis.com/css2?family=Homemade+Apple&amp;family=Abril+Fatface&amp;family=Rubik:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet" />


        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/vendors/bootstrap/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/vendors/bootstrap-select/bootstrap-select.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/vendors/animate/animate.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/vendors/fontawesome/css/all.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/vendors/jarallax/jarallax.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/vendors/organik-icon/organik-icons.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/vendors/jquery-magnific-popup/jquery.magnific-popup.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/vendors/nouislider/nouislider.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/vendors/nouislider/nouislider.pips.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/vendors/odometer/odometer.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/vendors/swiper/swiper.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/vendors/tiny-slider/tiny-slider.min.css" />

        <!-- template styles -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/organik.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css" />
    </head>

    <body>
        <jsp:include page="../com/preloader.jsp"></jsp:include><!-- /.preloader -->

            <div class="page-wrapper">

            <jsp:include page="../com/page-wrapper/main-header.jsp"></jsp:include><!-- /.main-header -->

                <div class="stricky-header stricked-menu main-menu">
                    <div class="sticky-header__content"></div><!-- /.sticky-header__content -->
                </div><!-- /.stricky-header -->

                <section class="page-header">
                    <div class="page-header__bg" style="background-image: url(${pageContext.request.contextPath}/images/backgrounds/page-header-bg-1-1.jpg);"></div>
                <!-- /.page-header__bg -->
                <div class="container">
                    <h2>Cart</h2>
                    <ul class="thm-breadcrumb list-unstyled">
                        <li><a href="home">Home</a></li>
                        <li>/</li>
                        <li><span>Cart</span></li>
                    </ul><!-- /.thm-breadcrumb list-unstyled -->
                </div><!-- /.container -->
            </section><!-- /.page-header -->

            <section class="cart-page" id="tableContent">
                <div class="container">
                    <div class="table-responsive">
                        <table class="table cart-table">
                            <thead>
                                <tr>
                                    <th>Item</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${sessionScope.cart.getItems()}" var="item">
                                    <tr>
                                        <td>
                                            <div class="product-box">
                                                <img src="${pageContext.request.contextPath}/${item.getProduct().getImage()}" alt="">
                                                <h3><a href="home?site=product-details&productId=${item.getProduct().getProduct__id()}">${item.getProduct().getProduct__name()}</a></h3>
                                            </div><!-- /.product-box -->
                                        </td>
                                        <td>$${item.getPrice()}</td>
                                        <td>
                                            <div>
                                                <button type="button" class="compute" onclick="decreaseQuantity(this)">-</button>
                                                <input type="number" class="productQuantity" name="productQuantity" value="${item.getQuantity()}"  style="    width: 50px;
                                                       text-align: center;
                                                       border: none;
                                                       outline: none;
                                                       font-size: 20px;
                                                       background-color: #f9f9f9;"/>
                                                <button type="button" class="compute" onclick="increaseQuantity(this)">+</button>
                                            </div>
                                        </td>
                                        <td>
                                            ${item.getPrice() * item.getQuantity()}
                                        </td>
                                        <td>
                                            <input type="hidden" name="productId" value="${item.getProduct().getProduct__id()}">
                                            <button onclick="deleteProduct(this)" style="background: none; border: none"><i class="organik-icon-close remove-icon"></i></button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>

                        </table><!-- /.table -->
                    </div><!-- /.table-responsive -->
                    <div class="row">
                        <div class="col-lg-4">
                            <ul id="total-money" class="cart-total list-unstyled">
                                <li>
                                    <span>Subtotal</span>
                                    <span>$${cart.getTotalMoney()} USD</span>
                                </li>
                                <li>
                                    <span>Free Ship</span>
                                    <span>$2.0 USD</span>
                                </li>
                                <li>
                                    <span>Total</span>
                                    <span>$${cart.getTotalMoney() + 2} USD</span>
                                </li>
                            </ul><!-- /.cart-total -->
                            <div class="button-box">
                                <button onclick="update()" class="thm-btn">Update</button><!-- /.thm-btn -->
                                <button onclick="checkout()" class="thm-btn">Checkout</button><!-- /.thm-btn -->
                            </div><!-- /.button-box -->
                        </div><!-- /.col-lg-4 -->
                    </div><!-- /.row -->
                </div><!-- /.container -->
            </section><!-- /.cart-page -->

            <jsp:include page="../com/page-wrapper/site-footer.jsp"></jsp:include><!-- /.site-footer -->

            </div><!-- /.page-wrapper -->

        <jsp:include page="../com/mobile-nav_wrapper.jsp"></jsp:include><!-- /.mobile-nav__wrapper -->

        <jsp:include page="../com/cart-toggler.jsp"></jsp:include><!-- /.cart-toggler -->

        <jsp:include page="../com/search-popup.jsp"></jsp:include><!-- /.search-popup -->

            <a href="#" data-target="html" class="scroll-to-target scroll-to-top"><i class="fa fa-angle-up"></i></a>


            <script src="${pageContext.request.contextPath}/js/vendors/jquery/jquery-3.5.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/jarallax/jarallax.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/jquery-ajaxchimp/jquery.ajaxchimp.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/jquery-appear/jquery.appear.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/jquery-circle-progress/jquery.circle-progress.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/jquery-magnific-popup/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/jquery-validate/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/nouislider/nouislider.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/odometer/odometer.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/swiper/swiper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/tiny-slider/tiny-slider.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/wnumb/wNumb.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/wow/wow.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/isotope/isotope.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/countdown/countdown.min.js"></script>
        <!-- template js -->
        <script src="${pageContext.request.contextPath}/js/organik.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>


                                    function increaseQuantity(button) {
                                        let input = button.parentElement.querySelector('input[name="productQuantity"]');
                                        input.value = parseInt(input.value) + 1;
                                    }

                                    function decreaseQuantity(button) {
                                        let input = button.parentElement.querySelector('input[name="productQuantity"]');
                                        if (parseInt(input.value) > 1) {
                                            input.value = parseInt(input.value) - 1;
                                        }
                                    }

                                    function deleteProduct(e) {
                                        let td = e.closest('td');
                                        let product_ID = td.querySelector("input[name='productId']").value;
                                        $.ajax({
                                            url: '/Grocery_Store/home?',
                                            method: 'POST',
                                            data: {
                                                site: "payment",
                                                action: "delete",
                                                productId: product_ID
                                            },
                                            success: function (response) {
                                                let content = document.getElementById('tableContent');
                                                content.innerHTML = response;
                                                updateSmallCart();
                                            },
                                            error: function (xhr) {
                                                console.error('Error:', xhr.status, xhr.statusText);
                                            }
                                        });
                                    }

                                    function checkout() {
                                        let quantities = document.querySelectorAll('input[name="productQuantity"]');
                                        let productId = document.querySelectorAll('input[name="productId"]');
                                        if (quantities.length !== 0 || productId.length !== 0) {
                                            $.ajax({
                                                url: '/Grocery_Store/home?',
                                                method: 'POST',
                                                data: {
                                                    site: "payment",
                                                    action: "checkout"
                                                },
                                                success: function (response) {
                                                    let content = document.getElementById('tableContent');
                                                    content.innerHTML = response;
                                                    updateSmallCart();
                                                },
                                                error: function (xhr) {
                                                    console.error('Error:', xhr.status, xhr.statusText);
                                                }
                                            });
                                        }
                                    }

                                    function update() {
                                        let quantities = document.querySelectorAll('input[name="productQuantity"]');
                                        let productId = document.querySelectorAll('input[name="productId"]');
                                        let cart = [];
                                        if (quantities.length !== 0 && productId.length !== 0) {
                                            productId.forEach((id, index) => {
                                                let pId = id.value;
                                                let quantity = quantities[index].value;
                                                cart.push({pId, quantity});
                                            });

                                            let params = new URLSearchParams();
                                            cart.forEach(item => {
                                                params.append("productId", item.pId);
                                                params.append("quantity", item.quantity);
                                            });

                                            console.log(params.toString());
                                            $.ajax({
                                                url: '/Grocery_Store/home?' + params.toString(),
                                                method: 'POST',
                                                data: {
                                                    site: "payment",
                                                    action: "update"
                                                },
                                                success: function (response) {
                                                    let content = document.getElementById('tableContent');
                                                    content.innerHTML = response;
                                                    updateSmallCart();
                                                },
                                                error: function (xhr) {
                                                    console.error('Error:', xhr.status, xhr.statusText);
                                                }
                                            });
                                        }
                                    }

                                    function updateSmallCart() {
                                        $.ajax({
                                            url: '/Grocery_Store/home?',
                                            method: 'POST',
                                            data: {
                                                site: "payment",
                                                action: "updateSmallCart"
                                            },
                                            success: function (response) {
                                                let cart_quantity = document.getElementById('cart_quantity');
                                                cart_quantity.innerHTML = response;
                                            },
                                            error: function (xhr) {
                                                console.error('Error:', xhr.status, xhr.statusText);
                                            }
                                        });
                                    }

        </script>
    </body>
</html>
