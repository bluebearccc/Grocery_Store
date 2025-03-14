<%-- 
    Document   : products
    Created on : Feb 26, 2025, 11:32:16 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <input id="searchName" type="text" name="productName" placeholder="Search product name" style="border-radius: 7px; padding: 5px; font-size: 16px; border: 2px solid #f4f4f4">
                                    <button class="organik-icon-magnifying-glass" onclick="loadPage(1)" style="padding: 10px 20px;
                                            background-color: #4CAF50;
                                            color: white;
                                            border: none;
                                            border-radius: 5px;
                                            cursor: pointer;
                                            font-size: 16px;
                                            "></button>
                                </div><!-- /.product-sidebar__single -->
                                <div class="product-sidebar__single">
                                    <h3>Price</h3>
                                    <form id="priceFilterForm">
                                        <!-- Hiển thị giá trị Min và Max -->
                                        <div class="price-display">
                                            $<span id="min-price-display">0</span> - $<span id="max-price-display">200</span>
                                        </div>
                                        <input type="hidden" id="min-price" name="site" value="product">
                                        <input type="hidden" id="min-price" name="minPrice">
                                        <input type="hidden" id="max-price" name="maxPrice">

                                        <!-- Slider Container -->
                                        <div class="slider-container">
                                            <div class="slider-track" id="slider-track"></div>
                                            <div class="thumb" id="min-thumb"></div>
                                            <div class="thumb" id="max-thumb"></div>
                                        </div>

                                        <!-- Nút Filter -->
                                        <a type="#" class="filter-btn" onclick="loadPage(1)">Filter</a>
                                    </form>
                                </div><!-- /.product-sidebar__single -->
                                <div class="product-sidebar__single">
                                    <h3>Categories</h3>
                                    <ul class="list-unstyled product-sidebar__links">
                                        <li><a onclick="getCategoryId(null); loadPage(${pageControl.getPage()})" > All <i class ="fa fa-angle-right"></i></a></li>
                                                <c:forEach items="${CategoryList}" var="c">
                                            <li><a onclick="getCategoryId(${c.getCategory__id()}); loadPage(${pageControl.getPage()})">${c.getCategory__name()} <i class="fa fa-angle-right"></i></a></li>
                                                </c:forEach>
                                    </ul><!-- /.list-unstyled product-sidebar__links -->
                                </div><!-- /.product-sidebar__single -->
                            </div><!-- /.product-sidebar -->
                        </div><!-- /.col-sm-12 col-md-12 col-lg-3 -->
                        <div id="pagin" class="col-sm-12 col-md-12 col-lg-9">
                            <div class="product-sorter">
                                <div class="product-sorter__select col-sm-12 col-md-12 col-lg-4">
                                    <img src="${pageContext.request.contextPath}/images/logo-dark.png" width="105" alt="">
                                </div><!-- /.product-sorter__select -->
                            </div><!-- /.product-sorter -->

                            <div class="row">
                                <c:forEach items="${ProductList}" var="p">
                                    <div class="col-md-6 col-lg-4">
                                        <div class="product-card">
                                            <div class="product-card__image">
                                                <img src="${pageContext.request.contextPath}/${p.getImage()}" alt="">
                                                <div class="product-card__image-content">
                                                    <a href="home?site=product-details&productId=${p.getProduct__id()}"><i class="organik-icon-visibility"></i></a>
                                                </div><!-- /.product-card__image-content -->
                                            </div><!-- /.product-card__image -->
                                            <div class="product-card__content">
                                                <div class="product-card__left">
                                                    <h3><a href="home?site=product-details">${p.getProduct__name()}</a></h3>
                                                    <p>$${p.getUnit__price()}</p>
                                                </div><!-- /.product-card__left -->
                                                <div class="product-card__right">
                                                    <c:forEach begin="1" end="${p.getStar__rating()}">
                                                        <i class="fa fa-star"></i>
                                                    </c:forEach>
                                                </div><!-- /.product-card__right -->
                                            </div><!-- /.product-card__content -->
                                        </div><!-- /.product-card -->
                                    </div><!-- /.col-md-6 col-lg-4 -->
                                </c:forEach>
                            </div><!-- /.row -->
                            <ul id="paginationButton" class="list-unstyled post-pagination d-flex justify-content-center" style="margin-top: 30px">
                                <c:if test="${pageControl.getPage() > 1}">
                                    <li><a onclick="loadPage(${pageControl.getPage() - 1})"><i class="fa fa-angle-left"></i></a></li>
                                        </c:if>
                                        <c:if test="${pageControl.getPage() == 1}">
                                    <li><a onclick="loadPage(${pageControl.getPage()})"><i class="fa fa-angle-left"></i></a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${pageControl.getTotalPage()}" var="pageNumber">
                                    <li><a onclick="loadPage(${pageNumber})">${pageNumber}</a></li>
                                    </c:forEach>
                                    <c:if test="${pageControl.getPage() < pageControl.getTotalPage()}">
                                    <li><a onclick="loadPage(${pageControl.getPage() + 1})"><i class="fa fa-angle-right"></i></a></li>
                                        </c:if>
                                        <c:if test="${pageControl.getPage() == pageControl.getTotalPage()}">
                                    <li><a onclick="loadPage(${pageControl.getPage()})"><i class="fa fa-angle-right"></i></a></li>
                                        </c:if>
                            </ul><!-- /.post-pagination -->
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
        <script src="${pageContext.request.contextPath}/js/organik-money-filter.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <<script>
                                        let currentCategoryId;
                                        let min = 0, max = 200;
                                        let searchName;
                                        function getCategoryId(categoryId) {
                                            currentCategoryId = categoryId;
                                        }

                                        function getMinMaxSearchName() {
                                            min = document.getElementById('min-price').value;
                                            max = document.getElementById('max-price').value;
                                            searchName = document.getElementById('searchName').value;
                                        }

                                        function loadPage(page) {
                                            getMinMaxSearchName();
                                            console.log(min);
                                            console.log(max);
                                            console.log(currentCategoryId);
                                            $.ajax({
                                                url: "/Grocery_Store/home",
                                                type: "get",
                                                data: {
                                                    site: "product",
                                                    categoryId: currentCategoryId,
                                                    page: page,
                                                    min: min,
                                                    max: max,
                                                    productName: searchName
                                                },
                                                success: function (data) {
                                                    let row = document.getElementById('pagin');
                                                    row.innerHTML = data;
                                                },
                                                error: function (e) {
                                                    alert('Error: ' + e);
                                                }
                                            });
                                        }
        </script>
    </body>
</html>
