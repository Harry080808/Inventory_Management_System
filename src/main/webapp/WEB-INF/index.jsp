<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>

<style>
/* Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* Body with vibrant animated gradient */
body {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(135deg, #ff7eb3, #ff758c, #ffb199, #ffdac1);
    background-size: 400% 400%;
    animation: gradientBG 12s ease infinite;
}

@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* Container */
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
    width: 300px;
}

.form-section h2 {
    margin-bottom: 20px;
    font-size: 24px;
    color: #222;
    text-align: center;
}

.form-section label {
    font-weight: bold;
    display: block;
    margin: 10px 0 5px;
    color: #444;
}

.form-section input,
.form-section select {
    width: 100%;
    padding: 10px;
    border: 2px solid #ddd;
    border-radius: 8px;
    font-size: 14px;
    transition: 0.3s;
}

.form-section input:focus,
.form-section select:focus {
    border-color: #ff758c;
    outline: none;
}

/* Button */
.form-section input[type="submit"] {
    width: 100%;
    margin-top: 15px;
    padding: 12px;
    border: none;
    border-radius: 8px;
    background: linear-gradient(135deg, #ff758c, #ff7eb3);
    color: white;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

.form-section input[type="submit"]:hover {
    transform: scale(1.05);
    background: linear-gradient(135deg, #ff4e7a, #ff6584);
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

    <!-- Form Section -->
    <div class="form-section">
        <h2>User SignUp</h2>
        <form action="/Registration" method="post">
            <label>Enter Username:</label>
            <input type="text" name="username" placeholder="Harry23" required>

            <label>Enter Password:</label>
            <input type="password" name="password" placeholder="Harry@23" required>

            <label>Enter Email-ID:</label>
            <input type="email" name="email" placeholder="abc12@gmail.com" required>

            <label>Select Role:</label>
            <select name="role" required>
                <option value="">- select -</option>
                <option value="admin">Admin</option>
                <option value="customer">Customer</option>
            </select>

            <input type="submit" value="Submit">
        </form>
    </div>
</div>

</body>
</html>
