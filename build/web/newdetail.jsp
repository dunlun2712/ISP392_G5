<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Detail</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            background-color: #0056b3;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .content {
            margin-top: 20px;
        }
        .title {
            color: #FF4500;
            font-size: 24px;
        }
        .publish-date {
            color: #666;
            font-size: 14px;
            margin-bottom: 20px;
        }
        .notification-content {
            border: 1px solid #ccc;
            padding: 10px;
            white-space: pre-wrap; /* Preserves line breaks and spaces */
        }
        .notification-content p {
            margin: 0;
            line-height: 1.6;
            text-align: left; /* Aligns text to the left */
        }
        .back-button {
            margin-top: 20px;
        }
        .back-button a {
            text-decoration: none;
            color: white;
            background-color: #0056b3;
            padding: 10px 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Detail</h1>
        </div>
        <div class="content">
            <h2 class="title">${news.title}</h2>
            <p class="publish-date">${news.publish_date}</p>
            
            <div class="notification-content">
                <p>${news.content}</p>
                <p><a href="${news.link}" target="_blank">${news.link}</a></p>
            </div>
            <div class="back-button">
                <a href="blog">Back to List</a>
            </div>
        </div>
    </div>
</body>
</html>
