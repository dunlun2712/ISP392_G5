<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Edit Electricity</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #e8f5e9;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                height: 100vh;
                color: #2e7d32;
            }
            h1 {
                color: #1b5e20;
            }
            form {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                width: 60%;
                margin: 20px 0;
            }
            table {
                width: 100%;
            }
            td {
                padding: 10px;
            }
            input[type="text"], input[type="date"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                background-color: #66bb6a;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s, transform 0.3s;
            }
            input[type="submit"]:hover {
                background-color: #338a3e;
                transform: scale(1.05);
            }
            .form-section {
                display: flex;
                justify-content: space-between;
            }
            .form-section div {
                width: 48%;
            }
            a {
                text-decoration: none;
                color: #388e3c;
                font-weight: bold;
                margin-top: 20px;
                transition: color 0.3s;
            }
            a:hover {
                color: #1b5e20;
            }
        </style>
    </head>
    <body>
        <h1>Edit Water</h1>
        <form action="${pageContext.request.contextPath}/editWater" method="post">
            <input type="hidden" name="water_id" value="${water.water_id}">
            <div class="form-section">
                <div>
                    <table>
                        <tr><td>Room ID:</td><td><input type="text" name="room_id" value="${water.room_id}" readonly=""></td></tr>
                        <tr><td>Usage Type:</td><td><input type="text" name="usage_type" value="${water.usage_type} " readonly=""></td></tr>
                        <tr><td>Creation Date:</td><td><input type="date" name="creation_date" value="${water.creation_date}" readonly=""></td></tr>
                        <tr><td>Expiration Date:</td><td><input type="date" name="expiration_date" value="${water.expiration_date}" readonly=""></td></tr>
                        <tr><td>Semester:</td><td><input type="text" name="semester" value="${water.semester}" readonly=""></td></tr>
                    </table>
                </div>
                <div>
                    <table>
                        
                        <tr><td>Meter Number:</td><td><input type="text" name="meter_number" value="${water.meter_number}" readonly=""></td></tr>
                        <tr><td>Consumption:</td><td><input type="number" pattern="^[0-9]*\.?[0-9]+$" min="0" name="consumption" value="${water.consumption}"></td></tr>
                        <tr><td>Old Number:</td><td><input type="number" pattern="^[0-9]*\.?[0-9]+$" min="0" name="old_reading" value="${water.old_reading}"></td></tr>
                        <tr><td>New Number:</td><td><input type="number" pattern="^[0-9]*\.?[0-9]+$" min="0" name="new_reading" value="${water.new_reading}"></td></tr>
                    </table>
                </div>
            </div>
            <div style="text-align: center;">
                <input type="submit"  value="Update">
            </div>
        </form>
        <a href="readWater">Back to List</a>
    </body>
</html>
