    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Hiroto Template">
        <meta name="keywords" content="Hiroto, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Hiroto | Template</title>

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <style>
            .profile__button {
                display: inline-block;
                padding: 12px 0 12px;
                position: relative;
                cursor: pointer;
            }

            .profile__button i {
                display: inline-block;
                font-size: 15px;
                color: #1d1c1c;
                font-weight: 500;
            }

            .profile__button--black a {
                text-decoration: none;
                color: black;
            }
            .profile__button--white a {
                text-decoration: none;
                color: white;
            }

            .profile__button a:hover {
                color: inherit;
            }

            .profile__button--black {
                color: black;
            }

            .profile__button--white {
                color: white;
            }
        
        

            .form-select {
                font-size: 2rem;
                max-width: 500px; /* Adjust the width of select inputs */
            }
            .btn-primary {
                font-size: 2rem;
            }
            .form-container {
                max-width: 800px; /* Adjust the width of the form container */
                padding: 20px;
                background-color: #343a40;
                border-radius: 8px;
            }
            .centered-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .form-label {
                color: black;
                font-size: 1.5rem;
            }

            .form-control {
                font-size: 1.3rem;
                max-width: 600px;
                border-radius: 5px;
            }

            .form-select {
                font-size: 1.2rem;
                max-width: 500px;
                border-radius: 5px;
            }

            .btn-primary {
                font-size: 1.2rem;
            }

            .form-container {
                max-width: 700px;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                margin-top: 50px;
            }

            .centered-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .header__top__widget {
                font-size: 1.2rem;
            }
  .menu__class {
                display: flex;
                justify-content: space-around;
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .menu__class li {
                position: relative;
            }

            .menu__class li a {
                display: block;
                padding: 10px 15px;
                color: #333;
                text-decoration: none;
            }
            .header__nav {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .header__menu {
                flex: 1;
            }
        </style>
    </head>

    <body>

        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>


        <!-- Offcanvas Menu Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="offcanvas-menu-wrapper">
            <div class="offcanvas__logo">
                <a href="./index.jsp"><img src="img/logo.png" alt=""></a>
            </div>
            <div id="mobile-menu-wrap"></div>
            <div class="offcanvas__btn__widget">
                <a href="#">Book Now <span class="arrow_right"></span></a>
            </div>
            <div class="offcanvas__widget">
                <ul>
                    <li><span class="icon_pin_alt"></span> Khu Công nghệ cao Hòa Lạc, Km29 Đại lộ Thăng Long, huyện Thạch Thất, Hà Nội</li>

                </ul>
            </div>
            <div class="offcanvas__profile">



            </div>
            <div class="header__top__right">

            </div>
        </div>
        <!-- Offcanvas Menu End -->

         <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7">
                            <ul class="header__top__widget">
                                <li><span class="icon_pin_alt"></span> Khu Công nghệ cao Hòa Lạc, Km29 Đại lộ Thăng Long, huyện Thạch Thất, Hà Nội</li>
                            </ul>
                        </div>
                        <div class="col-lg-5">
                            <div class="header__top__right">
                                <c:if test="${sessionScope.data.id == null}">
                                    <div class="header__top__auth">
                                        <ul>
                                            <li><a href="Login.jsp">Login</a></li>
                                            <li><a href="SignUp.jsp">Register</a></li>
                                        </ul>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.data != null}">
                                    <div class="profile__button profile__button--black">
                                        <i class="fa fa-user"></i>
                                        <span><a href="profile/Profile.jsp">Profile</a>/ <a href="${pageContext.request.contextPath}/logout">Logout</a></span>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header__nav__option">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-10">
                            <div class="header__nav">
                                <nav class="header__menu">
                                    <ul class="menu__class">
                                        <li ><a href="${pageContext.request.contextPath}/homeservlet">Home</a></li>
                                        <li><a href="${pageContext.request.contextPath}/homeroom">Dorms</a></li>
                                        <li ><a href="${pageContext.request.contextPath}/booking">Booking</a></li>
                                         <li ><a href="${pageContext.request.contextPath}/history-booking">History Booking</a></li>
                                          <li ><a href="${pageContext.request.contextPath}/bookinghistory">Service</a></li>
                                         <li ><a href="${pageContext.request.contextPath}/viewinvoice">Invoice</a></li>

                                        <li><a>Electric and Water</a>
                                            <ul class="dropdown">
                                                <li><a href="${pageContext.request.contextPath}/electricView">Electric</a></li>
                                                <li><a href="${pageContext.request.contextPath}/waterView">Water</a></li>

                                            </ul>
                                        </li>
                                        <li><a href="${pageContext.request.contextPath}/blog">News</a></li>
                                        <li class="active"><a href="${pageContext.request.contextPath}/request">Request</a></li>
                                        <li ><a href="${pageContext.request.contextPath}/registerTicket">Parking ticket</a></li>
                                    </ul>
                                </nav>
                                <div class="header__nav__widget">
                                    <a href="${pageContext.request.contextPath}/booking">Book Now <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="canvas__open">
                        <span class="fa fa-bars"></span>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header Section End -->





        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option set-bg" data-setbg="img/hero.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text" style="color: black;
                             font-size: 24px;
                             font-weight: bold;
                             line-height: 1.5;">
                            <h1 style="color: black;
                                font-size: 75px;
                                font-weight: bold;"></h1>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        
        
        
        
        <!-- Hero Section Begin -->
        <!-- Hero Section Begin -->
        <div class="container centered-container">
            <div class="form-container">
                <h1 style="color: black;
                    font-size: 2.5rem;
                    margin-bottom: 20px;">Student Request Form</h1>
                <form action="${pageContext.request.contextPath}/request" method="post">
                    <div class="mb-3">
                        <label for="studentName" class="form-label">Student Name</label>
                        <input type="text" class="form-control" id="studentName" name="studentName" value="${sessionScope.data.name}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="studentId" class="form-label">Student ID</label>
                        <input type="text" class="form-control" id="studentId" name="studentId" value="${sessionScope.data.id}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="roomId" class="form-label">Room ID</label>
                        <input type="text" class="form-control" id="roomId" name="roomId" value="${sessionScope.book.room_id}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="checkinDate" class="form-label">Check-in Date</label>
                        <input type="text" class="form-control" id="checkinDate" name="checkinDate" value="${sessionScope.book.checkin}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="checkoutDate" class="form-label">Check-out Date</label>
                        <input type="text" class="form-control" id="checkoutDate" name="checkoutDate" value="${sessionScope.book.checkout}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="requestType" class="form-label">Request Type</label>
                        <select class="form-select" id="requestType" name="requestType" required>
                            <option value="maintenance">Maintenance</option>
                            <option value="wrong_elec">Wrong electricity</option>
                            <option value="wrong_water">Wrong water</option>
                            <option value="complaint">Complaint</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
                    </div>
                    <button type="submit" name="mess" value="request" class="btn btn-primary">Submit Request</button>
                    <button type="submit" name="mess" value="list" class="btn btn-primary" onclick="removeRequiredAttribute()">List Request</button>
                </form>
            </div>
        </div>



        <br>
        <br>
        <br>
        <br>



        <!-- Footer Section Begin -->

        <footer class="footer set-bg" data-setbg="img/footer-bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">

                    </div>
                </div>
            </div>

            <div class="container">
                <div class="footer__content">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer__about">
                                <div class="footer__logo">
                                    <a href="#"><img src="img/logo.png" alt=""></a>
                                </div>
                                <h4>(123) 456-78-91096</h4>
                                <ul>
                                    <li>https://fpt.edu.vn</li>
                                    <li>FPT Education
                                        Hoa Lac High Tech Park, Hanoi, Vietnam
                                        Email: fpteducation@fe.edu.vn</li>
                                </ul>

                            </div>
                        </div>
                        <div class="col-lg-3 offset-lg-1 col-md-5 offset-md-1 col-sm-6">
                            <div class="footer__widget">

                            </div>
                        </div>
                        <div class="col-lg-5 col-md-8 col-sm-12">
                            <div class="footer__newslatter">


                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer__copyright">
                    <div class="row">
                        <div class="col-lg-7 col-md-7">
                            <div class="footer__copyright__text">
                                <p>© Copyright 2019 Hotell Hiroto - Theme by Colorlib.</p>
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-5">
                            <ul class="footer__copyright__links">
                                <li><a href="#">Terms Of Use</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <script>
                        function removeRequiredAttribute() {
                            var textarea = document.getElementById('description');
                            textarea.removeAttribute('required');
                        }
        </script>
    </body>

</html>
<!-- Error Section Begin -->

<!-- Error Section End -->
