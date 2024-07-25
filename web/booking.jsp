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
                    <li><span class="icon_pin_alt"></span> 96 Ernser Vista Suite 437, NY, US</li>
                    <li><span class="icon_phone"></span> (123) 456-78-910</li>
                </ul>
            </div>
            <div class="offcanvas__profile">
                <img src="img/profile.png" alt="">
                <span>Profile</span>

            </div>
            <div class="header__top__auth">
                <ul>
                    <li><a href="Login.jsp">Login</a></li>
                    <li><a href="SignUp.jsp">Register</a></li>
                </ul>
            </div>
            <div class="profile__button profile__button--white">
                <i class="fa fa-user"></i>
                <span><a href="profile/Profile.jsp">View Profile</a></span>

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
                                        <li class="active"><a href="${pageContext.request.contextPath}/booking">Booking</a></li>
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



        <!-- Breadcrumb Begin -->
        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option set-bg" data-setbg="img/hero.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text" style="color: black; font-size: 24px; font-weight: bold; line-height: 1.5;">
                            <h1 style="color: black; font-size: 75px; font-weight: bold;">Dormitory</h1>
                            <div class="breadcrumb__links" style="color: black; font-size: 20px; font-weight: normal;">
                                <a href="#" style="color: black; font-size: 20px; text-decoration: none;">Home</a>
                                <span style="color: black; font-size: 20px;">Rooms</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Breadcrumb End -->

        <!-- Rooms Section Begin -->
        <section class="rooms spad">
            <div class="container">
                <h1>Booking Bed</h1>
                <div class="booking-section">
                    <div class="account-balance">

                        <p> Balance required in VND</p>
                        <p><strong id="totalCost">0 </strong></p>
                        <p class="text-danger">${param.fm}</p>


                    </div>
                    <div class="booking-form">
                        <form action="payment" method="post">
                            <input class="form-control" id="amount" name="amount" type="hidden" readonly value="" />
                            <input type="hidden" Checked="True" id="bankCode" name="bankcode" value="NCB">
                            <input type="hidden" id="language" Checked="True" name="language" value="vn">
                            <a href="${pageContext.request.contextPath}/homeroom">
                                <button type="button">See available rooms</button>
                            </a>





                            <label for="dom">Room</label>
                            <select id="dom" name="dom" onchange="redirectToPage()">
                                <c:forEach items="${details}" var="d">
                                    <option data-url="?pid=${d.room_id}" value="${d.room_id}" ${detail.room_id eq d.room_id ? 'selected' : ''}>${d.room_id}</option>
                                </c:forEach>
                            </select>




                            <label for="month">Month</label>
                            <select id="month" name="month" onchange="countTotalCost()">
                                <option data-cost="${detail.price * 6}" value="6">6</option>
                                <option data-cost="${detail.price * 12}" value="12">12</option>

                            </select>
                            <label for="room-type">Room Type</label>
                            <select id="room-type" name="room-type" readonly disabled >
                                <option value="SVVN">${detail.room_type}</option>
                            </select>
                            <label for="semester">Price in Month</label>
                            <select id="semester" name="semester" readonly disabled>

                                <option value="">${detail.price}</option>


                            </select>
                            <label for="note">Note</label>
                            <input type="text" id="note" name="note">
                            <button type="submit">Booking with DNG</button>

                        </form>
                    </div>
                </div>
            </div>
        </section>

        <!-- Rooms Section End -->

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

