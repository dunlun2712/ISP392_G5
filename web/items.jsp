<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Items List</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                background-color: #f4f4f4;
            }
            h1, h2 {
                color: #333;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            a {
                text-decoration: none;
                color: #3498db;
            }
            a:hover {
                text-decoration: underline;
            }
            form {
                background: #fff;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
                max-width: 400px;
            }
            input[type="text"], input[type="submit"] {
                width: 100%;
                padding: 10px;
                margin: 5px 0 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }
            input[type="submit"] {
                background-color: #3498db;
                color: #fff;
                border: none;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #2980b9;
            }
        </style>
    </head>
    <body>
        <h1>Items List</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="item" items="${items}">
                <tr>
                    <td>${item.getItem_id()}</td>
                    <td>${item.getItem_name()}</td>
                    <td>${item.getCategory()}</td>
                    <td>${item.getPrice()}</td>
                    <td>
                        <a href="editItem.jsp?itemId=${item.getItem_id()}">Edit</a> | 
                        <a href="deleteItem?itemId=${item.getItem_id()}" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h2>Add New Item</h2>
        <form action="createItem" method="post">
            Name: <input type="text" name="itemName" required><br>
            Category: <input type="text" name="category" required><br>
            Price: <input type="text" name="price" required><br>
            <input type="submit" value="Add">
        </form>
    </body>
</html>
