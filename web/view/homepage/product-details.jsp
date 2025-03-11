<%-- 
    Document   : product-details
    Created on : Mar 6, 2025, 12:45:19 AM
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
        <title>Product Page || Oganik</title>
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
                <section class="page-header">
                    <div class="page-header__bg" style="background-image: url(${pageContext.request.contextPath}/images/backgrounds/page-header-bg-1-1.jpg);"></div>
                <!-- /.page-header__bg -->
                <div class="container">
                    <h2>Product</h2>
                    <ul class="thm-breadcrumb list-unstyled">
                        <li><a href="home">Home</a></li>
                        <li>/</li>
                        <li><span>Product</span></li>
                    </ul><!-- /.thm-breadcrumb list-unstyled -->
                </div><!-- /.container -->
            </section><!-- /.page-header -->


            <section class="product_detail">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6">
                            <div class="product_detail_image">
                                <img src="${pageContext.request.contextPath}/${product.getImage()}" alt="">
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6">
                            <div class="product_detail_content">
                                <h2>${product.getProduct__name()}</h2>
                                <div class="product_detail_review_box">
                                    <div class="product_detail_price_box">
                                        <p>$${product.getUnit__price()}</p>
                                    </div>
                                    <div class="product_detail_review">
                                        <c:forEach begin="1" end="${product.getStar__rating()}">
                                            <a href="#"><i class="fa fa-star"></i></a>
                                            </c:forEach>
                                    </div>
                                </div>
                                <div class="product_detail_text">
                                    <p>${product.getDescribe()}</p>
                                    <p>Release Date: ${product.getRelease__date()}</p>
                                </div>
                                <ul class="list-unstyled product_detail_address">
                                    <li>From: ${supplier.getCompany__name()}</li>
                                    <li>Unit In Stock: ${product.getUnit__in__stock()}</li>
                                </ul>
                                <div class="product-quantity-box">
                                    <div class="quantity-box">
                                        <button type="button" class="sub">-</button>
                                        <input type="number" id="2" value="1" />
                                        <button type="button" class="add">+</button>
                                    </div>
                                    <div class="addto-cart-box">
                                        <button class="thm-btn" type="submit">Add to Cart</button>
                                    </div>
                                    <div class="wishlist_btn">
                                        <a href="#" class="thm-btn">Add to Wishlist</a>
                                    </div>
                                </div>
                                <ul class="list-unstyled category_tag_list">
                                    <li><span>Category:</span> ${category.getCategory__name()}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="product-two">
                <div class="container">
                    <div class="block-title text-center">
                        <div class="block-title__decor"></div><!-- /.block-title__decor -->
                        <h3>Similar Products</h3>
                    </div><!-- /.block-title -->
                    <c:if test="${SameCategoryList.isEmpty()}">
                        <h3 style="text-align: center">Sorry there is no similar product 😔</h3>
                    </c:if>
                    <div class="thm-tiny__slider" id="product-two__carousel">

                        <c:forEach items="${SameCategoryList}" var="product_sameCate">
                            <div>
                                <div class="product-card__two">
                                    <div class="product-card__two-image">
                                        <img src="${pageContext.request.contextPath}/${product_sameCate.getImage()}" alt="">
                                        <div class="product-card__two-image-content">
                                            <a href="home?site=product-details&productId=${product_sameCate.getProduct__id()}"><i class="organik-icon-visibility"></i></a>
                                            <a href="home?site=cart"><i class="organik-icon-shopping-cart"></i></a>
                                        </div><!-- /.product-card__two-image-content -->
                                    </div><!-- /.product-card__two-image -->
                                    <div class="product-card__two-content">
                                        <h3><a href="home?site=product-details">${product_sameCate.getProduct__name()}</a></h3>
                                        <div class="product-card__two-stars">
                                            <c:forEach begin="1" end="${product_sameCate.getStar__rating()}">
                                                <i class="fa fa-star"></i>
                                            </c:forEach>
                                        </div><!-- /.product-card__two-stars -->
                                        <p>$${product_sameCate.getUnit__price()}</p>
                                    </div><!-- /.product-card__two-content -->
                                </div><!-- /.product-card__two -->
                            </div>
                        </c:forEach>
                    </div>
                </div><!-- /.container -->
            </section><!-- /.product-two -->

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
