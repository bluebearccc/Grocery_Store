<%-- 
    Document   : home.jsp
    Created on : Feb 23, 2025, 10:19:00 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Home || Oganik</title>
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
    </head>

    <body>
        <jsp:include page="../com/preloader.jsp"></jsp:include><!-- /.preloader -->

            <div class="page-wrapper">
            <jsp:include page="../com/page-wrapper/main-header.jsp"></jsp:include><!-- /.main-header -->

                <div class="stricky-header stricked-menu main-menu">
                    <div class="sticky-header__content"></div><!-- /.sticky-header__content -->
                </div><!-- /.stricky-header -->

                <section class="main-slider">
                    <div class="swiper-container thm-swiper__slider" data-swiper-options='{
                         "slidesPerView": 1,
                         "loop": true,
                         "effect": "fade",
                         "autoplay": {
                         "delay": 5000
                         },
                         "navigation": {
                         "nextEl": "#main-slider__swiper-button-next",
                         "prevEl": "#main-slider__swiper-button-prev"
                         }
                         }'>
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="image-layer" style="background-image: url(${pageContext.request.contextPath}/images/main-slider/main-slider-1-1.jpg);">
                            </div>
                            <!-- /.image-layer -->
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-12 col-lg-12 text-center">
                                        <h2><span>Organic</span> <br>
                                            Food Market</h2>
                                        <a href="product" class=" thm-btn">Order Now</a>
                                        <!-- /.thm-btn dynamic-radius -->
                                    </div><!-- /.col-lg-7 text-right -->
                                </div><!-- /.row -->
                            </div><!-- /.container -->
                        </div><!-- /.swiper-slide -->
                        <div class="swiper-slide">
                            <div class="image-layer" style="background-image: url(${pageContext.request.contextPath}/images/main-slider/main-slider-1-2.jpg);">
                            </div>
                            <!-- /.image-layer -->
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-12 col-lg-12 text-center">
                                        <h2><span>Organic</span> <br>
                                            Food Market</h2>
                                        <a href="product" class=" thm-btn">Order Now</a>
                                        <!-- /.thm-btn dynamic-radius -->
                                    </div><!-- /.col-lg-7 text-right -->
                                </div><!-- /.row -->
                            </div><!-- /.container -->
                        </div><!-- /.swiper-slide -->
                    </div><!-- /.swiper-wrapper -->

                    <!-- If we need navigation buttons -->
                    <div class="main-slider__nav">
                        <div class="swiper-button-prev" id="main-slider__swiper-button-next"><i class="organik-icon-left-arrow"></i></div>
                        <div class="swiper-button-next" id="main-slider__swiper-button-prev"><i class="organik-icon-right-arrow"></i></div>
                    </div><!-- /.main-slider__nav -->

                </div><!-- /.swiper-container thm-swiper__slider -->
            </section><!-- /.main-slider -->

            <section class="feature-box">
                <div class="container">
                    <div class="inner-container fadeInUp" data-wow-duration="1500ms" style="display: flex; justify-content: space-around">
                        <div>
                            <div class="feature-box__single">
                                <i class="organik-icon-global-shipping feature-box__icon"></i>
                                <div class="feature-box__content">
                                    <h3>Return Policy</h3>
                                </div><!-- /.feature-box__content -->
                            </div><!-- /.feature-box__single -->
                        </div>
                        <div>
                            <div class="feature-box__single">
                                <i class="organik-icon-delivery-truck feature-box__icon"></i>
                                <div class="feature-box__content">
                                    <h3>Free Shipping</h3>
                                </div><!-- /.feature-box__content -->
                            </div><!-- /.feature-box__single -->
                        </div>
                        <div>
                            <div class="feature-box__single">
                                <i class="organik-icon-online-store feature-box__icon"></i>
                                <div class="feature-box__content">
                                    <h3>Store Locator</h3>
                                </div><!-- /.feature-box__content -->
                            </div><!-- /.feature-box__single -->
                        </div>
                    </div><!-- /.inner-container -->
                </div><!-- /.container -->
            </section><!-- /.feature-box -->

            <section class="new-products">
                <img src="${pageContext.request.contextPath}/images/shapes/new-product-shape-1.png" alt="" class="new-products__shape-1">
                <div class="container">
                    <div class="new-products__top">
                        <div class="block-title ">
                            <div class="block-title__decor"></div><!-- /.block-title__decor -->
                            <p>Recently Added</p>
                            <h3>New Products</h3>
                        </div><!-- /.block-title -->

                    </div><!-- /.new-products__top -->
                    <div class="row filter-layout">
                        <c:forEach items="${ProductList}" var="p">
                            <div class="col-lg-4 col-md-6 filter-item dairy">
                                <div class="product-card__two">
                                    <div class="product-card__two-image">
                                        <img src="${pageContext.request.contextPath}/${p.getImage()}" alt="">
                                        <div class="product-card__two-image-content">
                                            <a href="productdetail&productId=${p.getProduct__id()}"><i class="organik-icon-visibility"></i></a>
                                        </div><!-- /.product-card__two-image-content -->
                                    </div><!-- /.product-card__two-image -->
                                    <div class="product-card__two-content">
                                        <h3><a href="productdetail&productId=${p.getProduct__id()}">${p.getProduct__name()}</a></h3>
                                        <p>$${p.getUnit__price()}</p>
                                    </div><!-- /.product-card__two-content -->
                                </div><!-- /.product-card__two -->
                            </div><!-- /.col-lg-4 -->
                        </c:forEach>
                    </div><!-- /.row -->
                </div><!-- /.container -->
            </section><!-- /.new-products -->

            <section class="offer-banner">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 wow fadeInLeft" data-wow-duration="1500ms" data-wow-delay="0ms">
                            <div class="offer-banner__box" style="background-image: url(${pageContext.request.contextPath}/images/resources/offer-banner-1-1.jpg);">
                                <div class="offer-banner__content">
                                    <h3><span>100%</span> <br>Organic</h3>
                                    <p>Quality Organic Food Store</p>
                                    <a href="product" class="thm-btn">Order Now</a><!-- /.thm-btn -->
                                </div><!-- /.offer-banner__content -->
                            </div><!-- /.offer-banner__box -->
                        </div><!-- /.col-md-6 -->
                        <div class="col-md-6 wow fadeInRight" data-wow-duration="1500ms" data-wow-delay="100ms">
                            <div class="offer-banner__box" style="background-image: url(${pageContext.request.contextPath}/images/resources/offer-banner-1-2.jpg);">
                                <div class="offer-banner__content">
                                    <h3><span>100%</span> <br>Organic</h3>
                                    <p>Quality Organic Food Store</p>
                                    <a href="product" class="thm-btn">Order Now</a><!-- /.thm-btn -->
                                </div><!-- /.offer-banner__content -->
                            </div><!-- /.offer-banner__box -->
                        </div><!-- /.col-md-6 -->
                    </div><!-- /.row -->
                </div><!-- /.container -->
            </section><!-- /.offer-banner -->

            <section class="call-to-action">
                <img src="${pageContext.request.contextPath}/images/shapes/call-shape-1.png" alt="" class="call-to-action__shape-1">
                <img src="${pageContext.request.contextPath}/images/shapes/call-shape-2.png" alt="" class="call-to-action__shape-2 wow fadeInLeft" data-wow-duration="1500ms">
                <h2 class="floated-text">Organic</h2><!-- /.floated-text -->
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-xl-6 clearfix">
                            <img src="${pageContext.request.contextPath}/images/resources/call-1-1.jpg" class="call-to-action__image" alt="">
                        </div><!-- /.col-md-12 col-lg-12 col-xl-12 -->
                        <div class="col-md-12 col-lg-12 col-xl-6 clearfix">
                            <div class="call-to-action__content">
                                <div class="block-title text-left">
                                    <div class="block-title__decor" style="background-image: url(${pageContext.request.contextPath}/images/shapes/leaf-2-1.png);"></div>
                                    <!-- /.block-title__decor -->
                                    <p>Shopping Store</p>
                                    <h3>Organic Food Only</h3>
                                </div><!-- /.block-title -->
                                <p>There are many variations of passages of lorem ipsum available but the majority have suffered
                                    alteration in some form by injected humor or random word.</p>
                                <div class="call-to-action__wrap">
                                    <div class="row no-gutters">
                                        <div class="col-md-6">
                                            <div class="call-to-action__box">
                                                <i class="organik-icon-farmer"></i>
                                                <h3>Professional
                                                    Farmers</h3>
                                            </div><!-- /.call-to-action__box -->
                                        </div><!-- /.col-md-6 -->
                                        <div class="col-md-6">
                                            <div class="call-to-action__box">
                                                <i class="organik-icon-farm"></i>
                                                <h3>Solution
                                                    for Farming</h3>
                                            </div><!-- /.call-to-action__box -->
                                        </div><!-- /.col-md-6 -->
                                    </div><!-- /.row -->
                                </div><!-- /.call-to-action__wrap -->
                                <a href="product" class="thm-btn">Order Now</a><!-- /.thm-btn -->
                            </div><!-- /.call-to-action__content -->
                        </div><!-- /.col-md-12 col-lg-12 col-xl-12 -->
                    </div><!-- /.row -->
                </div><!-- /.container -->
            </section><!-- /.call-to-action -->

            <section class="call-to-action-two">
                <img src="${pageContext.request.contextPath}/images/shapes/call-shape-2-1.png" alt="" class="call-to-action-two__shape-1">
                <img src="${pageContext.request.contextPath}/images/shapes/call-shape-2-2.png" alt="" class="call-to-action-two__shape-2">
                <img src="${pageContext.request.contextPath}/images/shapes/call-shape-2-3.png" alt="" class="call-to-action-two__shape-3">
                <img src="${pageContext.request.contextPath}/images/shapes/call-shape-2-4.png" alt="" class="call-to-action-two__shape-4">
                <img src="${pageContext.request.contextPath}/images/shapes/call-shape-2-5.png" alt="" class="call-to-action-two__shape-5">
                <img src="${pageContext.request.contextPath}/images/shapes/call-shape-2-6.png" alt="" class="call-to-action-two__shape-6">
                <div class="container">
                    <div class="row flex-xl-row-reverse">
                        <div class="col-lg-12 col-xl-6">
                            <div class="call-to-action-two__image">
                                <h2 class="floated-text">Healthy</h2><!-- /.floated-text -->
                                <img src="${pageContext.request.contextPath}/images/resources/call-2-1.png" alt="">
                            </div><!-- /.call-to-action-two__image -->
                        </div><!-- /.col-md-6 -->
                        <div class="col-lg-12 col-xl-6">
                            <div class="call-to-action-two__content">
                                <div class="block-title text-left">
                                    <div class="block-title__decor"></div><!-- /.block-title__decor -->
                                    <p>Pure Organic Products</p>
                                    <h3>Everyday Fresh Food</h3>
                                </div><!-- /.block-title -->
                                <div class="row">
                                    <div class="col-md-6">
                                        <h4>Duis aute irure dolor in reprehen in derit.</h4>
                                        <p>Voluptate velit essects quis tempor orci. Suspendisse that potenti faucibus.</p>
                                    </div><!-- /.col-md-6 -->
                                    <div class="col-md-6">
                                        <ul class="list-unstyled">
                                            <li>
                                                <i class="far fa-check-circle"></i>
                                                Refresing to get such a touch
                                            </li>
                                            <li>
                                                <i class="far fa-check-circle"></i>
                                                Duis aute irure dolor in
                                            </li>
                                            <li>
                                                <i class="far fa-check-circle"></i>
                                                Reprehenderit in voluptate
                                            </li>
                                            <li>
                                                <i class="far fa-check-circle"></i>
                                                Velit esse cillum dolore eu
                                            </li>
                                            <li>
                                                <i class="far fa-check-circle"></i>
                                                Fugiat nulla pariatur
                                            </li>
                                        </ul><!-- /.list-unstyled -->
                                    </div><!-- /.col-md-6 -->
                                </div><!-- /.row -->
                                <a href="product" class="thm-btn">Order Now</a><!-- /.thm-btn -->
                            </div><!-- /.call-to-action-two__content -->
                        </div><!-- /.col-md-6 -->

                    </div><!-- /.row -->
                </div><!-- /.container -->
            </section><!-- /.call-to-action-two -->

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
