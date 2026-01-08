<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<style>
/* Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* Background with gradient */
body {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(135deg, #36d1dc, #5b86e5, #89f7fe, #66a6ff);
    background-size: 400% 400%;
    animation: gradientBG 12s ease infinite;
}

@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* Main container */
.container {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 80px;
    padding: 40px 60px;
    background: rgba(255, 255, 255, 0.9);
    border-radius: 20px;
    box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
}

/* Logo section */
.logo-section {
    text-align: center;
}

.logo-section img {
    width: 200px;
    margin-bottom: 15px;
}

.logo-section h1 {
    font-size: 32px;
    font-weight: bold;
    color: #333;
    line-height: 1.2;
}

/* Form section */
.form-section {
    width: 280px;
}

.form-section h2 {
    margin-bottom: 20px;
    font-size: 24px;
    color: #222;
    text-align: center;
}

.form-section input {
    width: 100%;
    padding: 10px;
    border: 2px solid #ddd;
    border-radius: 8px;
    font-size: 14px;
    margin-bottom: 15px;
    transition: 0.3s;
}

.form-section input:focus {
    border-color: #5b86e5;
    outline: none;
}

/* Button */
.form-section input[type="submit"] {
    background: linear-gradient(135deg, #36d1dc, #5b86e5);
    color: white;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    border: none;
    transition: 0.3s;
}

.form-section input[type="submit"]:hover {
    transform: scale(1.05);
    background: linear-gradient(135deg, #2580d0, #4e9fe0);
}
</style>

</head>
<body>

<div class="container">
    <!-- Logo Section -->
    <div class="logo-section">
        <img alt="Inventory Hub" src="inventory_hub.png">
        <h1>INVENTORY<br>HUB</h1>
    </div>

    <!-- Login Form -->
    <div class="form-section">
        <h2>User Login</h2>
        <form action="/login" method="get">
            <input type="email" name="email" placeholder="Enter Email" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="submit" value="Login">
        </form>
    </div>
</div>

</body>
</html>
