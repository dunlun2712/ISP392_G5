<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="Dao.ItemDAO" %>
<%@page import="Model.Item" %>
<%@page import="Model.room_item" %>
<%@page import="Dao.Room_itemDAO" %>
<%
    String itemId = request.getParameter("itemId");
    String roomId = request.getParameter("roomId");
     Room_itemDAO rdao = new Room_itemDAO();
      room_item item = rdao.getDataById(itemId,roomId);
    
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Item</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 400px;
            }
            h1 {
                text-align: center;
                margin-bottom: 20px;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            label {
                margin-bottom: 5px;
                font-weight: bold;
            }
            input[type="text"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #28a745;
                border: none;
                border-radius: 4px;
                color: white;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            input[type="submit"]:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Edit Item</h1>
            <form action="updatequantity" method="post">
                
                <input type="hidden" name="roomid" value="<%=item.getRoom_id()%>">
                <input type="hidden" name="itemId" value="<%=item.getItem_id()%>">
                <div>
                    <label for="itemName">Name:</label>
                    <input type="text" id="itemName" name="itemName" value="<%=item.getItem_name()%>" readonly="">
                </div>
                <div>
                    <label for="category">Category:</label>
                    <input type="text" id="category" name="category" value="<%=item.getCategory()%>" readonly="">
                </div>
                <div>
                    <label for="price">Price:</label>
                    <input type="text" id="price" name="price" value="<%=item.getPrice()%>">
                </div>
                <div>
                    <label for="price">Quantity:</label>
                    <input type="text" id="quantity" name="quantity" value="<%=item.getQuantity()%>"  min="0" step="1" oninput="validateQuantity(this)">
                </div>

                <input type="submit" value="Update">
            </form>
        </div>
        <script>
            function validateQuantity(input) {
                if (input.value < 0 || !Number.isInteger(Number(input.value))) {
                    input.setCustomValidity("Please enter a non-negative integer.");
                } else {
                    input.setCustomValidity("");
                }
            }
        </script>
    </body>
</html>
