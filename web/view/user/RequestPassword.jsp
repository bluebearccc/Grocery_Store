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
        <div class="login-container">
            <div class="overlay"></div>
            <div class="content">
                <form action="RequestPassword" class="form-login" method="POST">
                    <h3 style="text-align: center">Send to email</h3>
                    <div class="input-group">
                        <input type="email" name="email" placeholder="name@example.com" required>
                    </div>
                    <button type="submit" class="login-btn">Reset password</button>
                    <p class="text-danger">${mess}</p>
                    <a href="home" class="btn-home" style="    background-color: #4CAF50;
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
                <img src="${pageContext.request.contextPath}/images/backgrounds/funfact-bg-1-1.jpg" alt="Side Image">
            </div>
        </div>
    </body>
</html>