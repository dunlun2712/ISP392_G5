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
                padding: 0;
                background-color: #f0f0f0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .content {
                background: #fff;
                padding: 20px;
                border-radius: 10px;
                width: 80%;
                max-width: 1200px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                margin: 20px 0;
            }
            h1 {
                color: #333;
                margin-bottom: 20px;
                text-align: center;
            }
            .button, .button-alt {
                display: inline-block;
                padding: 10px 20px;
                margin-bottom: 20px;
                background-color: #3498db;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
                text-align: center;
                margin: 0 10px;
            }
            .button:hover, .button-alt:hover {
                background-color: #2980b9;
            }
            .button-alt {
                background-color: #2ecc71;
            }
            .button-alt:hover {
                background-color: #27ae60;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
                background-color: #fff;
                color: #333;
            }
            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #f4f4f4;
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
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
            }
            input[type="text"] {
                padding: 10px;
                width: 300px;
                border: 1px solid #ddd;
                border-radius: 5px 0 0 5px;
                outline: none;
            }
            button[type="submit"] {
                border: none;
                padding: 10px 20px;
                border-radius: 0 5px 5px 0;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="content">
            <h1>Items List</h1>
            <form method="post" action="searchItem">
                <input type="text" name="search" placeholder="Search for items..."value="${search}"/>
                <button type="submit" class="button" >Search</button>

            </form>

            <!--            <a class="button-alt" href="addItem.jsp">Add New Item</a>-->
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <!--                    <th>Actions</th>-->
                </tr>
                <c:forEach var="item" items="${items}">
                    <tr>
                        <td>${item.getItem_id()}</td>
                        <td>${item.getItem_name()}</td>
                        <td>${item.getCategory()}</td>
                        <td>${item.getPrice()}</td>
                        <td>${item.getQuantity()}</td>
                        <!--                        <td>
                                                    <a href="editItem.jsp?itemId=${item.getItem_id()}">Edit</a> | 
                                                    <a href="deleteItem?itemId=${item.getItem_id()}" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a> 
                                                </td>-->
                    </tr>
                </c:forEach>
            </table>
            <a href="listItems">Back</a>
        </div>
    </body>
</html>

