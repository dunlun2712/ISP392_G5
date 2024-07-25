<%-- 
    Document   : addItem
    Created on : 6 Jun 2024, 21:51:33
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Item</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f5;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .form-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
                text-align: center;
            }
            h2 {
                margin-bottom: 20px;
                color: #333;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            input[type="text"] {
                margin-bottom: 10px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 14px;
            }
            input[type="submit"] {
                background-color: #007bff;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h2>Add New Item</h2>
            <form action="createItem" method="post">
                <input type="text" name="itemName" placeholder="Name" required>
                <input type="text" name="category" placeholder="Category" required>
                <input type="text" name="price" placeholder="Price" required>
                <input type="text" name="quantity" placeholder="Quantity" required>
                <input type="submit" style="background-color: #E9AD28" value="Add">
            </form>
        </div>
    </body>
</html>
