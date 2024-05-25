<%-- 
    Document   : test
    Created on : May 21, 2024, 7:52:09 AM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/viewprofile">
            <input type="text" name="email" value="nguyenvana@example.com">
            <input type="submit"></form>
    </body>
</html>
