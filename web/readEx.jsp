<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Import Data</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background-color: #fff;
                padding: 20px 30px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                max-width: 400px;
                width: 100%;
            }
            h1 {
                color: green;
                margin-bottom: 20px;
            }
            form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            label {
                font-size: 18px;
                margin-bottom: 10px;
                color: #333;
            }
            input[type="file"] {
                margin-bottom: 20px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                transition: border-color 0.3s;
                width: 100%;
            }
            input[type="file"]:focus {
                border-color: #007bff;
            }
            button {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                background-color: green;
                color: #fff;
                cursor: pointer;
                transition: background-color 0.3s, transform 0.3s;
                font-size: 16px;
                width: 100%;
            }
            button:hover {
                background-color: greenyellow;
                transform: scale(1.05);
            }
            .message {
                color: red;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Import Data</h1>
            <form action="water" method="post" enctype="multipart/form-data">
                <label for="file">Choose Excel File:</label>
                <input type="file" id="file" name="file" accept=".xls,.xlsx" required>
                <button type="submit">Upload</button>
            </form>
            
        </div>
    </body>
</html>