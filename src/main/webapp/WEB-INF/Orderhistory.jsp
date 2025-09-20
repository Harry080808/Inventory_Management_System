<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Orders</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f4f6f9;
        margin: 0;
        padding: 0;
    }

    h1 {
        text-align: center;
        padding: 20px;
        color: #2c3e50;
    }

    .product_container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 20px;
        padding: 20px;
        max-width: 1200px;
        margin: 0 auto;
    }

    .product_card {
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        padding: 15px;
        text-align: center;
        transition: transform 0.2s ease;
    }

    .product_card:hover {
        transform: translateY(-5px);
    }

    .productImage img {
        max-width: 100%;
        height: 180px;
        object-fit: contain;
        margin-bottom: 10px;
    }

    .productName {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 8px;
        color: #34495e;
    }

    .productQuantity,
    .productPrice {
        font-size: 15px;
        color: #555;
        margin-bottom: 6px;
    }

    .deletePro a {
        display: inline-block;
        padding: 8px 16px;
        background: #e74c3c;
        color: white;
        border-radius: 6px;
        text-decoration: none;
        font-size: 14px;
        transition: background 0.3s ease;
    }

    .deletePro a:hover {
        background: #c0392b;
    }
</style>
</head>
<body>
    <h1>Your Order History</h1>
    <div class="product_container">
        <c:forEach var="orderedPro" items="${orderedPro}">
            <div class="product_card">
                <div class="productImage">
                    <img alt="ProductPic" src="uploads/${orderedPro.pro_imagepath}">
                </div>
                <div class="productName">${orderedPro.pro_name}</div>
                <div class="productQuantity">Quantity: ${orderedPro.pro_quantity}</div>
                <div class="productPrice">Price: ₹${orderedPro.pro_price}</div>
                <div class="deletePro">
                    <a href="<c:url value='/deleteOrder'>
                                <c:param name='id' value='${orderedPro.id}'/>
                             </c:url>">Delete</a>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
