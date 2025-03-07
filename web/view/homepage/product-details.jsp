<%-- 
    Document   : product-details
    Created on : Mar 6, 2025, 12:45:19 AM
    Author     : admin
--%>

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
                                <img src="${pageContext.request.contextPath}/images/products/product-d-1.jpg" alt="">
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6">
                            <div class="product_detail_content">
                                <h2>Apples</h2>
                                <div class="product_detail_review_box">
                                    <div class="product_detail_price_box">
                                        <p>$9.98</p>
                                    </div>
                                    <div class="product_detail_review">
                                        <a href="#"><i class="fa fa-star"></i></a>
                                        <a href="#"><i class="fa fa-star"></i></a>
                                        <a href="#"><i class="fa fa-star"></i></a>
                                        <a href="#"><i class="fa fa-star"></i></a>
                                        <a href="#" class="deactive"><i class="fa fa-star"></i></a>
                                        <span>2 Customer Reviews</span>
                                    </div>
                                </div>
                                <div class="product_detail_text">
                                    <p>Aliquam hendrerit a augue insuscipit. Etiam aliquam massa quis des mauris commodo
                                        venenatis ligula commodo leez sed blandit convallis dignissim onec vel pellentesque
                                        neque.</p>
                                </div>
                                <ul class="list-unstyled product_detail_address">
                                    <li>REF. 4231/406</li>
                                    <li>Available in store</li>
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
                                    <li><span>Category:</span> Food</li>
                                    <li><span>Tags:</span> Vegetables, Fruits</li>
                                </ul>
                                <div class="product_detail_share_box">
                                    <div class="share_box_title">
                                        <h2>Share with friends</h2>
                                    </div>
                                    <div class="share_box_social">
                                        <a href="#"><i class="fab fa-facebook-square"></i></a>
                                        <a href="#"><i class="fab fa-twitter"></i></a>
                                        <a href="#"><i class="fab fa-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="product-tab-box tabs-box">
                                <ul class="tab-btns tab-buttons clearfix list-unstyled">
                                    <li data-tab="#desc" class="tab-btn"><span>description</span></li>
                                    <li data-tab="#addi__info" class="tab-btn"><span>Additional info</span></li>
                                    <li data-tab="#review" class="tab-btn active-btn"><span>reviews</span></li>
                                </ul>
                                <div class="tabs-content">
                                    <div class="tab" id="desc">
                                        <div class="product-details-content">
                                            <div class="desc-content-box">
                                                <p>Lorem ipsum dolor sit amet sectetur adipiscin elit cras feuiat antesed
                                                    ces condimentum viverra duis autue nim convallis id diam vitae duis
                                                    egety dictum erosin dictum sem. Vivamus sed molestie sapien aliquam et
                                                    facilisis arcu dut molestie augue suspendisse sodales tortor nunced quis
                                                    cto ligula posuere cursus keuis aute irure dolor in reprehenderit in
                                                    voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
                                                    sint occaecated cupidatat non proident sunt in culpa qui officia
                                                    deserunt mollit anim id est laborum ivamus sed molestie sapien.</p>
                                                <p class="desc-content-box_bottom">Aliquam et facilisis arcuut olestie
                                                    augue. Suspendisse sodales tortor nunc quis auctor ligula posuere cursus
                                                    duis aute irure dolor in reprehenderit in voluptate velit esse cill
                                                    doloreeu fugiat nulla pariatur excepteur sint occaecat cupidatat non
                                                    proident sunt in culpa qui officia deserunt mollit anim id est laborum.
                                                    Vivaus sed delly molestie sapien. Aliquam et facilisis arcuut molestie
                                                    augue. </p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab" id="addi__info">
                                        <ul class="additionali_nfo list-unstyled">
                                            <li><span>Weight:</span>3kg</li>
                                            <li><span>Category:</span>Food</li>
                                            <li><span>Tags:</span>Vegetables, Fruits</li>
                                        </ul>
                                    </div>

                                    <div class="tab active-tab" id="review">
                                        <div class="reviews-box">
                                            <div class="row">
                                                <div class="col-xl-12">
                                                    <div class="product_reviews_box">
                                                        <h3 class="product_reviews_title">2 Product reviews</h3>
                                                        <div class="product_reviews_single">
                                                            <div class="product_reviews_image">
                                                                <img src="${pageContext.request.contextPath}/images/products/review-1.jpg" alt="">
                                                            </div>
                                                            <div class="product_reviews_content">
                                                                <h3>Kevin Martins<span>15 Nov, 2019</span></h3>
                                                                <p>Lorem ipsum is simply free text used by copytyping refreshing.
                                                                    Neque porro est qui dolorem ipsum quia quaed inventore veritatis
                                                                    et quasi architecto beatae vitae dicta sunt explicabo.</p>
                                                                <div class="product_reviews_rating product_detail_review">
                                                                    <a href="#"><i class="fa fa-star"></i></a>
                                                                    <a href="#"><i class="fa fa-star"></i></a>
                                                                    <a href="#"><i class="fa fa-star"></i></a>
                                                                    <a href="#"><i class="fa fa-star"></i></a>
                                                                    <a href="#" class="deactive"><i class="fa fa-star"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="product_reviews_single">
                                                            <div class="product_reviews_image">
                                                                <img src="${pageContext.request.contextPath}/images/products/review-2.jpg" alt="">
                                                            </div>
                                                            <div class="product_reviews_content">
                                                                <h3>Kevin Martins<span>15 Nov, 2019</span></h3>
                                                                <p>Lorem ipsum is simply free text used by copytyping refreshing.
                                                                    Neque porro est qui dolorem ipsum quia quaed inventore veritatis
                                                                    et quasi architecto beatae vitae dicta sunt explicabo.</p>
                                                                <div class="product_reviews_rating product_detail_review">
                                                                    <a href="#"><i class="fa fa-star"></i></a>
                                                                    <a href="#"><i class="fa fa-star"></i></a>
                                                                    <a href="#"><i class="fa fa-star"></i></a>
                                                                    <a href="#"><i class="fa fa-star"></i></a>
                                                                    <a href="#" class="deactive"><i class="fa fa-star"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-12">
                                                    <div class="add_review_box">
                                                        <h3 class="add_review_title">Add a review</h3>
                                                        <div class="add_review_rating">
                                                            <span>Rate this Product?</span>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#" class="deactive"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <form class="add_review_form" action="#">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="input-box">
                                                                        <textarea name="review" placeholder="Write review" required=""></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="input-box">
                                                                        <input type="text" name="name" placeholder="Full name" required="">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="input-box">
                                                                        <input type="email" name="email" placeholder="Email address" required="">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-xl-12">
                                                                    <div class="review_submit_btn">
                                                                        <a href="#" class="thm-btn">Submit Review</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="product-two">
                <div class="container">
                    <div class="block-title text-center">
                        <div class="block-title__decor"></div><!-- /.block-title__decor -->
                        <p>Recently Added</p>
                        <h3>Similar Products</h3>
                    </div><!-- /.block-title -->
                    <div class="thm-tiny__slider" id="product-two__carousel" data-tiny-options='{
                         "container": "#product-two__carousel",
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
                            <div class="product-card__two">
                                <div class="product-card__two-image">
                                    <span class="product-card__two-sale">sale</span>
                                    <img src="${pageContext.request.contextPath}/images/products/product-2-1.jpg" alt="">
                                    <div class="product-card__two-image-content">
                                        <a href="#"><i class="organik-icon-visibility"></i></a>
                                        <a href="#"><i class="organik-icon-heart"></i></a>
                                        <a href="home?site=cart"><i class="organik-icon-shopping-cart"></i></a>
                                    </div><!-- /.product-card__two-image-content -->
                                </div><!-- /.product-card__two-image -->
                                <div class="product-card__two-content">
                                    <h3><a href="home?site=product-details">Banana</a></h3>
                                    <div class="product-card__two-stars">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div><!-- /.product-card__two-stars -->
                                    <p>$1.00</p>

                                </div><!-- /.product-card__two-content -->
                            </div><!-- /.product-card__two -->
                        </div>
                        <div>
                            <div class="product-card__two">
                                <div class="product-card__two-image">
                                    <img src="${pageContext.request.contextPath}/images/products/product-2-2.jpg" alt="">
                                    <div class="product-card__two-image-content">
                                        <a href="#"><i class="organik-icon-visibility"></i></a>
                                        <a href="#"><i class="organik-icon-heart"></i></a>
                                        <a href="home?site=cart"><i class="organik-icon-shopping-cart"></i></a>
                                    </div><!-- /.product-card__two-image-content -->
                                </div><!-- /.product-card__two-image -->
                                <div class="product-card__two-content">
                                    <h3><a href="home?site=product-details">Olive Oil</a></h3>
                                    <div class="product-card__two-stars">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div><!-- /.product-card__two-stars -->
                                    <p>$7.00</p>

                                </div><!-- /.product-card__two-content -->
                            </div><!-- /.product-card__two -->
                        </div>
                        <div>
                            <div class="product-card__two">
                                <div class="product-card__two-image">
                                    <img src="${pageContext.request.contextPath}/images/products/product-2-3.jpg" alt="">
                                    <div class="product-card__two-image-content">
                                        <a href="#"><i class="organik-icon-visibility"></i></a>
                                        <a href="#"><i class="organik-icon-heart"></i></a>
                                        <a href="home?site=cart"><i class="organik-icon-shopping-cart"></i></a>
                                    </div><!-- /.product-card__two-image-content -->
                                </div><!-- /.product-card__two-image -->
                                <div class="product-card__two-content">
                                    <h3><a href="home?site=product-details">Eggs</a></h3>
                                    <div class="product-card__two-stars">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div><!-- /.product-card__two-stars -->
                                    <p>$3.00</p>

                                </div><!-- /.product-card__two-content -->
                            </div><!-- /.product-card__two -->
                        </div>
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
