<%-- 
    Document   : contact
    Created on : Mar 6, 2025, 12:47:58 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Contact Page || Oganik || HTML Template For Organic Stores</title>
        <!-- favicons Icons -->
        <link rel="apple-touch-icon" sizes="180x180" href="assets/images/favicons/apple-touch-icon.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="assets/images/favicons/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicons/favicon-16x16.png" />
        <link rel="manifest" href="assets/images/favicons/site.webmanifest" />
        <meta name="description" content="Agrikon HTML Template For Agriculture Farm & Farmers" />

        <!-- fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com/" />
        <link href="https://fonts.googleapis.com/css2?family=Homemade+Apple&amp;family=Abril+Fatface&amp;family=Rubik:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet" />


        <link rel="stylesheet" href="assets/vendors/bootstrap/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/vendors/bootstrap-select/bootstrap-select.min.css" />
        <link rel="stylesheet" href="assets/vendors/animate/animate.min.css" />
        <link rel="stylesheet" href="assets/vendors/fontawesome/css/all.min.css" />
        <link rel="stylesheet" href="assets/vendors/jarallax/jarallax.css" />
        <link rel="stylesheet" href="assets/vendors/organik-icon/organik-icons.css" />
        <link rel="stylesheet" href="assets/vendors/jquery-magnific-popup/jquery.magnific-popup.css" />
        <link rel="stylesheet" href="assets/vendors/nouislider/nouislider.min.css" />
        <link rel="stylesheet" href="assets/vendors/nouislider/nouislider.pips.css" />
        <link rel="stylesheet" href="assets/vendors/odometer/odometer.min.css" />
        <link rel="stylesheet" href="assets/vendors/swiper/swiper.min.css" />
        <link rel="stylesheet" href="assets/vendors/tiny-slider/tiny-slider.min.css" />

        <!-- template styles -->
        <link rel="stylesheet" href="assets/css/organik.css" />
    </head>

    <body>
        <jsp:include page="../com/preloader.jsp"></jsp:include><!-- /.preloader -->

            <div class="page-wrapper">
            <jsp:include page="../com/page-wrapper/main-header.jsp"></jsp:include><!-- /.main-header -->

                <div class="stricky-header stricked-menu main-menu">
                    <div class="sticky-header__content"></div><!-- /.sticky-header__content -->
                </div><!-- /.stricky-header -->
                <section class="page-header">
                    <div class="page-header__bg" style="background-image: url(assets/images/backgrounds/page-header-bg-1-1.jpg);"></div>
                    <!-- /.page-header__bg -->
                    <div class="container">
                        <h2>Contact</h2>
                        <ul class="thm-breadcrumb list-unstyled">
                            <li><a href="index-2.html">Home</a></li>
                            <li>/</li>
                            <li><span>Contact</span></li>
                        </ul><!-- /.thm-breadcrumb list-unstyled -->
                    </div><!-- /.container -->
                </section><!-- /.page-header -->


                <section class="contact-one">
                    <img src="assets/images/shapes/contact-bg-1-1.png" alt="" class="contact-one__shape-1">
                    <img src="assets/images/shapes/contact-bg-1-2.png" alt="" class="contact-one__shape-2">
                    <div class="container">
                        <div class="block-title text-center">
                            <div class="block-title__decor"></div><!-- /.block-title__decor -->
                            <p>Get in Touch With Us</p>
                            <h3>Do You’ve Any Question? <br>
                                Write us a Message</h3>
                        </div><!-- /.block-title -->
                        <form action="https://ninetheme.com/themes/html-templates/oganik/assets/inc/sendemail.php" class="contact-form-validated contact-one__form">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" name="name" placeholder="Your Name">
                                </div><!-- /.col-md-6 -->
                                <div class="col-md-6">
                                    <input type="text" placeholder="Email Address" name="email">
                                </div><!-- /.col-md-6 -->
                                <div class="col-md-6">
                                    <input type="text" placeholder="Phone Number" name="phone">
                                </div><!-- /.col-md-6 -->
                                <div class="col-md-6">
                                    <input type="text" placeholder="Subject" name="subject">
                                </div><!-- /.col-md-6 -->
                                <div class="col-md-12">
                                    <textarea placeholder="Write a Message" name="message"></textarea>
                                </div><!-- /.col-md-12 -->
                                <div class="col-md-12 text-center">
                                    <button type="submit" class="thm-btn">Send a Message</button>
                                </div><!-- /.col-md-12 -->
                            </div><!-- /.row -->
                        </form>
                    </div><!-- /.container -->
                </section><!-- /.contact-one -->

                <section class="contact-infos">
                    <div class="container">
                        <div class="thm-tiny__slider" id="contact-infos-box" data-tiny-options='{
                             "container": "#contact-infos-box",
                             "items": 1,
                             "slideBy": "page",
                             "gutter": 0,
                             "mouseDrag": true,
                             "autoplay": true,
                             "nav": false,
                             "controlsPosition": "bottom",
                             "controlsText": ["<i class=\"fa fa-angle-left\"></i>", "<i class=\"fa fa-angle-right\"></i>"],
                             "autoplayButtonOutput": false,
                             "responsive": {
                             "640": {
                             "items": 2,
                             "gutter": 30
                             },
                             "992": {
                             "gutter": 30,
                             "items": 3
                             },
                             "1200": {
                             "disable": true
                             }
                             }
                             }'>
                            <div>
                                <div class="contact-infos__single">
                                    <i class="organik-icon-location"></i>
                                    <h3>Visit Anytime</h3>
                                    <p>66 Broklyn Golden Street, <br>
                                        New York. USA</p>
                                </div><!-- /.contact-infos__single -->
                            </div>
                            <div>
                                <div class="contact-infos__single">
                                    <i class="organik-icon-email"></i>
                                    <h3>Send Email</h3>
                                    <p>
                                        <a href="mailto:needhelp@organik.com">needhelp@organik.com</a>
                                        <br>
                                        <a href="mailto:info@company.com">info@company.com</a>
                                    </p>
                                </div><!-- /.contact-infos__single -->
                            </div>
                            <div>
                                <div class="contact-infos__single">
                                    <i class="organik-icon-calling"></i>
                                    <h3>Call Center</h3>
                                    <p><a href="tel:92-666-888-0000">92 666 888 0000</a> <br>
                                        <a href="tel:666-000-6666">666 000 6666</a>
                                    </p>
                                </div><!-- /.contact-infos__single -->
                            </div>
                        </div>
                    </div><!-- /.container -->
                </section><!-- /.contact-infos -->

                <div class="google-map__default">
                    <iframe title="template google map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4562.753041141002!2d-118.80123790098536!3d34.152323469614075!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80e82469c2162619%3A0xba03efb7998eef6d!2sCostco+Wholesale!5e0!3m2!1sbn!2sbd!4v1562518641290!5m2!1sbn!2sbd" class="map__default" allowfullscreen></iframe>
                </div>
                <!-- /.google-map -->

            <jsp:include page="../com/page-wrapper/site-footer.jsp"></jsp:include><!-- /.site-footer -->

            </div><!-- /.page-wrapper -->


        <jsp:include page="../com/mobile-nav_wrapper.jsp"></jsp:include><!-- /.mobile-nav__wrapper -->

        <jsp:include page="../com/cart-toggler.jsp"></jsp:include><!-- /.cart-toggler -->

        <jsp:include page="../com/search-popup.jsp"></jsp:include><!-- /.search-popup -->

        <a href="#" data-target="html" class="scroll-to-target scroll-to-top"><i class="fa fa-angle-up"></i></a>


        <script src="assets/vendors/jquery/jquery-3.5.1.min.js"></script>
        <script src="assets/vendors/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="assets/vendors/jarallax/jarallax.min.js"></script>
        <script src="assets/vendors/jquery-ajaxchimp/jquery.ajaxchimp.min.js"></script>
        <script src="assets/vendors/jquery-appear/jquery.appear.min.js"></script>
        <script src="assets/vendors/jquery-circle-progress/jquery.circle-progress.min.js"></script>
        <script src="assets/vendors/jquery-magnific-popup/jquery.magnific-popup.min.js"></script>
        <script src="assets/vendors/jquery-validate/jquery.validate.min.js"></script>
        <script src="assets/vendors/nouislider/nouislider.min.js"></script>
        <script src="assets/vendors/odometer/odometer.min.js"></script>
        <script src="assets/vendors/swiper/swiper.min.js"></script>
        <script src="assets/vendors/tiny-slider/tiny-slider.min.js"></script>
        <script src="assets/vendors/wnumb/wNumb.min.js"></script>
        <script src="assets/vendors/wow/wow.js"></script>
        <script src="assets/vendors/isotope/isotope.js"></script>
        <script src="assets/vendors/countdown/countdown.min.js"></script>
        <!-- template js -->
        <script src="assets/js/organik.js"></script>
    </body>
</html>