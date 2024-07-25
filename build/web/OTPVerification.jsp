<%-- 
    Document   : OTPVerification
    Created on : Jun 3, 2024, 10:08:45 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>OTP Verification</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: 'Arial', sans-serif;
        }
        .verification-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        .verification-container h2 {
            margin-bottom: 20px;
            color: #007bff;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .form-label {
            font-weight: bold;
        }
        .form-control {
            border-radius: 5px;
        }
        .message {
            color: red;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="verification-container">
        <h2><i class="fas fa-lock"></i> OTP Verification</h2>
        <form action="otpVerification" method="post">
            <div class="mb-3 text-start">
                <label for="otp" class="form-label"><i class="fas fa-key"></i> Enter OTP:</label>
                <input type="text" id="otp" name="otp" class="form-control" placeholder="Enter your OTP" required>
            </div>
            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary"><i class="fas fa-check"></i> Verify</button>
            </div>
        </form>
        <c:if test="${not empty mess}">
            <p class="message">${mess}</p>
        </c:if>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
