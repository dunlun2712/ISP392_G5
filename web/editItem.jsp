<%-- 
    Document   : editItem
    Created on : 26 May 2024, 23:44:55
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, your.package.name.ItemDAO, your.package.name.Item"%>
<%
    int itemId = Integer.parseInt(request.getParameter("itemId"));
    ItemDAO itemDAO = new ItemDAO();
    Item item = null;
    try {
        item = itemDAO.getItemById(itemId);
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edit Item</h1>
        <form action="updateItem" method="post">
            <input type="hidden" name="itemId" value="<%=item.getItemId()%>">
            Name: <input type="text" name="itemName" value="<%=item.getItemName()%>"><br>
            Category: <input type="text" name="category" value="<%=item.getCategory()%>"><br>
            Price: <input type="text" name="price" value="<%=item.getPrice()%>"><br>
            <input type="submit" value="Update">
        </form>
    </body>
</html>
