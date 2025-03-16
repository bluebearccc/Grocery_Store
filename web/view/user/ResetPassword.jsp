<%-- 
    Document   : login.jsp
    Created on : 4 Jun, 2024, 4:48:55 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/logins/login-6/assets/css/login-6.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login-register.css">
    </head>
    <body style="background-image: url(${pageContext.request.contextPath}/images/backgrounds/page-header-bg-1-1.jpg); no-repeat center center/cover">
        
        <div class="form-container">
            <form action="ResetPassword" class="register-form" method="POST">
                <h3 style="text-align: center; margin-bottom: 15px">Reset Password</h3>
                <div class="input-group">
                    <input type="email" class="form-control" value="${email}" name="email" id="email" placeholder="name@example.com" required>
                </div>
                <div class="input-group">
                    <input type="password" class="form-control" name="password" id="password" value="" placeholder="Password" required>
                </div>
                <div class="input-group">
                    <input type="password" class="form-control" name="confirm_password" id="confirm_password" value="" placeholder="Password" required>
                </div>
                <button type="submit" class="login-btn">Reset password</button>
                <p class="text-danger">${mess}</p>
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
    </body>
</html>

