<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Orders</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f4f7fa;
        margin: 0;
        padding: 20px;
    }

    h1 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    .orders-table {
        width: 80%;
        margin: 0 auto;
        border-collapse: collapse;
        background: #fff;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        border-radius: 10px;
        overflow: hidden;
    }

    .orders-table thead {
        background: #007bff;
        color: #fff;
    }

    .orders-table th, 
    .orders-table td {
        padding: 12px 15px;
        text-align: center;
    }

    .orders-table tr:nth-child(even) {
        background: #f9f9f9;
    }

    .orders-table tr:hover {
        background: #f1f1f1;
    }

    .action-btn {
        padding: 6px 12px;
        margin: 2px;
        border-radius: 6px;
        border: none;
        cursor: pointer;
        font-weight: bold;
        transition: all 0.3s ease;
    }

    .edit-btn {
        background: #ffc107;
        color: #000;
    }

    .edit-btn:hover {
        background: #e0a800;
    }

    .delete-btn {
        background: #dc3545;
        color: white;
    }

    .delete-btn:hover {
        background: #c82333;
    }

    .center {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
</style>
</head>
<body>
    <h1>Manage Customer Orders</h1>

    <table class="orders-table">
        <thead>
            <tr>
                <th>Order Id</th>
                <th>Product Id</th>
                <th>User Id</th>
                <th>Quantity</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="C_orders" items="${CustomerO}">
            <tr>
                <td>${C_orders.id}</td>
                <td>${C_orders.productId}</td>
                <td>${C_orders.userId}</td>
                <td>${C_orders.quantity}</td>
                <td>
                    <!-- Delete button -->
                    <form action="/deleteOrder" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${C_orders.id}">
                        <button type="submit" class="action-btn delete-btn"
                                onclick="return confirm('Are you sure you want to delete this order?');">
                            Delete
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
