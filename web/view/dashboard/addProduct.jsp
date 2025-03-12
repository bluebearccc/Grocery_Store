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
            <form action="adminAddProduct" method="post" enctype="multipart/form-data">
                <label for="productName">Product Name:</label>
                <input type="text" id="productName" name="productName" required>

                <label for="categoryId">Category: </label>
                <select id="categoryId" name="categoryId">
                    <c:forEach items="${listAllCategories}" var="c">
                        <option value="${c.category__id}">${c.category__name}</option>
                    </c:forEach>
                </select>

                <label for="supplierId">Supplier: </label>
                <select id="supplierId" name="supplierId">
                    <c:forEach items="${listAllSuppliers}" var="s">
                        <option value="${s.supplier__id}">${s.company__name}</option>
                    </c:forEach>
                </select>

                <label for="quantityPerUnit">Quantity Per Unit</label>
                <input type="text" id="quantityPerUnit" name="quantityPerUnit" required>

                <label for="unitPrice">Unit Price</label>
                <input type="number" step="0.01" id="unitPrice" name="unitPrice" required>

                <label for="unitInStock">Quantity</label>
                <input type="number" id="unitInStock" name="unitInStock" required>

                <label for="quantitySold">Quantity Sold</label>
                <input type="hidden" id="quantitySold" name="quantitySold" value="0">

                <label for="starRating">Star rating</label>
                <input type="hidden" id="starRating" name="starRating" min="1" max="5" value="5">

                <label for="image">Image</label>
                <input type="file" id="image" name="image" accept="image/*" required>

                <label for="description">description</label>
                <textarea id="description" name="description" rows="3" required></textarea>


                <button type="submit">ADD</button>
            </form>
        </div>
    </body>
</html>
