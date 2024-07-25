<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Hiroto Template">
        <meta name="keywords" content="Hiroto, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">


        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>Functions Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                display: flex;
                min-height: 100vh;
            }
            .header {
                background-color: #333;
                color: white;
                padding: 10px 20px;
                display: flex;
                justify-content: flex-end;
                align-items: center;
                width: 100%;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
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
                cursor: pointer;
                border-radius: 5px;
                transition: background-color 0.3s;
            }
            .logout-button:hover {
                background-color: #ff1f3a;
            }
            .sidebar {
                width: 250px;
                background-color: #333;
                color: white;
                padding: 20px;
                box-shadow: 2px 0 4px rgba(0,0,0,0.1);
                display: flex;
                flex-direction: column;
            }
            .sidebar h3 {
                margin-top: 0;
                font-size: 1.5em;
                margin-bottom: 20px;
            }
            .sidebar a {
                color: white;
                text-decoration: none;
                display: block;
                padding: 10px;
                border-bottom: 1px solid #444;
                margin-bottom: 10px;
                transition: background-color 0.3s;
            }
            .sidebar a:hover {
                background-color: #444;
            }
            .sidebar .logout-button {
                margin-top: auto;
                background-color: #ff4b5c;
                border: none;
                padding: 10px;
                font-size: 14px;
                width: 100%;
                text-align: center;
            }
            .content {
                flex: 1;
                padding: 20px;
                overflow: auto;
            }
            .container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 20px;
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
                cursor: pointer;
                border: none;
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
                .sidebar {
                    width: 100%;
                    box-shadow: none;
                }
                .content {
                    padding: 10px;
                }
            }
            @media (max-width: 480px) {
                .container {
                    grid-template-columns: 1fr;
                }
            }
            .content {
                flex: 1;
                padding: 20px;
                overflow: auto;
                background-color: #fff; /* Thay đổi màu nền để nội dung nổi bật hơn */
                border-radius: 8px; /* Bo tròn các góc */
                box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* Thêm bóng cho nội dung */
            }

            .container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); /* Thay đổi kích thước của các cột */
                gap: 20px;
                padding: 20px; /* Thêm padding cho phần nội dung */
            }

            .hero {
                position: relative;
                height: 300px; /* Đặt chiều cao cho phần hero */
                background-color: #333; /* Thay đổi màu nền để nổi bật */
                color: white;
                text-align: center;
                padding: 50px 20px;
                border-radius: 8px; /* Bo tròn các góc */
            }

            .hero__text h5 {
                font-size: 1.5em;
                margin-bottom: 10px;
            }

            .home-about {
                padding: 40px 0; /* Thêm padding trên và dưới cho phần về chúng tôi */
            }

            .section-title h5 {
                font-size: 1.2em;
                margin-bottom: 10px;
                color: #333; /* Thay đổi màu chữ tiêu đề */
            }

            .section-title h2 {
                font-size: 2em;
                color: #555; /* Thay đổi màu chữ tiêu đề */
            }

            .home__about__text {
                padding: 20px;
                background-color: #f9f9f9; /* Thay đổi màu nền cho phần về chúng tôi */
                border-radius: 8px; /* Bo tròn các góc */
            }

            .home__about__pic img {
                width: 100%;
                border-radius: 8px; /* Bo tròn các góc của hình ảnh */
            }
        </style>
        <script>
            function logout() {
                document.getElementById('logoutForm').submit();
            }
        </script>
    </head>
    <body>

        <form id="logoutForm" action="${pageContext.request.contextPath}/logout" method="get" style="display: none;">
            <input type="hidden" name="logout" value="true">
        </form>

        <div class="sidebar">
            <h3 style="color: white">Menu</h3>
            <a href="${pageContext.request.contextPath}/dormmanager?function=dorm">Dorm Management</a>
            <a href="${pageContext.request.contextPath}/dormmanager?function=item">Items Management</a>
            <a href="${pageContext.request.contextPath}/dormmanager?function=request">Request List</a>
            <a href="${pageContext.request.contextPath}/dormmanager?function=elec">Electric Management</a>
            <a href="${pageContext.request.contextPath}/dormmanager?function=water">Water Management</a>
            <a href="${pageContext.request.contextPath}/dormmanager?function=pass">Change Password</a>
            <button class="logout-button" onclick="logout()">Logout</button>
        </div>

        <div class="content">
            <div class="container">
                <!-- Hero Section Begin -->
                <section class="hero spad set-bg" data-setbg="img/hero.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="hero__text">
                                    <h5>WELCOME DORMITORY</h5>

                                </div>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="home__about__text">
                                            <div class="section-title">
                                                <h5>ABOUT US</h5>
                                                <h2>Welcome to the University's Dormitory</h2>
                                            </div>
                                            <p class="first-para">Dormitories are common living spaces designed for students and lecturers 
                                                located on school grounds. It provides convenient and low-cost housing with basic amenities such as bedrooms, bathrooms, and common rooms.</p>
                                            <p class="last-para">Dormitories often have strict rules to ensure order, cleanliness, and security for residents. Living in a dormitory 
                                                provides opportunities to socialize, make friends, and develop general living skills.</p>
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="home__about__pic">
                                            <img src="img/home-about/home-about.png" alt="Dormitory Image">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Hero Section End -->

<!--                 Home About Section Begin 
                <section class="home-about">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="home__about__text">
                                    <div class="section-title">
                                        <h5>ABOUT US</h5>
                                        <h2>Welcome to the University's Dormitory</h2>
                                    </div>
                                    <p class="first-para">Dormitories are common living spaces designed for students and lecturers 
                                        located on school grounds. It provides convenient and low-cost housing with basic amenities such as bedrooms, bathrooms, and common rooms.</p>
                                    <p class="last-para">Dormitories often have strict rules to ensure order, cleanliness, and security for residents. Living in a dormitory 
                                        provides opportunities to socialize, make friends, and develop general living skills.</p>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="home__about__pic">
                                    <img src="img/home-about/home-about.png" alt="Dormitory Image">
                                </div>
                            </div>
                        </div>
                    </div>
                </section>-->



                <!-- Home About Section End -->
            </div>
        </div>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
