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
            .form-container {
                background-color: white;
                padding: 10px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 40%;
                margin: auto;
                font-family: Arial, sans-serif;
            }
            .form-container label {
                display: block;
                margin-top: 5px;
                font-size: 14px;
            }
            .form-container input, .form-container textarea {
                width: 100%;
                padding: 5px;
                margin-top: 3px;
                margin-bottom: 7px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 14px;
            }
            .form-container textarea {
                resize: none; /* Prevents resizing */
                height: 100px; /* Sets a smaller height */
                overflow-y: scroll; /* Adds a vertical scroll bar */
            }
            .form-container input[type="submit"] {
                width: auto;
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
                padding: 7px 15px;
                border-radius: 4px;
                font-size: 14px;
            }
            .form-container input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
        <script>
            function removeRequiredAttributes() {
                var formElements = document.querySelectorAll('.form-container input[required], .form-container textarea[required]');
                formElements.forEach(function (element) {
                    element.removeAttribute('required');
                });
            }
        </script>
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
                                        <li><a href="./listnew">News</a></li>
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
        <br>
        <br>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="hero__text">
                            <h5>WELCOME DORMITORY</h5>
                            <h2 style="color: black">Wishing you wonderful years at university.</h2>
                        </div>
                        <div class="form-container">
                            <form action="addnew" method="post" >

                                <label for="new_id">New ID:</label>
                                <input type="number" id="new_id" name="new_id" value="${id}" readonly>

                                <label for="category">Category:</label>
                              <label for="category">
                                <select name="category" id="requestStatus">
                                    <option value="">Choose Category</option>
                                    <option value="Dorm">Dorm</option>
                                    <option value="Room">Room</option>
                                    <option value="Other">Other</option>
                                </select></label>
                                <br>
                                <br>
                                
                                <label for="title">Title:</label>
                                <input type="input" id="title" name="title" required>

                                <label for="content">Content:</label>
                                <textarea id="content" name="content" required></textarea>

                                <label for="link">Link:</label>
                                <input type="url" id="link" name="link" required>

                                <label for="publish_date">Publish Date:</label>
                                <input type="date" id="publish_date" name="publish_date" value="${date}" readonly>

                                <input id="addNewsBtn" name="update" type="submit" value="Add News">
                                <input id="listNewsBtn" name="update" type="submit" value="List News" onclick="removeRequiredAttributes()">

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        
        <!-- Hero Section End -->


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
                                <h4>0943 293 768</h4>
                                <ul>
                                    <li>Email: hieub1913012@student.ctu.edu.vn</li>
                                    <li>Address: 20 Cong Hoa street, Ninh Kieu district, Can Tho city</li>
                                </ul>
                                <div class="footer__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-youtube-play"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-3 col-sm-6">
                            <div class="footer__widget">
                                <h5>Information</h5>
                                <ul>
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">About Our Rooms</a></li>
                                    <li><a href="#">Our Appointments</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Our Care</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-3 col-sm-6">
                            <div class="footer__widget">
                                <h5>Links</h5>
                                <ul>
                                    <li><a href="#">Home</a></li>
                                    <li><a href="#">Rooms</a></li>
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">News</a></li>
                                    <li><a href="#">Contact</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-6 col-sm-6">
                            <div class="footer__widget">
                                <h5>Support</h5>
                                <ul>
                                    <li><a href="#">Our Homes</a></li>
                                    <li><a href="#">Help</a></li>
                                    <li><a href="#">FAQs</a></li>
                                    <li><a href="#">Our Services</a></li>
                                    <li><a href="#">Tourist Guide</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer__newsletter">
                                <h5>Your Email</h5>
                                <form action="#">
                                    <input type="text" placeholder="Email Address">
                                    <label>
                                        <input type="submit" value="Subscribe">
                                        <span class="arrow_right"><i class="fa fa-angle-right"></i></span>
                                    </label>
                                </form>
                                <p>Subscribe our newsletter gor get notification about new updates.</p>
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
