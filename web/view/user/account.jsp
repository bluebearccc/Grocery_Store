<%-- 
    Document   : Account
    Created on : 7 thg 3, 2025, 11:32:53
    Author     : FPT
--%>

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
                    <div class="content">
                        <div id="orders" class="hidden">
                            <h2>Orders</h2>
                            <hr>
                            <div class="table-container">
                                <table>
                                    <tr>
                                        <th>Order</th>
                                        <th>Date</th>
                                        <th>Status</th>
                                        <th>Total</th>
                                        <th>Action</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Aug 22, 2018</td>
                                        <td>Pending</td>
                                        <td>$3000</td>
                                        <td><button>View</button></td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>July 22, 2018</td>
                                        <td>Approved</td>
                                        <td>$200</td>
                                        <td><button>View</button></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div id="accountDetails" class="hidden">
                            <h2>Account Details</h2>
                            <hr>
                            <div class="form-container">
                                <form>
                                    <div class="form-group">
                                        <input type="text" placeholder="First Name" required>
                                        <input type="text" placeholder="Last Name" required>
                                    </div>
                                    <input type="text" placeholder="Display Name" required>
                                    <input type="email" placeholder="Email" required>
                                    <input type="text" placeholder="Address" required>

                                    <h3>Password change</h3>
                                    <hr>
                                    <input type="password" placeholder="Current Password">
                                    <div class="form-group">
                                        <input type="password" placeholder="New Password">
                                        <input type="password" placeholder="Confirm Password">
                                    </div>
                                    <button type="submit">Save Changes</button>
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