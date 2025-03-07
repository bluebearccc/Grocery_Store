<%-- 
    Document   : about
    Created on : Mar 7, 2025, 11:45:53 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>About Page || Oganik</title>
        <!-- favicons Icons -->
        <link rel="apple-touch-icon" sizes="180x180" src="${pageContext.request.contextPath}/images/favicons/apple-touch-icon.png" />
        <link rel="icon" type="image/png" sizes="32x32" src="${pageContext.request.contextPath}/images/favicons/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="16x16" src="${pageContext.request.contextPath}/images/favicons/favicon-16x16.png" />
        <link rel="manifest" src="${pageContext.request.contextPath}/images/favicons/site.webmanifest" />
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
                    <h2>About Us</h2>
                    <ul class="thm-breadcrumb list-unstyled">
                        <li><a href="index-2.html">Home</a></li>
                        <li>/</li>
                        <li><span>About</span></li>
                    </ul><!-- /.thm-breadcrumb list-unstyled -->
                </div><!-- /.container -->
            </section><!-- /.page-header -->

            <section class="about-one">
                <img src="${pageContext.request.contextPath}/images/shapes/about-leaf-1-1.png" alt="" class="about-one__shape-1">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-lg-6">
                            <img src="${pageContext.request.contextPath}/images/resources/about-1-1.png" class="img-fluid" alt="">
                        </div><!-- /.col-md-12 -->
                        <div class="col-md-12 col-lg-6">
                            <div class="about-one__content">
                                <div class="block-title text-left">
                                    <div class="block-title__decor"></div><!-- /.block-title__decor -->
                                    <p>Get to Know</p>
                                    <h3>We’re Selling Quality
                                        Products</h3>
                                </div><!-- /.block-title -->
                                <p>There are many variations of passages of available but the majority have suffered alteration in
                                    some form, by injected humou or words even slightly believable.</p>
                                <p>There are many variations of passages of available but the majority have suffered alteration in
                                    some form, by injected humou or words even slightly believable.</p>
                                <div class="row">
                                    <div class="col-md-6 col-lg-6">
                                        <div class="about-one__box">
                                            <h3><i class="fa fa-check-circle"></i> Magnis Dis Nascet</h3>
                                            <p>Lorem ipsum is free do sit</p>
                                        </div><!-- /.about-one__box -->
                                    </div><!-- /.col-md-6 -->
                                    <div class="col-md-6 col-lg-6">
                                        <div class="about-one__box">
                                            <h3><i class="fa fa-check-circle"></i> Libero id Ege</h3>
                                            <p>Lorem ipsum is free do sit</p>
                                        </div><!-- /.about-one__box -->
                                    </div><!-- /.col-md-6 -->
                                </div><!-- /.row -->
                            </div><!-- /.about-one__content -->
                        </div><!-- /.col-md-12 col-lg-6 -->
                    </div><!-- /.row -->
                </div><!-- /.container -->
            </section><!-- /.about-one -->

            <div class="client-carousel ">
                <div class="container">
                    <div class="thm-swiper__slider swiper-container" data-swiper-options='{"spaceBetween": 140, "slidesPerView": 5, "autoplay": { "delay": 5000 }, "breakpoints": {
                         "0": {
                         "spaceBetween": 30,
                         "slidesPerView": 2
                         },
                         "375": {
                         "spaceBetween": 30,
                         "slidesPerView": 2
                         },
                         "575": {
                         "spaceBetween": 30,
                         "slidesPerView": 3
                         },
                         "767": {
                         "spaceBetween": 50,
                         "slidesPerView": 4
                         },
                         "991": {
                         "spaceBetween": 50,
                         "slidesPerView": 5
                         },
                         "1199": {
                         "spaceBetween": 100,
                         "slidesPerView": 5
                         }
                         }}'>
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/resources/brand-1-1.png" alt="">
                            </div><!-- /.swiper-slide -->
                        </div><!-- /.swiper-wrapper -->
                    </div><!-- /.thm-swiper__slider -->
                </div><!-- /.container -->
            </div><!-- /.client-carousel -->

            <section class="video-one jarallax" data-jarallax data-speed="0.3" data-imgPosition="50% 50%">
                <img src="${pageContext.request.contextPath}/images/backgrounds/video-bg-1-1.jpg" alt="" class="jarallax-img">
                <div class="container text-center">
                    <a href="https://www.youtube.com/watch?v=u5l4cdUjau4" class="video-popup">
                        <i class="fa fa-play"></i>
                    </a><!-- /.video-popup -->
                    <h3><span>Get</span> Always Fresh <br>
                        Organic Food</h3>
                </div><!-- /.container -->
            </section><!-- /.video-one -->

            <section class="team-one">
                <img src="${pageContext.request.contextPath}/images/shapes/team-shape-1.png" alt="" class="team-one__shape-1">
                <img src="${pageContext.request.contextPath}/images/shapes/team-shape-2.png" alt="" class="team-one__shape-2">
                <div class="container">
                    <div class="block-title text-center">
                        <div class="block-title__decor"></div><!-- /.block-title__decor -->
                        <p>Professional People</p>
                        <h3>Meet the Team</h3>
                    </div><!-- /.block-title -->
                    <div class="row">
                        <div class="col-md-6 col-lg-3">
                            <div class="team-card">
                                <div class="team-card__image">
                                    <img src="${pageContext.request.contextPath}/images/team/team-1-1.png" alt="">
                                </div><!-- /.team-card__image -->
                                <div class="team-card__content">
                                    <h3>Ray Luna</h3>
                                    <div class="team-card__social">
                                        <a href="#"><i class="fab fa-twitter"></i></a>
                                        <a href="#"><i class="fab fa-facebook-square"></i></a>
                                        <a href="#"><i class="fab fa-instagram"></i></a>
                                    </div><!-- /.team-card__social -->
                                </div><!-- /.team-card__content -->
                            </div><!-- /.team-card -->
                        </div><!-- /.col-md-6 col-lg-3 -->
                        <div class="col-md-6 col-lg-3">
                            <div class="team-card">
                                <div class="team-card__image">
                                    <img src="${pageContext.request.contextPath}/images/team/team-1-2.png" alt="">
                                </div><!-- /.team-card__image -->
                                <div class="team-card__content">
                                    <h3>Ora McLaughlin</h3>
                                    <div class="team-card__social">
                                        <a href="#"><i class="fab fa-twitter"></i></a>
                                        <a href="#"><i class="fab fa-facebook-square"></i></a>
                                        <a href="#"><i class="fab fa-instagram"></i></a>
                                    </div><!-- /.team-card__social -->
                                </div><!-- /.team-card__content -->
                            </div><!-- /.team-card -->
                        </div><!-- /.col-md-6 col-lg-3 -->
                        <div class="col-md-6 col-lg-3">
                            <div class="team-card">
                                <div class="team-card__image">
                                    <img src="${pageContext.request.contextPath}/images/team/team-1-3.png" alt="">
                                </div><!-- /.team-card__image -->
                                <div class="team-card__content">
                                    <h3>Peter Ramsey</h3>
                                    <div class="team-card__social">
                                        <a href="#"><i class="fab fa-twitter"></i></a>
                                        <a href="#"><i class="fab fa-facebook-square"></i></a>
                                        <a href="#"><i class="fab fa-instagram"></i></a>
                                    </div><!-- /.team-card__social -->
                                </div><!-- /.team-card__content -->
                            </div><!-- /.team-card -->
                        </div><!-- /.col-md-6 col-lg-3 -->
                        <div class="col-md-6 col-lg-3">
                            <div class="team-card">
                                <div class="team-card__image">
                                    <img src="${pageContext.request.contextPath}/images/team/team-1-4.png" alt="">
                                </div><!-- /.team-card__image -->
                                <div class="team-card__content">
                                    <h3>Eric Miller</h3>
                                    <div class="team-card__social">
                                        <a href="#"><i class="fab fa-twitter"></i></a>
                                        <a href="#"><i class="fab fa-facebook-square"></i></a>
                                        <a href="#"><i class="fab fa-instagram"></i></a>
                                    </div><!-- /.team-card__social -->
                                </div><!-- /.team-card__content -->
                            </div><!-- /.team-card -->
                        </div><!-- /.col-md-6 col-lg-3 -->
                    </div><!-- /.row -->
                </div><!-- /.container -->
            </section><!-- /.team-one -->

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
