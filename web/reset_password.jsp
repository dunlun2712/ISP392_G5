<%-- 
    Document   : reset_password
    Created on : 19 May 2024, 14:05:11
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Reset Password</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f2f5;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .container {
                background-color: #fff;
                padding: 20px 40px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            h2 {
                margin-bottom: 20px;
                color: #333;
            }
            label {
                display: block;
                margin-bottom: 8px;
                color: #666;
            }
            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #4CAF50;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            .message {
                background-color: buttonshadow;
                color: red;
                padding: 10px;
                border-radius: 4px;
                margin-top: 10px;
                display: block;
            }
            back-button {
                width: 100%;
                padding: 10px;
                background-color: #ccc;
                color: #333;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                text-decoration: none;
                display: inline-block;
                text-align: center;
                margin-top: 10px;
            }
            .back-button:hover {
                background-color: #bbb;
            }
            .message {
                background-color: buttonshadow;
                color: red;
                padding: 10px;
                border-radius: 4px;
                margin-top: 10px;
                display: block;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Reset Password</h2>
            <form action="reset_password" method="post">
                <label for="password">New Password:</label>
                <input type="password" id="password" name="password" required>
                <label for="confirm-password">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
                <input type="submit" value="Reset Password">
                <a href="homeservlet" class="back-button">Back</a>
                <%
                    if (request.getAttribute("mess") != null) {
                %>
                    <div class="message"><%= request.getAttribute("mess") %></div>
                <%
                    }
                %>
            </form>
        </div>
    </body>
</html>
