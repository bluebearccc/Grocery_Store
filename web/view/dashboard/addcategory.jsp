<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add product</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                padding: 20px;
            }
            .container {
                max-width: 500px;
                margin: auto;
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }
            h2 {
                text-align: center;
            }
            label {
                font-weight: bold;
                display: block;
                margin-top: 10px;
            }
            input, textarea, button, select {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            button {
                background: blue;
                color: white;
                border: none;
                padding: 10px;
                margin-top: 15px;
                cursor: pointer;
            }
            button:hover {
                background: darkblue;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Add product</h2>
            <form action="AddCategory" method="post">
                <label for="categoryName">Category Name:</label>
                <input type="text" id="categoryName" name="categoryName" required>

                <label for="description">Description</label>
                <textarea id="description" name="description" rows="3" required></textarea>

                <button type="submit">ADD</button>
            </form>
        </div>
    </body>
</html>
