<%-- 
    Document   : booking
    Created on : May 27, 2024, 1:27:23 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Hiroto Template">
        <meta name="keywords" content="Hiroto, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Hiroto | Template</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">

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
            .booking-section {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
            }

            .account-balance p {
                margin: 0;
                padding: 5px 0;
                font-size: 18px;
                color: #0044cc;
            }

            .booking-form {
                width: 50%;
            }

            .booking-form form {
                display: flex;
                flex-direction: column;
            }

            .booking-form label {
                margin-top: 10px;
                font-weight: bold;
            }

            .booking-form select,
            .booking-form input {
                margin-top: 5px;
                padding: 5px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .booking-form button {
                margin-top: 20px;
                padding: 10px;
                background-color: #ff6600;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .booking-form .error-message {
                color: red;
                margin-top: 10px;
            }

            .booking-form button[type="button"] {
                background-color: #ffcc00;
            }

            .booking-form button[type="submit"] {
                background-color: #ff6600;
            }

            .booking-form button[type="button"]:last-of-type {
                background-color: #007bff;
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


        <!-- Offcanvas Menu Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="offcanvas-menu-wrapper">
            <div class="offcanvas__logo">
                <a href="./index.html"><img src="img/logo.png" alt=""></a>
            </div>
            <nav class="offcanvas__menu mobile-menu">
                <ul>
                    <li class="active"><a href="./index.html">Home</a></li>
                    <li><a href="./rooms.html">Rooms</a></li>
                    <li><a href="./about.html">About Us</a></li>
                    <li><a href="#">Pages</a>
                        <ul class="dropdown">
                            <li><a href="./about.html">About Us</a></li>
                            <li><a href="./room-details.html">Room Details</a></li>
                            <li><a href="./blog-details.html">Blog Details</a></li>
                        </ul>
                    </li>
                    <li><a href="./blog.html">News</a></li>
                    <li><a href="./contact.html">Contact</a></li>
                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
            <div class="offcanvas__btn__widget">
                <a href="#">Book Now <span class="arrow_right"></span></a>
            </div>
            <div class="offcanvas__widget">
                <ul>
                    <li><span class="icon_pin_alt"></span> 96 Ernser Vista Suite 437, NY, US</li>
                    <li><span class="icon_phone"></span> (123) 456-78-910</li>
                </ul>
            </div>
            <div class="offcanvas__language">
                <img src="img/lan.png" alt="">
                <span>English</span>
                <i class="fa fa-angle-down"></i>
                <ul>
                    <li>English</li>
                    <li>Bangla</li>
                </ul>
            </div>
            <div class="offcanvas__auth">
                <ul>
                    <li><a href="#">Login</a></li>
                    <li><a href="#">Register</a></li>
                </ul>
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
                                         <li class="active"><a href="${pageContext.request.contextPath}/history-booking">History Booking</a></li>
                                          <li ><a href="${pageContext.request.contextPath}/bookinghistory">Service</a></li>
                                         <li ><a href="${pageContext.request.contextPath}/viewinvoice">Invoice</a></li>

                                        <li><a>Electric and Water</a>
                                            <ul class="dropdown">
                                                <li><a href="${pageContext.request.contextPath}/electricView">Electric</a></li>
                                                <li><a href="${pageContext.request.contextPath}/waterView">Water</a></li>

                                            </ul>
                                        </li>
                                        <li><a href="${pageContext.request.contextPath}/blog">News</a></li>
                                        <li ><a href="${pageContext.request.contextPath}/request">Request</a></li>
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

        <!-- Rooms Section Begin -->
        <div class="container mt-5">
            <h1 class="mb-4">Room Bookings</h1>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                       
                        <th>Room ID</th>
                        <th>Check-in Date</th>
                        <th>Check-out Date</th>
                        <th>Total Price</th>
                        <th>Note</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${roomBookings}">
                        <tr>
                            
                            <td>${booking.roomId}</td>
                            <td>${booking.checkinDate}</td>
                            <td>${booking.checkoutDate}</td>
                            <td>${booking.totalPrice}</td>
                            <td>${booking.note}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <!-- Rooms Section End -->

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
            function redirectToPage() {
                const selectElement = document.getElementById('dom');
                const selectedOption = selectElement.options[selectElement.selectedIndex];
                const url = selectedOption.getAttribute('data-url');
                if (url) {
                    window.location.href = url;
                }
            }
        </script>

        <script>
            function countTotalCost() {
                const amountInput = document.getElementById('amount');

                const selectElement = document.getElementById('month');
                const selectedOption = selectElement.options[selectElement.selectedIndex];
                const cost = selectedOption.getAttribute('data-cost');

                const totalCost = document.getElementById('totalCost');
                totalCost.textContent = cost + ' VND';
                amountInput.value = cost;
            }

            countTotalCost();
        </script>

    </body>

</html>

