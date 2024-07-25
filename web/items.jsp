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
                animation: fadeIn 1s ease-in;
                overflow: hidden;
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 0.5;
                }
            }
            .content {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                background: #fff;
                padding: 20px;
                border-radius: 10px;
                width: 80%;
                max-width: 1200px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                animation: slideIn 0.5s ease-out;
                position: relative;
                overflow: hidden;
                margin: auto;
                margin-top: 50px;
            }
            @keyframes slideIn {
                from {
                    transform: translateY(20px);
                }
                to {
                    transform: translateY(0);
                }
            }
            h1 {
                color: #333;
                margin-bottom: 20px;
                text-align: center;
                font-size: 2em;
                animation: fadeIn 1.5s ease-in;
                position: relative;
                display: inline-block;
            }
            h1::after {
                content: '';
                width: 100%;
                height: 4px;
                background: #3498db;
                position: absolute;
                bottom: -10px;
                left: 0;
                transform: scaleX(0);
                transform-origin: bottom right;
                transition: transform 0.5s ease-out;
            }
            h1:hover::after {
                transform: scaleX(1);
                transform-origin: bottom left;
            }
            .button, .button-alt {
                display: inline-block;
                padding: 10px 20px;
                background-color: #3498db;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
                text-align: center;
                margin: 10px;
                cursor: pointer;
                animation: fadeIn 1s ease-in;
                position: relative;
                overflow: hidden;
            }
            .button::before, .button-alt::before {
                content: '';
                position: absolute;
                top: 50%;
                left: 50%;
                width: 300%;
                height: 300%;
                background-color: rgba(255, 255, 255, 0.2);
                transition: width 0.4s ease, height 0.4s ease, top 0.4s ease, left 0.4s ease;
                border-radius: 50%;
                z-index: 0;
                transform: translate(-50%, -50%);
            }
            .button:hover::before, .button-alt:hover::before {
                width: 0;
                height: 0;
                top: 50%;
                left: 50%;
            }
            .button:hover, .button-alt:hover {
                background-color: #2980b9;
                transform: scale(1.05);
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            }
            .button-container {
                display: flex;
                justify-content: space-between;
                width: 100%;
                max-width: 600px;
                margin-bottom: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
                background-color: #fff;
                color: #333;
                animation: fadeIn 1.5s ease-in;
                position: relative;
                z-index: 1;
            }
            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
                transition: background-color 0.3s ease, color 0.3s ease;
            }
            th {
                background-color: #f4f4f4;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            tr:hover td {
                background-color: #f1f1f1;
                color: #3498db;
            }
            a {
                text-decoration: none;
                color: #3498db;
                transition: color 0.3s ease;
            }
            a:hover {
                text-decoration: underline;
                color: #2980b9;
            }
            form {
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
                animation: fadeIn 1.5s ease-in;
            }
            input[type="text"] {
                padding: 10px;
                width: 300px;
                border: 1px solid #ddd;
                border-radius: 5px 0 0 5px;
                outline: none;
                transition: border-color 0.3s ease, box-shadow 0.3s ease;
                position: relative;
                z-index: 1;
            }
            input[type="text"]:focus {
                border-color: #3498db;
                box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
            }
            button[type="submit"] {
                border: none;
                padding: 10px 20px;
                background-color: #3498db;
                color: #fff;
                border-radius: 0 5px 5px 0;
                cursor: pointer;
                transition: background-color 0.3s ease, transform 0.3s ease;
                position: relative;
                z-index: 1;
            }
            button[type="submit"]:hover {
                background-color: #2980b9;
                transform: scale(0.3);
            }
            .no-underline a {
                text-decoration: none;
                color: black;
                font-size: 25px;
            }
            .no-underline a:hover, .no-underline a:focus, .no-underline a:active {
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="content">
           <div class="no-underline">
                <a href="dormmanager">Menu</a>
            </div>
            <h1>Items List</h1>
            <form method="post" action="searchItem">

                <input type="text" name="search"  placeholder="Search for items..."/>
                <button type="submit" class="button" style="background-color: #E9AD28" value="${search}">Search</button> 
                <div >
                    <a class="button-alt" style="background-color: #E9AD28" href="addItem.jsp">Add New Item</a>
                    <a class="button-alt" style="background-color: #E9AD28" href="listRoom">Item By Room</a>
                </div>
            </form>

            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Actions</th>
                </tr>
                <c:forEach var="item" items="${items}">
                    <tr>
                        <td>${item.getItem_id()}</td>
                        <td>${item.getItem_name()}</td>
                        <td>${item.getCategory()}</td>
                        <td>${item.getPrice()}</td>
                        <td>${item.getQuantity()}</td>
                        <td>
                            <a href="editItem.jsp?itemId=${item.getItem_id()}">Edit</a>
                            <!-- <a href="deleteItem?itemId=${item.getItem_id()}" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a> -->
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
