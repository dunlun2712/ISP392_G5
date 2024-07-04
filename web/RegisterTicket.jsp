<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register Ticket</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-custom {
            background-color: #007bff;
            border-color: #007bff;
            color: white;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .alert {
            margin-top: 20px;
            padding: 15px;
            background-color: #f44336;
            color: white;
            border-radius: 5px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Register Ticket</h2>
        
        <%-- Hiển thị thông báo nếu có lỗi --%>
<!--        <c:if test="${not empty errorMessage}">
            <div class="alert">${errorMessage}</div>
        </c:if>
        -->
        <form action="registerTicket" method="post">
            <div class="form-group mb-3">
                <label for="userId">Student ID:</label>
                <input type="text" class="form-control" id="userId" name="userId" required>
            </div>
            
            <div class="form-group mb-3">
                <label for="vehicleNumber">Vehicle Number:</label>
                <input type="text" class="form-control" id="vehicleNumber" name="vehicleNumber" required>
            </div>
            
            <div class="form-group mb-3">
                <label for="issueDate">Issue Date:</label>
                <input type="date" class="form-control" id="issueDate" name="issueDate" required>
            </div>
            
            <div class="form-group mb-3">
                <label for="expiryDate">Expiry Date:</label>
                <input type="date" class="form-control" id="expiryDate" name="expiryDate" required>
            </div>
            
            <div class="form-group mb-3">
                <label for="price">Price:</label>
                <input type="text" class="form-control" id="price" name="price" required>
            </div>
            
            <div class="form-group mb-3">
                <label for="status">Status:</label>
                <input type="text" class="form-control" id="status" name="status" required>
            </div>
            
            <button type="submit" class="btn btn-custom btn-block">Register</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
