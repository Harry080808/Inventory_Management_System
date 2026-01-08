<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Confirmation</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #fdfdfd, #f3f3f3);
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        text-align: center;
        background: #fff;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        width: 400px;
    }

    .container img {
        max-width: 120px;
        margin-bottom: 20px;
    }

    h1 {
        color: #2ecc71;
        font-size: 24px;
        margin-bottom: 15px;
    }

    p {
        color: #555;
        font-size: 16px;
        margin-bottom: 25px;
    }

    .btn {
        display: inline-block;
        padding: 12px 20px;
        background: #2ecc71;
        color: white;
        text-decoration: none;
        border-radius: 8px;
        transition: background 0.3s ease;
    }

    .btn:hover {
        background: #27ae60;
    }
</style>
</head>
<body>
    <div class="container">
        <img alt="Amazon Inventory" src="amazon_side_inven - Edited.png">
        <h1>Order Placed Successfully ✅</h1>
        <p>Thank you for shopping with us!  
           Your order will be processed shortly.</p>
        <a href="orders.jsp" class="btn">View Orders</a>
    </div>
</body>
</html>
