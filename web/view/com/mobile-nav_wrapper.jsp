<%-- 
    Document   : mobile-nav_wrapper
    Created on : Feb 25, 2025, 8:24:05 AM
    Author     : Tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="mobile-nav__wrapper">
            <div class="mobile-nav__overlay mobile-nav__toggler"></div>
            <!-- /.mobile-nav__overlay -->
            <div class="mobile-nav__content">
                <span class="mobile-nav__close mobile-nav__toggler"><i class="organik-icon-close"></i></span>

                <div class="logo-box">
                    <a href="home" aria-label="logo image"><img src="${pageContext.request.contextPath}/images/logo-light.png" width="155" alt="" /></a>
                </div>
                <!-- /.logo-box -->
                <div class="mobile-nav__container"></div>
                <!-- /.mobile-nav__container -->

                <ul class="mobile-nav__contact list-unstyled">
                    <li>
                        <i class="organik-icon-email"></i>
                        <a href="mailto:needhelp@organik.com">needhelp@organik.com</a>
                    </li>
                    <li>
                        <i class="organik-icon-calling"></i>
                        <a href="tel:666-888-0000">666 888 0000</a>
                    </li>
                </ul><!-- /.mobile-nav__contact -->
            </div>
            <!-- /.mobile-nav__content -->
        </div>
    </body>
</html>
