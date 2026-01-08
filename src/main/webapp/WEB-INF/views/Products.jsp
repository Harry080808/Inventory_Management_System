<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Product List</title>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f4f7f6;
    margin: 0;
    padding: 0;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 50px;
}

.button-container {
    display: flex;
    gap: 15px;
}

.btn {
    padding: 12px 24px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    font-weight: 600;
    text-decoration: none;
    color: white;
    transition: background-color 0.3s ease;
}

.btn-add {
    background-color: #28a745;
}

.btn-add:hover {
    background-color: #218838;
}

.btn-dashboard {
    background-color: #007bff;
}

.btn-dashboard:hover {
    background-color: #0056b3;
}

h2 {
    text-align: center;
    color: #333;
    font-weight: 300;
    font-size: 2.5em;
    margin-top: 0;
    margin-bottom: 20px;
}

.table-container {
    width: 90%;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    border: 1px solid #ddd;
    padding: 15px;
    text-align: center;
}

th {
    background-color: #f8f9fa;
    color: #555;
    font-weight: 600;
    text-transform: uppercase;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #e9ecef;
}

img {
    border-radius: 8px;
    object-fit: cover; /* This makes sure the image fits nicely without distortion */
}

a {
    color: #007bff;
    text-decoration: none;
    font-weight: 500;
    transition: color 0.3s ease;
}

a:hover {
    color: #0056b3;
}

.edit-link {
    color: #ffc107;
}

.edit-link:hover {
    color: #e0a800;
}

.delete-link {
    color: #dc3545;
}

.delete-link:hover {
    color: #c82333;
}

</style>
</head>
<body>
    <div class="header">
        <a href="/addProductPage">
            <button class="btn btn-add"> + Add Product</button>
        </a>
        <a href="/backadmin">
            <button class="btn btn-dashboard">Back to Dashboard &rarr;</button>
        </a>
    </div>

    <h2>Product List</h2>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Image</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td>${product.price}</td>
                        <td>${product.quantity}</td>
                        <td><img src="/uploads/${product.imagePath}" width="100px" height="100px" /></td>
                        <td><a class="edit-link" href="/edit/${product.id}">Edit</a></td>
                        <td><a class="delete-link" href="<c:url value='/delete/${product.id}'/>">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>