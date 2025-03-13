<%-- 
    Document   : SendEmailSuccesFully
    Created on : Mar 13, 2025, 9:36:27 PM
    Author     : Tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOTYPE html>
<html lang="en">
    <head>C
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông báo</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-color: #f4f4f4;
            }
            .message-container {
                text-align: center;
                background: #ffffff;
                padding: 20px 40px;
                border-radius: 12px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            }
            h2 {
                color: #4CAF50;
            }
            p {
                margin: 10px 0 20px;
            }
            a {
                display: inline-block;
                padding: 8px 16px;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border-radius: 8px;
                transition: background-color 0.3s ease;
            }
            a:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="message-container">
            <h2>Send Email success!</h2>
            <p>Pls check your email</p>
            <a href="home">Home</a>
        </div>
    </body>
</html>
