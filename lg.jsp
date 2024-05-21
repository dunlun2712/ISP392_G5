<%-- 
    Document   : lg
    Created on : 20 May 2024, 22:55:14
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="container">
            <h2 style="margin-left: 110px">Login</h2>
            <form action="login" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                <button type="submit">Login</button>
                <a href="fg.jsp" style="margin-top: 10px;margin-left: 70px">Forgot Password?</a>
            </form>
            <p>Don't have an account? <a href="reg.jsp">Register here</a></p>
        </div>
    </body>
</html>
