<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Orders</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f9f9f9;
        margin: 0;
        padding: 0;
    }

    header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 20px;
        background: white;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    header img {
        height: 80px;
    }

    .orderHisBtn {
        padding: 10px 20px;
        border: none;
        border-radius: 6px;
        background: #0073e6;
        color: white;
        font-weight: bold;
        cursor: pointer;
        transition: background 0.3s;
    }

    .orderHisBtn:hover {
        background: #005bb5;
    }

    .product_container {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 20px;
        padding: 30px;
    }

    .product_card {
        background: white;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        padding: 15px;
        text-align: center;
        transition: transform 0.2s ease;
    }

    .product_card:hover {
        transform: translateY(-5px);
    }

    .product_card img {
        width: 100%;
        height: 200px;
        object-fit: contain;
        margin-bottom: 10px;
    }

    .product_name {
        font-size: 18px;
        font-weight: bold;
        margin: 10px 0;
    }

    .product_price {
        font-size: 16px;
        color: #444;
        margin-bottom: 12px;
    }

    .quantity_input {
        width: 60px;
        padding: 5px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        text-align: center;
    }

    .placeOrderBtn {
        display: inline-block;
        padding: 10px 20px;
        border: none;
        border-radius: 25px;
        font-size: 14px;
        font-weight: bold;
        cursor: pointer;
        background: linear-gradient(to bottom, #ff80aa, #cc0066);
        color: white;
        transition: transform 0.2s ease;
    }

    .placeOrderBtn:hover {
        transform: scale(1.05);
    }
</style>
</head>
<body>
    <header>
        <img alt="Amazon Inventory" src="amazon_side_inven - Edited.png">
        <form action="/orderhistory" method="get">
            <button type="submit" class="orderHisBtn">My Orders</button>
        </form>
    </header>

    <div class="product_container">
        <c:forEach var="product" items="${List_Pro}">
            <div class="product_card">
                <img alt="P_img" src="uploads/${product.imagePath}">
                <div class="product_name">${product.name}</div>
                <div class="product_price">$${product.price}</div>
                <form action="/Placeorder" method="post">
                    <input type="hidden" name="productId" value="${product.id}">
                    <input type="number" min="1" name="quantity" value="1" 
                           max="${product.quantity}" class="quantity_input">
                    <br>
                    <button type="submit" class="placeOrderBtn">Place Order</button>
                </form>
            </div>
        </c:forEach>
    </div>
</body>
</html>
