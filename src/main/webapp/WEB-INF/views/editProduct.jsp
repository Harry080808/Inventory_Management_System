<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>
<style>
/* Import a modern font from Google Fonts */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

body {
    font-family: 'Poppins', sans-serif;
    background-color: #f0f2f5;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    margin: 0;
}

.form-container {
    background-color: #ffffff;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 500px;
    box-sizing: border-box;
}

h2 {
    text-align: center;
    color: #333;
    font-weight: 600;
    font-size: 2em;
    margin-bottom: 30px;
}

form {
    display: flex;
    flex-direction: column;
}

.form-group {
    margin-bottom: 20px;
}

label {
    font-size: 1rem;
    color: #555;
    margin-bottom: 8px;
    display: block;
    font-weight: 400;
}

.image-preview {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 10px 0 20px 0;
}

.image-preview img {
    border-radius: 8px;
    border: 1px solid #ddd;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

input[type="text"],
input[type="file"] {
    width: 100%;
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 1rem;
    box-sizing: border-box;
    transition: border-color 0.3s ease;
}

input[type="text"]:focus,
input[type="file"]:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
}

input[type="file"] {
    padding: 5px;
}

input[type="submit"] {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 15px;
    border-radius: 5px;
    font-size: 1.1rem;
    font-weight: 600;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
    margin-top: 20px;
}

input[type="submit"]:hover {
    background-color: #0056b3;
    transform: translateY(-2px);
}
</style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Product</h2>
        <c:set var="product" value="${edit_product}"></c:set>
        <form action="/edit/${product.id}" method="post" enctype="multipart/form-data">
            <input type="hidden" name="srno" value="${product.id}">
            
            <div class="form-group">
                <label for="name">Product Name:</label>
                <input type="text" id="name" name="name" value="${product.name}">
            </div>
            
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="text" id="price" name="price" value="${product.price}">
            </div>
            
            <div class="form-group">
                <label for="quantity">Quantity:</label>
                <input type="text" id="quantity" name="quantity" value="${product.quantity}">
            </div>

            <div class="form-group">
                <label>Current Image:</label>
                <div class="image-preview">
                    <img src="/uploads/${product.imagePath}" width="120" height="120">
                </div>
            </div>
            
            <div class="form-group">
                <label for="imageFile">Upload New Image (optional):</label>
                <input type="file" id="imageFile" name="imageFile" accept="image/*">
            </div>

            <input type="submit" value="Update Product">
        </form>
    </div>
</body>
</html>