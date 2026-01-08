<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f4f6f9;
        text-align: center;
        padding: 50px;
    }

    h1 {
        margin-bottom: 40px;
        color: #333;
        font-weight: 600;
    }

    .btn {
        display: inline-block;
        padding: 15px 30px;
        margin: 15px;
        font-size: 20px;
        font-weight: bold;
        text-decoration: none;
        color: white;
        background-color: #007bff;
        border-radius: 8px;
        transition: background-color 0.3s ease, transform 0.2s ease;
        font-family: 'Poppins', sans-serif;
    }

    .btn:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    .btn:active {
        background-color: #004085;
    }

    .btn-danger {
        background-color: #dc3545;
    }

    .btn-danger:hover {
        background-color: #a71d2a;
    }
</style>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
    <h1>Admin Dashboard</h1>

    <a href="/products" class="btn">Manage Products</a>
    <a href="/orders" class="btn">View Orders</a>
    <a href="/backlogin" class="btn btn-danger">Back to Login</a>

</body>
</html>
