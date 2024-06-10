
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
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
                <li><a href="#">Register</a></li>
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
                        <h5>WELCOME HIROTO</h5>
                        <h2>Experience the greatest for you holidays.</h2>
                    </div>
                    <form action="search" class="filter__form" method="get">
                        <input name="txt" type="text" class="form-control" placeholder="What do you choose?">
                        <button type="submit">Search</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Payment Section Begin -->
    <section class="payment spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h5>PAYMENT</h5>
                        <h2>Pay Your Electricity Bill</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <form id="paymentForm">
                        <div class="form-group">
                            <label for="accountNumber">Account Number</label>
                            <input type="text" class="form-control" id="accountNumber" placeholder="Enter your account number" required>
                        </div>
                        <div class="form-group">
                            <label for="consumption">Electricity Consumption (kWh)</label>
                            <input type="number" class="form-control" id="consumption" placeholder="Enter your electricity consumption" required>
                        </div>
                        <div class="form-group">
                            <label for="amount">Amount Due (USD)</label>
                            <input type="text" class="form-control" id="amount" readonly>
                        </div>
                        <button type="submit" class="btn btn-primary">Pay Now</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Payment Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        $(document).ready(function() {
            $('#consumption').on('input', function() {
                var consumption = $(this).val();
                var rate = 0.12; // Example rate per kWh
                var amount = consumption * rate;
                $('#amount').val(amount.toFixed(2));
            });

            $('#paymentForm').on('submit', function(event) {
                event.preventDefault();
                // Add your payment processing logic here
                alert('Payment processed successfully!');
            });
        });
    </script>
</body>
</html>
