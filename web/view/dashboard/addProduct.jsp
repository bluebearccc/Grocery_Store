<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Product</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                width: 400px;
            }
            h2 {
                text-align: center;
            }
            label {
                font-weight: bold;
                display: block;
                margin-top: 10px;
            }
            input, select, textarea {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .btn-container {
                display: flex;
                justify-content: space-between;
                margin-top: 15px;
            }
            .btn {
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .btn-cancel {
                background-color: #ccc;
            }
            .btn-add {
                background-color: #28a745;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Add Product</h2>
            
            <%-- Hiển thị thông báo lỗi nếu có --%>
            <c:if test="${not empty error}">
                <p style="color: red; text-align: center;">${error}</p>
            </c:if>

            <form action="addProduct" method="post" enctype="multipart/form-data">
                <label>Product Name</label>
                <input type="text" name="productName" required>

                <label>Image</label>
                <input type="file" id="image" name="image">
                <img id="previewImage" src="#" alt="Preview" style="display: none; max-width: 300px; max-height: 300px;">

                <label>Unit Price</label>
                <input type="number" name="unitPrice" step="0.01" required>

                <label>Description</label>
                <textarea name="description" rows="3"></textarea>

                <label>Quantity</label>
                <input type="number" name="quantity" required>

                <label>Quantity Per Unit</label>
                <input type="text" name="quantityPerUnit">

                <label>Supplier</label>
                <select name="supplierId">
                    <option value="">Select Supplier</option>
                    <c:forEach items="${listSup}" var="s">
                        <option value="${s.supplierId}">${s.companyName}</option>
                    </c:forEach>
                </select>

                <label>Category</label>
                <select name="categoryId">
                    <option value="">Select Category</option>
                    <c:forEach items="${listCate}" var="c">
                        <option value="${c.categoryId}">${c.categoryName}</option>
                    </c:forEach>
                </select>

                <label>Release Date</label>
                <input type="date" name="releaseDate" required>

                <div class="btn-container">
                    <button type="reset" class="btn btn-cancel">Cancel</button>
                    <button type="submit" class="btn btn-add">Add</button>
                </div>
            </form>
        </div>

        <script>
            document.getElementById("image").addEventListener("change", function(event) {
                const reader = new FileReader();
                reader.onload = function() {
                    const img = document.getElementById("previewImage");
                    img.src = reader.result;
                    img.style.display = "block";
                };
                reader.readAsDataURL(event.target.files[0]);
            });
        </script>
    </body>
</html>
