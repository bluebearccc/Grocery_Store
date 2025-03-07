<%-- 
    Document   : Account
    Created on : 7 thg 3, 2025, 11:32:53
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
            .container-account {
                max-width: 680px;
                margin: 50px auto;
                padding: 30px;
                background: #fff;
                border-radius: 10px;
                box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.4);
                font-family: 'Rubik', sans-serif;
            }

            .container-account h2,
            .container-account h3 {
                font-weight: 500;
                color: #333;
                margin-bottom: 20px;
            }

            .container-account form {
                display: flex;
                flex-direction: column;
            }

            .container-account input {
                width: 100%;
                padding: 12px;
                margin-bottom: 15px;
                border: 1.5px solid #ddd;
                border-radius: 5px;
                font-size: 16px;
            }

            .container-account .input-group {
                display: flex;
                gap: 24px;
            }

            .container-account .input-group input {
                width: 48%;
            }

            .container-account .btn-save {
                width: 100%;
                background: #78be20;
                color: white;
                padding: 14px;
                border: none;
                border-radius: 2px;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                transition: 0.3s;
            }

            .container-account .btn-save:hover {
                background: #5fa416;
            }

            .container-account input::placeholder {
                color: #aaa;
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
            </head>

            <body>

                <div class="container-account">
                    <h2>Account Details</h2>
                    <form action="updateAccount.jsp" method="post">
                        <input type="text" name="fullname" placeholder="Full Name" required>
                        <input type="text" name="username" placeholder="User Name" required>
                        <input type="email" name="email" placeholder="Email Address" required>
                        <input type="text" name="address" placeholder="Address" required>
                        <input type="text" name="phone" placeholder="Phone" required>

                        <h3>Password change</h3>
                        <input type="password" name="currentPassword" placeholder="Current Password">
                        <div class="input-group">
                            <input type="password" name="newPassword" placeholder="New Password">
                            <input type="password" name="confirmPassword" placeholder="Confirm Password">
                        </div>

                        <button type="submit" class="btn-save">SAVE CHANGES</button>
                    </form>
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

