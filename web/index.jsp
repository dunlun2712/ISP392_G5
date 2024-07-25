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
        <title></title>

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
            .header__nav {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .header__menu {
                flex: 1;
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
                <img src="img/profile.png" alt="">
                <span>Profile</span>

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
                               
                                    <div class="header__top__auth">
                                        <ul>
                                            <li><a href="Login.jsp">Login</a></li>
                                            <li><a href="SignUp.jsp">Register</a></li>
                                        </ul>
                                    </div>
                            
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
                                        <li class="active"><a href="${pageContext.request.contextPath}/homeservlet">Home</a></li>
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

        <!-- Hero Section Begin -->
        <section class="hero spad set-bg" data-setbg="img/hero.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="hero__text">
                            <h5>WELCOME DORMITORY</h5>
                            <h2>Wishing you wonderful years at university.</h2>
                        </div>
                        <form action="dormdetail" class="filter__form" method="get">


                            <select id="dormSelect" name="pid" onchange="this.form.submit()">
                                <c:forEach items="${ListD}" var="d">
                                    <option value="${d.dorm_id}" class="${tag == d.dorm_id ? 'active' : ''}">${d.dorm_name}</option>
                                </c:forEach>
                            </select>



                            <button type="submit">Search</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Home About Section Begin -->
        <section class="home-about">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="home__about__text">
                            <div class="section-title">
                                <h5>ABOUT US</h5>
                                <h2>Welcome to the University's dormitory....</h2>
                            </div>
                            <p class="first-para">Dormitories are common living spaces designed for students and lecturers 
                                located on school grounds. It provides convenient and low-cost housing with basic amenities such as bedrooms, bathrooms and common rooms. </p>
                            <p class="last-para">Dormitories often have strict rules to ensure order, cleanliness, and security for residents. Living in a dormitory 
                                provides opportunities to socialize, make friends and develop general living skills.</p>

                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="home__about__pic">
                            <img src="img/home-about/home-about.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Home About Section End -->

        <!-- Home Room Section Begin -->
        <section class="home-room spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h5>OUR ROOM</h5>
                            <h2>Explore Our Hotel</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6 p-0">

                        <div class="home__room__item set-bg" data-setbg="img/home-room/hr-1.jpg">
                            <div class="home__room__title">
                                <h4>Room 4 beds</h4>
                                <h2><sup></sup>800.000<span>/month</span></h2>
                            </div>
                            <a href="#">Booking Now</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 p-0">
                        <div class="home__room__item set-bg" data-setbg="img/home-room/hr-2.jpg">
                            <div class="home__room__title">
                                <h4>Room 4 beds</h4>
                                <h2><sup></sup>800.000<span>/month</span></h2>
                            </div>
                            <a href="#">Booking Now</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 p-0">
                        <div class="home__room__item set-bg" data-setbg="img/home-room/hr-3.jpg">
                            <div class="home__room__title">
                                <h4>Room 6 beds</h4>
                                <h2><sup></sup>1.000.000<span>/month</span></h2>
                            </div>
                            <a href="#">Booking Now</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 p-0">
                        <div class="home__room__item set-bg" data-setbg="img/home-room/hr-4.jpg">
                            <div class="home__room__title">
                                <h4>Room 6 beds</h4>
                                <h2><sup></sup>1.000.000<span>/month</span></h2>
                            </div>
                            <a href="#">Booking Now</a>                        </div>
                    </div>
                </div>
            </div>


        </section>
        <!-- Home Room Section End -->


        <!-- Chooseus Section Begin -->
        <div class="chooseus spad set-bg" data-setbg="img/chooseus-bg.jpg">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8 text-center">
                        <div class="chooseus__text">
                            <div class="section-title">
                                <h5>WHY CHOOSE US</h5>
                                <h2>Contact us now to book the most suitable dormitory room</h2>
                            </div>
                            <a href="#" class="primary-btn">Booking Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Chooseus Section End -->


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
    </body>

</html>