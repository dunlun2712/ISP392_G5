<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Functions Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .header {
                background-color: #333;
                color: white;
                padding: 10px 20px;
                display: flex;
                justify-content: flex-end;
                align-items: center;
            }
            .logout-button {
                background-color: #ff4b5c;
                border: none;
                color: white;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 5px;
                transition: background-color 0.3s;
            }
            .logout-button:hover {
                background-color: #ff1f3a;
            }
            .container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                grid-gap: 20px;
                justify-items: center;
                padding: 20px;
            }
            .box {
                background-color: white;
                border: 1px solid #ddd;
                border-radius: 5px;
                width: 100%;
                max-width: 300px;
                padding: 20px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                text-align: center;
                text-decoration: none; /* Remove underline from links */
                color: inherit; /* Inherit text color */
                transition: transform 0.3s; /* Smooth transition for hover effect */
            }
            .box:hover {
                transform: translateY(-5px); /* Move box up slightly on hover */
                box-shadow: 0 4px 8px rgba(0,0,0,0.2); /* Darker shadow on hover */
            }
            .box h2 {
                font-size: 1.5em;
                margin-bottom: 10px;
            }
            .box p {
                font-size: 1em;
                color: #666;
            }
            .function-1 {
                grid-row: 1;
                grid-column: 1;
            }
            .function-4 {
                grid-row: 2;
                grid-column: 1;
            }
            .function-2 {
                grid-row: span 1;
                grid-column: 2;
            }
            .function-3 {
                grid-row: span 1;
                grid-column: 3;
            }
        </style>
        <script>
            function logout() {
                window.location.href = 'logout.jsp';
            }
        </script>
    </head>
    <body>

        <div class="header">
            <button class="logout-button" onclick="logout()">Logout</button>
        </div>

        <div class="container">
            <a href="function1.jsp" class="box function-1">
                <h2>Quản Lí Sinh Viên</h2>
                <p>Function Description 1</p>
            </a>
            <a href="function4.jsp" class="box function-4">
                <h2>Quản Lí Điện</h2>
                <p>Function Description 4</p>
            </a>
            <a href="function2.jsp" class="box function-2">
                <h2>Xử Lí Request</h2>
                <p>Function Description 2</p>
            </a>
            <a href="function3.jsp" class="box function-3">
                <h2>Function 3</h2>
                <p>Function Description 3</p>
            </a>
        </div>

    </body>
</html>
