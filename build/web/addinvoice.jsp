<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Invoice</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>Create New Invoice</h2>
    <form action="addinvoice" method="post">
        <div class="form-group">
            <label for="invoice_id">Invoice ID:</label>
            <input type="text" class="form-control" id="invoice_id" name="invoice_id" value="${id}" required>
        </div>
        <div class="form-group">
            <label for="users_id">User ID:</label>
            <input type="text" class="form-control" id="users_id" name="users_id" required>
            <c:if test="${not empty userIdError}">
                <small class="text-danger">${userIdError}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="room_id">Room ID:</label>
            <input type="text" class="form-control" id="room_id" name="room_id" required>
            <c:if test="${not empty roomIdError}">
                <small class="text-danger">${roomIdError}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="createdDate">Created Date:</label>
            <input type="date" class="form-control" id="createdDate" name="createdDate" value="${date}" required>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <input type="text" class="form-control" id="description" name="description" required>
        </div>
        <div class="form-group">
            <label for="paymentType">Payment Type:</label>
            <input type="text" class="form-control" id="paymentType" name="paymentType" required>
        </div>
        <div class="form-group">
            <label for="status">Status:</label>
            <input type="text" class="form-control" id="status" name="status" required>
        </div>
        <div class="form-group">
            <label for="totalPayment">Total Payment:</label>
            <input type="number" class="form-control" id="totalPayment" name="totalPayment" step="0.01" required>
        </div>
        <button type="submit" class="btn btn-primary">Create Invoice</button>
    </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
