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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Form</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login-register.css">
    </head>
    <body style="background-image: url(${pageContext.request.contextPath}/images/backgrounds/page-header-bg-1-1.jpg); no-repeat center center/cover">
        <div class="login-container">
            <div class="overlay"></div>
            <div class="content">
                <form>
                    <div class="input-group">
                        <input type="text" placeholder="Username" required>
                    </div>
                    <div class="input-group">
                        <input type="password" placeholder="Password" required>
                    </div>
                    <div class="options">
                        <label><input type="checkbox"> Remember me</label>
                        <a href="#">Forgot your password?</a>
                    </div>
                    <button type="submit" class="login-btn">Login</button>
                    <p class="signup">Not a member? <a href="#">Sign up now</a></p>
                </form>
                <img src="${pageContext.request.contextPath}/images/backgrounds/funfact-bg-1-1.jpg" alt="Side Image">
            </div>
        </div>
    </body>
</html>
