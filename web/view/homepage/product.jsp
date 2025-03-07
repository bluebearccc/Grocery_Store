<%-- 
    Document   : products
    Created on : Feb 26, 2025, 11:32:16 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Products Page || Oganik</title>
        <!-- favicons Icons -->
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
                    <h2>Products</h2>
                    <ul class="thm-breadcrumb list-unstyled">
                        <li><a href="home">Home</a></li>
                        <li>/</li>
                        <li><span>Products</span></li>
                    </ul><!-- /.thm-breadcrumb list-unstyled -->
                </div><!-- /.container -->
            </section><!-- /.page-header -->


            <section class="products-page">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-3">
                            <div class="product-sidebar">
                                <div class="product-sidebar__single product-sidebar__search-widget">
                                    <form action="#">
                                        <input type="text" placeholder="Search">
                                        <button class="organik-icon-magnifying-glass" type="submit"></button>
                                    </form>
                                </div><!-- /.product-sidebar__single -->
                                <div class="product-sidebar__single">
                                    <h3>Price</h3>
                                    <div class="product-sidebar__price-range">
                                        <div class="range-slider-price" id="range-slider-price"></div>
                                        <div class="form-group">
                                            <div class="left">
                                                <p>$<span id="min-value-rangeslider"></span></p>
                                                <span>-</span>
                                                <p>$<span id="max-value-rangeslider"></span></p>
                                            </div><!-- /.left -->
                                            <div class="right">
                                                <input type="submit" class="thm-btn" value="Filter">
                                            </div><!-- /.right -->
                                        </div>
                                    </div><!-- /.product-sidebar__price-range -->
                                </div><!-- /.product-sidebar__single -->
                                <div class="product-sidebar__single">
                                    <h3>Categories</h3>
                                    <ul class="list-unstyled product-sidebar__links">
                                        <li><a href="#">Vegetables <i class="fa fa-angle-right"></i></a></li>
                                        <li><a href="#">Fresh Fruits <i class="fa fa-angle-right"></i></a></li>
                                        <li><a href="#">Dairy Products <i class="fa fa-angle-right"></i></a></li>
                                        <li><a href="#">Tomatos <i class="fa fa-angle-right"></i></a></li>
                                        <li><a href="#">Oranges <i class="fa fa-angle-right"></i></a></li>
                                    </ul><!-- /.list-unstyled product-sidebar__links -->
                                </div><!-- /.product-sidebar__single -->
                            </div><!-- /.product-sidebar -->
                        </div><!-- /.col-sm-12 col-md-12 col-lg-3 -->
                        <div class="col-sm-12 col-md-12 col-lg-9">
                            <div class="product-sorter">
                                <p>Showing 1–9 of 12 results</p>
                                <div class="product-sorter__select">
                                    <select class="selectpicker">
                                        <option value="#">Sort by popular</option>
                                        <option value="#">Sort by popular</option>
                                        <option value="#">Sort by popular</option>
                                        <option value="#">Sort by popular</option>
                                    </select>
                                </div><!-- /.product-sorter__select -->
                            </div><!-- /.product-sorter -->
                            <div class="row">
                                <div class="col-md-6 col-lg-4">
                                    <div class="product-card">
                                        <div class="product-card__image">
                                            <img src="${pageContext.request.contextPath}/images/products/product-1-1.jpg" alt="">
                                            <div class="product-card__image-content">
                                                <a href="#"><i class="organik-icon-heart"></i></a>
                                                <a href="home?site=cart"><i class="organik-icon-shopping-cart"></i></a>
                                            </div><!-- /.product-card__image-content -->
                                        </div><!-- /.product-card__image -->
                                        <div class="product-card__content">
                                            <div class="product-card__left">
                                                <h3><a href="home?site=product-details">Banana</a></h3>
                                                <p>$1.00</p>
                                            </div><!-- /.product-card__left -->
                                            <div class="product-card__right">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div><!-- /.product-card__right -->
                                        </div><!-- /.product-card__content -->
                                    </div><!-- /.product-card -->
                                </div><!-- /.col-md-6 col-lg-4 -->
                                <div class="col-md-6 col-lg-4">
                                    <div class="product-card">
                                        <div class="product-card__image">
                                            <img src="${pageContext.request.contextPath}/images/products/product-1-2.jpg" alt="">
                                            <div class="product-card__image-content">
                                                <a href="#"><i class="organik-icon-heart"></i></a>
                                                <a href="home?site=cart"><i class="organik-icon-shopping-cart"></i></a>
                                            </div><!-- /.product-card__image-content -->
                                        </div><!-- /.product-card__image -->
                                        <div class="product-card__content">
                                            <div class="product-card__left">
                                                <h3><a href="home?site=product-details">Tomatoes</a></h3>
                                                <p>$3.00</p>
                                            </div><!-- /.product-card__left -->
                                            <div class="product-card__right">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div><!-- /.product-card__right -->
                                        </div><!-- /.product-card__content -->
                                    </div><!-- /.product-card -->
                                </div><!-- /.col-md-6 col-lg-4 -->
                                <div class="col-md-6 col-lg-4">
                                    <div class="product-card">
                                        <div class="product-card__image">
                                            <img src="${pageContext.request.contextPath}/images/products/product-1-3.jpg" alt="">
                                            <div class="product-card__image-content">
                                                <a href="#"><i class="organik-icon-heart"></i></a>
                                                <a href="home?site=cart"><i class="organik-icon-shopping-cart"></i></a>
                                            </div><!-- /.product-card__image-content -->
                                        </div><!-- /.product-card__image -->
                                        <div class="product-card__content">
                                            <div class="product-card__left">
                                                <h3><a href="home?site=product-details">Bread</a></h3>
                                                <p>$2.00</p>
                                            </div><!-- /.product-card__left -->
                                            <div class="product-card__right">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div><!-- /.product-card__right -->
                                        </div><!-- /.product-card__content -->
                                    </div><!-- /.product-card -->
                                </div><!-- /.col-md-6 col-lg-4 -->
                                <div class="col-md-6 col-lg-4">
                                    <div class="product-card">
                                        <div class="product-card__image">
                                            <img src="${pageContext.request.contextPath}/images/products/product-1-4.jpg" alt="">
                                            <div class="product-card__image-content">
                                                <a href="#"><i class="organik-icon-heart"></i></a>
                                                <a href="home?site=cart"><i class="organik-icon-shopping-cart"></i></a>
                                            </div><!-- /.product-card__image-content -->
                                        </div><!-- /.product-card__image -->
                                        <div class="product-card__content">
                                            <div class="product-card__left">
                                                <h3><a href="home?site=product-details">Apples</a></h3>
                                                <p>$5.00</p>
                                            </div><!-- /.product-card__left -->
                                            <div class="product-card__right">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div><!-- /.product-card__right -->
                                        </div><!-- /.product-card__content -->
                                    </div><!-- /.product-card -->
                                </div><!-- /.col-md-6 col-lg-4 -->
                                <div class="col-md-6 col-lg-4">
                                    <div class="product-card">
                                        <div class="product-card__image">
                                            <img src="${pageContext.request.contextPath}/images/products/product-1-5.jpg" alt="">
                                            <div class="product-card__image-content">
                                                <a href="#"><i class="organik-icon-heart"></i></a>
                                                <a href="home?site=cart"><i class="organik-icon-shopping-cart"></i></a>
                                            </div><!-- /.product-card__image-content -->
                                        </div><!-- /.product-card__image -->
                                        <div class="product-card__content">
                                            <div class="product-card__left">
                                                <h3><a href="home?site=product-details">Olive Oil</a></h3>
                                                <p>$6.00</p>
                                            </div><!-- /.product-card__left -->
                                            <div class="product-card__right">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div><!-- /.product-card__right -->
                                        </div><!-- /.product-card__content -->
                                    </div><!-- /.product-card -->
                                </div><!-- /.col-md-6 col-lg-4 -->
                                <div class="col-md-6 col-lg-4">
                                    <div class="product-card">
                                        <div class="product-card__image">
                                            <img src="${pageContext.request.contextPath}/images/products/product-1-6.jpg" alt="">
                                            <div class="product-card__image-content">
                                                <a href="#"><i class="organik-icon-heart"></i></a>
                                                <a href="home?site=cart"><i class="organik-icon-shopping-cart"></i></a>
                                            </div><!-- /.product-card__image-content -->
                                        </div><!-- /.product-card__image -->
                                        <div class="product-card__content">
                                            <div class="product-card__left">
                                                <h3><a href="home?site=product-details">Eggs</a></h3>
                                                <p>$4.00</p>
                                            </div><!-- /.product-card__left -->
                                            <div class="product-card__right">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div><!-- /.product-card__right -->
                                        </div><!-- /.product-card__content -->
                                    </div><!-- /.product-card -->
                                </div><!-- /.col-md-6 col-lg-4 -->
                                <div class="col-md-6 col-lg-4">
                                    <div class="product-card">
                                        <div class="product-card__image">
                                            <img src="${pageContext.request.contextPath}/images/products/product-1-7.jpg" alt="">
                                            <div class="product-card__image-content">
                                                <a href="#"><i class="organik-icon-heart"></i></a>
                                                <a href="home?site=cart"><i class="organik-icon-shopping-cart"></i></a>
                                            </div><!-- /.product-card__image-content -->
                                        </div><!-- /.product-card__image -->
                                        <div class="product-card__content">
                                            <div class="product-card__left">
                                                <h3><a href="home?site=product-details">Honey</a></h3>
                                                <p>$9.00</p>
                                            </div><!-- /.product-card__left -->
                                            <div class="product-card__right">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div><!-- /.product-card__right -->
                                        </div><!-- /.product-card__content -->
                                    </div><!-- /.product-card -->
                                </div><!-- /.col-md-6 col-lg-4 -->
                                <div class="col-md-6 col-lg-4">
                                    <div class="product-card">
                                        <div class="product-card__image">
                                            <img src="${pageContext.request.contextPath}/images/products/product-1-8.jpg" alt="">
                                            <div class="product-card__image-content">
                                                <a href="#"><i class="organik-icon-heart"></i></a>
                                                <a href="home?site=cart"><i class="organik-icon-shopping-cart"></i></a>
                                            </div><!-- /.product-card__image-content -->
                                        </div><!-- /.product-card__image -->
                                        <div class="product-card__content">
                                            <div class="product-card__left">
                                                <h3><a href="home?site=product-details">Onions</a></h3>
                                                <p>$2.00</p>
                                            </div><!-- /.product-card__left -->
                                            <div class="product-card__right">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div><!-- /.product-card__right -->
                                        </div><!-- /.product-card__content -->
                                    </div><!-- /.product-card -->
                                </div><!-- /.col-md-6 col-lg-4 -->
                                <div class="col-md-6 col-lg-4">
                                    <div class="product-card">
                                        <div class="product-card__image">
                                            <img src="${pageContext.request.contextPath}/images/products/product-1-9.jpg" alt="">
                                            <div class="product-card__image-content">
                                                <a href="#"><i class="organik-icon-heart"></i></a>
                                                <a href="home?site=cart"><i class="organik-icon-shopping-cart"></i></a>
                                            </div><!-- /.product-card__image-content -->
                                        </div><!-- /.product-card__image -->
                                        <div class="product-card__content">
                                            <div class="product-card__left">
                                                <h3><a href="home?site=product-details">Cabbage</a></h3>
                                                <p>$3.00</p>
                                            </div><!-- /.product-card__left -->
                                            <div class="product-card__right">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div><!-- /.product-card__right -->
                                        </div><!-- /.product-card__content -->
                                    </div><!-- /.product-card -->
                                </div><!-- /.col-md-6 col-lg-4 -->
                            </div><!-- /.row -->
                            <div class="text-center">
                                <a href="#" class="thm-btn products__load-more">Load More</a><!-- /.thm-btn -->
                            </div><!-- /.text-center -->
                        </div><!-- /.col-sm-12 col-md-12 col-lg-9 -->
                    </div><!-- /.row -->
                </div><!-- /.container -->
            </section><!-- /.products-page -->

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
