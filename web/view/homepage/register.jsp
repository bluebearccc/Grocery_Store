<%-- 
    Document   : register
    Created on : Mar 6, 2025, 1:19:18 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register || Oganik</title>
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/images/favicons/apple-touch-icon.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/images/favicons/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicons/favicon-16x16.png" />
        <link rel="manifest" href="${pageContext.request.contextPath}/images/favicons/site.webmanifest" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login-register.css">

    </head>
    <div class="container">
        <div class="left-image">
            <img src="${pageContext.request.contextPath}/images/backgrounds/page-header-bg-1-1.jpg" alt="Left Image">
        </div>

        <div class="right-image">
            <img src="${pageContext.request.contextPath}/images/backgrounds/funfact-bg-1-1.jpg" alt="Right Image">
        </div>

        <div class="form-container">
            <form action="account" class="register-form" method="POST">
                <input type="hidden" name="site" value="registeruser">
                <h2>Register</h2>
                <div class="input-register-group">
                    <input type="text" name="fullname" placeholder="Fullname" required>
                </div>
                <div class="input-register-group">
                    <input type="text" name="username" placeholder="Username" required>
                </div>
                <div class="input-register-group">
                    <input type="email" name="email" placeholder="Email" required>
                </div>
                <div class="input-register-group">
                    <input type="text" name="phone" placeholder="Phone" required>
                </div>
                <div class="input-register-group">
                    <input type="text" name="address" placeholder="Address" required>
                </div>
                <div class="input-register-group">
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <div class="input-register-group">
                    <input type="password" name="password-confirm" placeholder="Confirm Password" required>
                </div>
                <button type="submit" class="register-btn">Sign Up</button>
                <P style="color: red">${error}</P>
                <p class="login-link">Already have an account? <a href="home?site=login">Login</a></p>
                <a href="home?site=home" class="btn-home" style="    background-color: #4CAF50;
                   color: white;
                   padding: 12px 24px;
                   border: none;
                   border-radius: 8px;
                   cursor: pointer;
                   font-size: 16px;
                   transition: background-color 0.3s ease;
                   text-decoration: none;
                   margin-top: 30px;
                   display: inline-block;">🏠 HomePage</a>
            </form>
        </div>
    </div>
</html>
