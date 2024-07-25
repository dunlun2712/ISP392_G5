<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Item</title>
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
            max-width: 600px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin: 20px 0;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .form-group {
            margin-bottom: 15px;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: black;
        }
        input[type="text"], input[type="number"], input[type="date"], select {
            padding: 10px;
            width: 100%;
            max-width: 100%;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: whitesmoke;
            outline: none;
            box-sizing: border-box;
        }
        .hidden {
            display: none;
        }
        button[type="submit"] {
            padding: 10px 20px;
            border: none;
            background-color: #3498db;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
    <script>
        function updateItemDetails() {
            var select = document.getElementById('itemSelect');
            var selectedOption = select.options[select.selectedIndex];
            var itemDetails = document.getElementById('itemDetails');

            if (selectedOption.value) {
                var itemName = selectedOption.getAttribute('data-name');
                var itemCategory = selectedOption.getAttribute('data-category');
                var itemPrice = selectedOption.getAttribute('data-price');
                var itemId = selectedOption.getAttribute('data-item-id'); // Lấy giá trị item_id

                document.getElementById('itemName').value = itemName;
                document.getElementById('itemCategory').value = itemCategory;
                document.getElementById('itemPrice').value = itemPrice;
                document.getElementById('itemId').value = itemId; // Gán giá trị item_id vào input hidden

                itemDetails.classList.remove('hidden');
            } else {
                document.getElementById('itemName').value = '';
                document.getElementById('itemCategory').value = '';
                document.getElementById('itemPrice').value = '';
                document.getElementById('itemId').value = ''; // Đặt lại giá trị item_id khi không có mục được chọn

                itemDetails.classList.add('hidden');
            }
        }
    </script>
</head>
<body>
<form action="updateItemRoom" method="post">
    <div class="content">
        <h1>Update Item</h1>
        <div class="form-group">
            <label>Room ID:</label>
            <input type="text" name="room_id" value="${room.room_id}" readonly>
        </div>
        <div class="form-group">
            <label>Room Type:</label>
            <input type="text" value="${room.room_type}" readonly>
        </div>

        <div class="form-group">
            <label>Choose Item:</label>
            <select id="itemSelect" name="itemSelect" onchange="updateItemDetails()">
                <option value="">Select an item</option>
                <c:forEach var="item" items="${items}">
                    <option value="${item.item_id}" data-name="${item.item_name}" data-category="${item.category}" data-price="${item.price}" data-item-id="${item.item_id}">${item.item_name}</option>
                </c:forEach>
            </select>
        </div>
        <div id="itemDetails" class="hidden">
            <div class="form-group">
                <label>Name of item:</label>
                <input type="text" id="itemName" name="itemName" readonly>
            </div>
            <div class="form-group">
                <label>Category:</label>
                <input type="text" id="itemCategory" name="category" readonly>
            </div>
            <div class="form-group">
                <label>Price:</label>
                <input type="number" id="itemPrice" name="price" readonly>
            </div>
            <div class="form-group">
                <label>Item ID:</label>
                <input type="text" id="itemId" name="itemId" readonly>
            </div>
            <div class="form-group">
                <label>Quantity:</label>
                <input type="number" name="quantity" min="0" step="1" oninput="validateQuantity(this)">
            </div>
        </div>
        <button type="submit">Update</button>

        <div>${mess}</div>
    </div>
</form>
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
