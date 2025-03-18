<%-- 
    Document   : Account
    Created on : 7 thg 3, 2025, 11:32:53
    Author     : FPT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Account Details</title>
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/images/favicons/apple-touch-icon.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/images/favicons/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicons/favicon-16x16.png" />
        <link rel="manifest" href="${pageContext.request.contextPath}/images/favicons/site.webmanifest" />
        <meta name="description" content="Agrikon HTML Template For Agriculture Farm & Farmers" />

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

        <style>
            .body2 {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
            }
            .sidebar {
                width: 300px;
                background: #f8f8f8;
                padding: 20px;
                height: 100vh;
            }
            .sidebar a {
                display: block;
                padding: 12px;
                margin-bottom: 10px;
                text-decoration: none;
                color: black;
                background: #ddd;
                border-radius: 5px;
                text-align: center;
            }
            .sidebar a.active {
                background: #5CB46F;
                color: white;
            }
            .content {
                flex-grow: 1;
                padding: 20px;
                background: #fff;
            }
            .hidden {
                display: none;
            }
            .table-container {
                width: 100%;
                overflow-x: auto;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 12px;
                text-align: left;
            }
            th {
                background-color: #f4f4f4;
            }
            .form-container {
                margin-top: 20px;
                width: 95%;
            }
            .form-container input {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1.25px solid #ddd;
                border-radius: 10px;
            }
            .form-container button {
                background: #5CB46F;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                width: 100%;
            }
            .form-group {
                display: flex;
                justify-content: space-between;
                margin-bottom: 2px;
            }
            .form-group input {
                width: 48%;
                padding: 10px;
                border: 1.25px solid #ccc;
                border-radius: 10px;
                color: gray;
            }
            h3{
                padding-top: 30px;
            }

            h2{
                padding-top: 20px
            }

            input{
                color: gray;
                background-color: #F9F9F9;
            }

            .user-dashboard {
                width: 100%;
                max-width: 600px;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 12px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                font-family: Arial, sans-serif;
            }

            .user-info {
                display: flex;
                align-items: center;
                gap: 20px;
            }

            .user-avatar {
                width: 100px;
                height: 100px;
                border-radius: 50%;
                object-fit: cover;
                border: 3px solid #ddd;
            }

            .user-details h2 {
                font-size: 24px;
                color: #333;
                margin: 0;
            }

            .user-details p {
                font-size: 16px;
                color: #777;
                margin: 4px 0;
            }

            .edit-btn {
                margin-top: 10px;
                padding: 8px 16px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                transition: background 0.3s ease;
            }

            .edit-btn:hover {
                background-color: #45a049;
            }
        </style>

    </head>

    <body>
        <jsp:include page="../com/preloader.jsp"></jsp:include><!-- /.preloader -->

            <div class="page-wrapper">
            <jsp:include page="../com/page-wrapper/main-header.jsp"></jsp:include><!-- /.main-header -->

                <div class="stricky-header stricked-menu main-menu">
                    <div class="sticky-header__content"></div><!-- /.sticky-header__content -->
                </div><!-- /.stricky-header -->

                <div class = "body2">

                    <div class="sidebar">
                        <a href="#" onclick="showSection('orders')" id="ordersTab">Orders</a>
                        <a href="#" onclick="showSection('accountDetails')" id="accountTab">Account Details</a>
                    </div>
                    <div class="user-dashboard">
                        <div class="user-info">
                            <img src="${pageContext.request.contextPath}/images/user.png" alt="User Avatar" class="user-avatar">
                        <div class="user-details">
                            <h2>${sessionScope.user.getFullname()}</h2>
                            <p>${sessionScope.user.getUsername()}</p>
                            <p>${sessionScope.user.getEmail()}</p>
                            <p>${sessionScope.user.getAddress()}</p>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div id="orders" class="hidden">
                        <h2>Orders</h2>
                        <hr>
                        <div class="table-container">
                            <table>
                                <tr>
                                    <th>Date</th>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Unit Price</th>
                                    <th>Total</th>
                                </tr>
                                <c:forEach items="${AccountOrderList}" var="acc">
                                    <tr>
                                        <td>${acc.order__date}</td>
                                        <td>${acc.product__name}</td>
                                        <td>${acc.quantity}</td>
                                        <td>$${acc.unit__price}</td>
                                        <td>$${acc.unit__price * acc.quantity}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                    <div id="accountDetails" class="hidden">
                        <h2>Account Details</h2>
                        <hr>
                        <div class="form-container">
                            <form action="home" method="POST">
                                <input type="hidden" name="site" value="alterinfo">
                                <input type="hidden" name="id" value="${sessionScope.user.getUser__id()}">
                                <div class="form-group">
                                    <input type="text" placeholder="Fullname" name="fullname" value="${sessionScope.user.getFullname()}" required>
                                    <input type="text" placeholder="Username" name="username" value="${sessionScope.user.getUsername()}" required readonly>
                                </div>
                                <input type="text" placeholder="Phone" name="phone" required value="${sessionScope.user.getPhone()}">
                                <input type="email" placeholder="Email" name="email" required value="${sessionScope.user.getEmail()}">
                                <input type="text" placeholder="Address" name="address" required value="${sessionScope.user.getAddress()}">

                                <h3>Password</h3>
                                <hr>
                                <div class="form-group">
                                    <input type="password" name="newpassword" placeholder="Password" value="${sessionScope.user.getPassword()}">
                                    <input type="password" name="newpasswordconfirm" placeholder="Confirm Password">
                                </div>
                                <P style="color: red; text-align: center">${error}</P>
                                <button type="submit" onclick="this.closest('form').submit()">Save Changes</button>
                            </form>
                        </div>
                    </div>
                </div>
                <script>
                    function showSection(section) {
                        document.getElementById('orders').classList.add('hidden');
                        document.getElementById('accountDetails').classList.add('hidden');
                        document.getElementById(section).classList.remove('hidden');

                        document.getElementById('ordersTab').classList.remove('active');
                        document.getElementById('accountTab').classList.remove('active');

                        if (section === 'orders') {
                            document.getElementById('ordersTab').classList.add('active');
                        } else {
                            document.getElementById('accountTab').classList.add('active');
                        }
                    }

                </script>
            </div>
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

    </body>
</html>