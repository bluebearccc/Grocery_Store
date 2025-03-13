<%-- 
    Document   : login
    Created on : Mar 6, 2025, 12:53:14 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login || Oganik</title>
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/images/favicons/apple-touch-icon.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/images/favicons/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicons/favicon-16x16.png" />
        <link rel="manifest" href="${pageContext.request.contextPath}/images/favicons/site.webmanifest" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login-register.css">
    </head>
    <body style="background-image: url(${pageContext.request.contextPath}/images/backgrounds/page-header-bg-1-1.jpg); no-repeat center center/cover">
        <div class="login-container">
            <div class="overlay"></div>
            <div class="content">
                <form action="home" class="form-login" method="POST">
                    <input type="hidden" name="site" value="validatelogin">
                    <div class="input-group">
                        <input type="text" name="username" placeholder="Username" required>
                    </div>
                    <div class="input-group">
                        <input type="password" name="password" placeholder="Password" required>
                    </div>
                    <div class="options">
                        <label><input type="checkbox"> Remember me</label>
                        <a href="RequestPassword">Forgot your password?</a>
                    </div>
                    <button type="submit" class="login-btn">Login</button>
                    <p style="color:red">${error}</p>
                    <p class="signup">Not a member? <a href="home?site=register">Sign up now</a></p>
                </form>
                <img src="${pageContext.request.contextPath}/images/backgrounds/funfact-bg-1-1.jpg" alt="Side Image">
            </div>
        </div>
    </body>
</html>
