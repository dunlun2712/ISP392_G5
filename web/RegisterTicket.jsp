<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Register Ticket</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f0f8ff;
                font-family: 'Arial', sans-serif;
            }
            .container {
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            }
            .form-group label {
                font-weight: bold;
                color: #333333;
            }
            .btn-custom {
                background-color: #28a745;
                border-color: #28a745;
                color: white;
            }
            .btn-custom:hover {
                background-color: #218838;
                border-color: #1e7e34;
            }
            .alert {
                margin-top: 20px;
                padding: 15px;
                background-color: #ff4d4d;
                color: white;
                border-radius: 5px;
                text-align: center;
            }
            .header {
                text-align: center;
                font-size: 2.5rem;
                font-weight: bold;
                background: linear-gradient(90deg, #ff8c00, #ff0080);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                margin-bottom: 20px;
            }
            .header::after {
                content: '';
                display: block;
                width: 60px;
                height: 4px;
                background-color: #ff8c00;
                margin: 10px auto 0;
                border-radius: 2px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2 class="header">Register Ticket</h2>

            <%-- Display error message if there is one --%>
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
            <% if (errorMessage != null) { %>
            <div class="alert"><%= errorMessage %></div>
            <% } %>

            <form action="registerTicket" method="post">
                <div class="form-group mb-3">
                    <label for="userId">User ID:</label>
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
