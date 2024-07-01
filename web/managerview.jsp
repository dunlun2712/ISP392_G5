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
                grid-template-columns: repeat(3, 1fr);
                grid-template-rows: auto;
                gap: 20px;
                padding: 20px;
            }
            .box {
                background-color: white;
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 20px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                text-align: center;
                transition: transform 0.3s, background-color 0.3s;
                text-decoration: none;
                color: inherit;
                overflow: hidden;
            }
            .box:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.2);
                background-color: #f0f0f0;
            }
            .box:nth-child(1) {
                background-color: #ffcccc;
            }
            .box:nth-child(2) {
                background-color: #ccffcc;
            }
            .box:nth-child(3) {
                background-color: #ccccff;
            }
            .box:nth-child(4) {
                background-color: #ffe6cc;
                grid-column: 1;
            }
            .box h2 {
                font-size: 1.5em;
                margin-bottom: 10px;
            }
            .box p {
                font-size: 1em;
                color: #666;
            }
            @media (max-width: 768px) {
                .container {
                    grid-template-columns: repeat(2, 1fr);
                }
            }
            @media (max-width: 480px) {
                .container {
                    grid-template-columns: 1fr;
                }
            }
        </style>
        <script>
            function logout() {
                document.getElementById('logoutForm').submit();
            }
        </script>
    </head>
    <body>
        <form id="logoutForm" action="logout" method="get" style="display: none;">
            <input type="hidden" name="logout" value="true">
        </form>

        <div class="header">
            <button class="logout-button" onclick="logout()">Logout</button>
        </div>

        <div class="container">
            <a href="function1" class="box">
                <h2>Function 1</h2>
                <p>Function Description 1</p>
            </a>
            <a href="function2" class="box">
                <h2>Function 2</h2>
                <p>Function Description 2</p>
            </a>
            <a href="function3" class="box">
                <h2>Function 3</h2>
                <p>Function Description 3</p>
            </a>
            <a href="function4" class="box">
                <h2>Function 4</h2>
                <p>Function Description 4</p>
            </a>
        </div>

    </body>
</html>
