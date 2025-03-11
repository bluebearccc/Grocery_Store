<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }

            select {
                width: 32.3%;
                margin: 0;
                font-size: 100%;
                padding: 5px 10px 5px 10px;
                font-family: Segoe UI, Helvetica, sans-serif;
                border: 1px solid #D0D0D0;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                border-radius: 20px;
                outline: none;
            }
        </style>
    <body>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog" style="width: 100%">
                    <div class="modal-content">
                        <form id="form" action="AdminProductController?action=submitEdit" method="post">

                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Product</h4>
                                <a href="manager">
                                    <button style="position: absolute; right: 20px; top: 20px; color: black" type="button" class="close" data-dismiss="modal" 
                                            aria-hidden="true">&times;
                                    </button> 
                                </a>
                            </div>
                            
                            <div class="modal-body">	
                                
                                <div class="form-group">
                                    <input value="${findProduct.product__id}" name="id" type="hidden" class="form-control" readonly required>
                                </div>
                                
                                <div class="form-group">
                                    <label>Product Name</label>
                                    <input value="${findProduct.product__name}" name="name" type="text" class="form-control" required>
                                </div>
                                
                                <div class="form-group">
                                    <label>Price</label>
                                    <input value="${findProduct.unit__price}" name="price" type="number" step="0.01" min="0" class="form-control" >
                                </div>
                                
                                <div class="form-group">
                                    <label>Describe</label>
                                    <input style="height: 200px" name="describe" class="form-control" required value="${findProduct.describe}">
                                </div>
                                
                                <div class="form-group">
                                    <label>Quantity per unit</label>
                                    <input name="quantityperunit" class="form-control" value="${findProduct.quantity__per__unit}">
                                </div>
                                
                                <div class="form-group">
                                    <label>Cate</label>
                                    <select name="category" class="form-select">
                                        <c:forEach items="${listAllCategories}" var="o">
                                            <option value="${o.category__id}" ${o.category__id == findProduct.category__id ? 'selected' : ''}>${o.category__name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                <div class="form-group">
                                    <label>Supplier</label>
                                    <select name="supplier" class="form-select">
                                        <c:forEach items="${listAllSuppliers}" var="o">
                                            <option value="${o.supplier__id}" ${o.supplier__id == findProduct.supplier__id ? 'selected' : ''}>${o.company__name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                            </div>
                                
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>