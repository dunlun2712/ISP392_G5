    
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
            .form-label {
                color: white;
                font-size: 2.2rem;
            }
            .form-control {
                font-size: 2rem;
                max-width: 500px; /* Adjust the width of text inputs */
            }

            .form-select {
                font-size: 2rem;
                max-width: 500px; /* Adjust the width of select inputs */
            }
            .btn-primary {
                font-size: 2rem;
            }
            .form-container {
                max-width: 700px; /* Adjust the width of the form container */
                padding: 20px;
                background-color: #343a40;
                border-radius: 8px;
            }
            .centered-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
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
                <div class="offcanvas__auth">
                    <ul>
                        <li><a href="#">Login</a></li>
                        <li><a href="#">Readadgadfgsdr</a></li>
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
                                    <li><span class="icon_pin_alt"></span> 96 Ernser Vista Suite 437, NY, US</li>
                                    <li><span class="icon_phone"></span> (123) 456-78-910</li>
                                </ul>
                            </div>
                            <div class="col-lg-5">
                                <div class="header__top__right">
                                    <div class="header__top__auth">
                                        <ul>
                                            <li><a href="#">Login</a></li>
                                            <li><a href="#">Register</a></li>
                                        </ul>
                                    </div>
                                    <div class="profile__button profile__button--black">
                                        <i class="fa fa-user"></i>
                                        <span><a href="profile/Profile.jsp">Profile</a></span>
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
                                    <a href="./index.jsp"><img src="img/logo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-lg-10">
                                <div class="header__nav">
                                    <nav class="header__menu">
                                        <ul class="menu__class">
                                            <li class="active"><a href="./index.jsp">Home</a></li>
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
                                            <li><a href="./request">Request</a></li>
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
                            <div class="col-xxl-8 mb-5 mb-xxl-0">
                                <div class="bg-secondary-soft px-4 py-5 rounded">
                                    <div class="row g-3">
                                        <div class="container mt-5">
                                            <h1  style="color: white ;
                                                 font-size: 5rem">Student Request Form</h1>
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
                                                         <label for="totalPrice" class="form-label">Total Price</label>
                                                         <input type="text" class="form-control" id="totalPrice" name="totalPrice" value="${sessionScope.book.total_price}" readonly>
                                                     </div>
                                                     <div class="mb-3">
                                                         <label for="requestType" class="form-label">Request Type</label>
                                                         <select class="form-select" id="requestType" name="requestType" required>
                                                             <option value="maintenance">Maintenance</option>
                                                             <option value="room_change">Room Change</option>
                                                             <option value="complaint">Complaint</option>
                                                             <option value="other">Other</option>
                                                         </select>
                                                     </div>
                                                     <div class="mb-3">
                                                         <label for="description" class="form-label">Description</label>
                                                         <textarea class="form-control" style="max-width: 1000px;
                                                         font-size: 1.3rem;" id="description" name="description" rows="4" required></textarea>
                                                 </div>
                                                 <button type="submit" name="mess" value="request" class="btn btn-primary">Submit Request</button>
                                                 <button type="submit"name="mess" value="list" class="btn btn-primary" onclick="removeRequiredAttribute()" >List Request</button>
                                            </form>
                                        </div></div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>




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
                                    <h4>(123) 456-78-91096</h4>
                                    <ul>
                                        <li>Ernser Vista Suite 437, NY</li>
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
