<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Water Meter Error Form</title>
    <style>
        .form-container {
            width: 300px;
            border: 1px solid black;
            padding: 20px;
            margin: 0 auto;
        }
        .form-container label {
            display: block;
            margin: 10px 0 5px;
        }
        .form-container input[type="text"] {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
        }
        .form-container textarea {
            width: 100%;
            height: 50px;
            padding: 5px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <form action="processForm.jsp" method="post">
            <label for="mssv">MSSV:</label>
            <input type="text" id="mssv" name="mssv">

            <label for="dorm">Dorm:</label>
            <input type="text" id="dorm" name="dorm">

            <label for="room">Room:</label>
            <input type="text" id="room" name="room">

            <label for="month">Tháng:</label>
            <input type="text" id="month" name="month">

            <label for="oldReading">S? n??c c?:</label>
            <input type="text" id="oldReading" name="oldReading">

            <label for="newReading">S? n??c m?i:</label>
            <input type="text" id="newReading" name="newReading">

            <label for="errorCode">Mã s? n??c:</label>
            <input type="text" id="errorCode" name="errorCode">

            <label for="status">Status:</label>
            <textarea id="status" name="status"></textarea>

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
