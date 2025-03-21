<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Sidebar -->
<nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-green" style="padding: 0px; width: 270px; background-color: black">
    <div class="position-sticky" >
        <div class="list-group list-group-flush mx-3 mt-4" style="margin: 0">
            <div class="footer_logo" style="text-align: center; margin-bottom: 0">
                <a href="home">
                    <img src="images/logo-light.png" alt="Logo" style="height: 53px">
                </a>
            </div>
            <a href="AdminController?site=maindashboard" class="list-group-item list-group-item-action" aria-current="true" style="margin-top: 10px;">
                <i style="margin-right: 10px; font-size: 18px" class="fas fa-tachometer-alt fa-fw me-3"></i>
                <span style="font-size: 16px; font-weight: 600">Main dashboard</span>
            </a>       
            <a href="AdminController?site=account" class="list-group-item list-group-item-action" style="margin-top: 10px">
                <i style="margin-right: 10px; font-size: 18px" class="fas fa-user-circle fa-fw me-3"></i>
                <span style="font-size: 16px; font-weight: 600">Accounts</span>
            </a>
            <a href="AdminController?site=product" class="list-group-item list-group-item-action" style="margin-top: 10px">
                <i style="margin-right: 10px; font-size: 18px" <i class="fa-solid fa-cart-shopping"></i>
                <span style="font-size: 16px; font-weight: 600">Products</span>
            </a>
            <a href="AdminController?site=supplier" class="list-group-item list-group-item-action" style="margin-top: 10px">
                <i style="margin-right: 10px; font-size: 18px" class="fas fa-parachute-box fa-fw me-3"></i>
                <span style="font-size: 16px; font-weight: 600">Supplier</span>
            </a>

            <a href="AdminController?site=manageCategory" class="list-group-item list-group-item-action" style="margin-top: 10px">
                <i style="margin-right: 10px; font-size: 18px" class="fas fa-layer-group"></i>
                <span style="font-size: 16px; font-weight: 600">Manage Category</span>
            </a>

            <a href="AdminController?site=manageOrders" class="list-group-item list-group-item-action" style="margin-top: 10px">
                <i style="margin-right: 10px; font-size: 18px" class="fas fa-receipt"></i>
                <span style="font-size: 16px; font-weight: 600">Manage Orders Detail</span>
            </a>

            <a href="AdminController?site=monthlyRevenue" class="list-group-item list-group-item-action" style="margin-top: 10px">
                <i style="margin-right: 10px; font-size: 18px" class="fas fa-chart-bar fa-fw me-3"></i>
                <span style="font-size: 16px; font-weight: 600">Revenue by month</span>
            </a>
        </div>
    </div>
</nav>