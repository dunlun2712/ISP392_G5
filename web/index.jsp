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

                        </div>
                        <div class="col-lg-5">
                            <div class="header__top__right">
                                <div class="header__top__auth">
                                    <ul>
                                        <li><a href="#">Login</a></li>
                                        <li><a href="#">Register</a></li>
                                    </ul>
                                </div>
                                <div class="header__top__language">
                                    <img src="img/lan.png" alt="">
                                    <span>English</span>
                                    <i class="fa fa-angle-down"></i>
                                    <ul>
                                        <li>English</li>
                                        <li>Bangla</li>
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
                        <div class="col-lg-2">
                            <div class="header__logo">
                                <a href="home"><img src="img/logo.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div class="header__nav">
                                <nav class="header__menu">
                                    <ul class="menu__class">
                                        <li class="active"><a href="home">Home</a></li>
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
                                <div class="header__nav__widget">
                                    <a href="#">Book Now <span class="arrow_right"></span></a>
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
    <br>
    <br>
    <br>
    <br>

    <!-- Footer Section Begin -->
    <footer class="footer set-bg" data-setbg="img/footer-bg.jpg">

        <div class="container">
            <div class="footer__content">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="#"><img src="img/logo.png" alt=""></a>
                            </div>
                            <h4>0941384237</h4>
                            <ul>
                                <li>Khu Cong Nghe Cao Hoa Lac, km 29, Dai lo Thang Long, Ha Noi</li>
                                <li>Info.colorlib@gmail.com</li>
                            </ul>
                            <div class="footer__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-youtube-play"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 offset-lg-1 col-md-5 offset-md-1 col-sm-6">
                        <div class="footer__widget">
                            <h4>Quick Link</h4>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Booking</a></li>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Review</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                            <ul>
                                <li><a href="#">Services</a></li>
                                <li><a href="#">Our Room</a></li>
                                <li><a href="#">Restaurants</a></li>
                                <li><a href="#">Payments</a></li>
                                <li><a href="#">Events</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-8 col-sm-12">
                        <div class="footer__newslatter">
                            <h4>Subscribe our newlatester</h4>
                            <form action="#">
                                <input type="text" placeholder="Your E-mail Address">
                                <button type="submit">Subscribe</button>
                            </form>
                            <div class="footer__newslatter__find">
                                <h5>Find Us:</h5>
                                <div class="footer__newslatter__find__links">
                                    <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                    <a href="#"><i class="fa fa-map-o"></i></a>
                                    <a href="#"><i class="fa fa-dribbble"></i></a>
                                    <a href="#"><i class="fa fa-forumbee"></i></a>
                                </div>
                            </div>
                        </div>
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