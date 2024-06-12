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
</head>
<body>
    <h2>OTP Verification</h2>
    <form action="otpVerification" method="post">
        <label for="otp">Enter OTP:</label>
        <input type="text" id="otp" name="otp" required>
        <button type="submit">Verify</button>
    </form>
    <c:if test="${not empty mess}">
        <p style="color:red">${mess}</p>
    </c:if>
</body>
</html>
