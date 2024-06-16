<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <title>Electricity Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        form {
            background-color: #fff;
            padding: 20px;
            margin: 20px 0;
            border: 1px solid #ccc;
        }
        form div {
            margin-bottom: 10px;
        }
        form label {
            display: block;
            margin-bottom: 5px;
        }
        form input[type="text"], form input[type="number"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        form button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        form button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Electricity Usage</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>User ID</th>
                    <th>Room ID</th>
                    <th>Usage</th>
                    <th>Month</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ResultSet electricityList = (ResultSet) request.getAttribute("electricityList");
                    try {
                        while (electricityList != null && electricityList.next()) {
                            out.println("<tr>");
                            out.println("<td>" + electricityList.getInt("e_id") + "</td>");
                            out.println("<td>" + electricityList.getString("users_id") + "</td>");
                            out.println("<td>" + electricityList.getString("room_id") + "</td>");
                            out.println("<td>" + electricityList.getBigDecimal("e_usage") + "</td>");
                            out.println("<td>" + electricityList.getString("month") + "</td>");
                            out.println("</tr>");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>

        <form action="electricity" method="post">
            <div>
                <label for="users_id">User ID</label>
                <input type="text" id="users_id" name="users_id" required>
            </div>
            <div>
                <label for="room_id">Room ID</label>
                <input type="text" id="room_id" name="room_id" required>
            </div>
            <div>
                <label for="e_usage">Usage</label>
                <input type="number" id="e_usage" name="e_usage" step="0.01" required>
            </div>
            <div>
                <label for="month">Month</label>
                <input type="text" id="month" name="month" required>
            </div>
            <button type="submit">Add Usage</button>
        </form>
    </div>
</body>
</html>
