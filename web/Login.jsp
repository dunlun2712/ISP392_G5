<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Login and Register Form</title>
    </head>
    <body>
        <form class="form-signin" action="login" method="post">
            <div id="logreg-forms">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Sign in</h1>
                <c:choose>
                    <c:when test="${mess == 'Wrong Email or Password' || mess == 'Email must be fpt.edu.vn'}">
                        <div class="col-12">
                            <div class="alert alert-danger" role="alert">
                                ${mess}
                            </div>
                        </div>
                    </c:when>
                </c:choose>
                <input name="account" type="email" id="inputEmail" class="form-control" placeholder="Account" value="${email}">
                <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password">
                <div class="form-group d-flex justify-content-between align-items-center">

                    <div>
                        <a href="forgot_password.jsp" class="btn btn-link p-0" style="font-size: 0.875rem;">Forgot Password?</a>
                    </div>
                </div>
                <button class="btn btn-success btn-block" type="submit" name="login" value="Login"><i class="fas fa-sign-in-alt"></i> Sign in</button>
                <hr>
                <button class="btn btn-primary btn-block" type="submit" name="login" value="signupPage"><i class="fas fa-user-plus"></i> Sign up New Account</button>
            </div>
        </form>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            function toggleResetPswd(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle()// display:block or none
                $('#logreg-forms .form-reset').toggle() // display:block or none
            }

            function toggleSignUp(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle(); // display:block or none
                $('#logreg-forms .form-signup').toggle(); // display:block or none
            }

            $(() => {
                // Login Register Form
                $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
                $('#logreg-forms #cancel_reset').click(toggleResetPswd);
                $('#logreg-forms #btn-signup').click(toggleSignUp);
                $('#logreg-forms #cancel_signup').click(toggleSignUp);
            })
        </script> 
    </body>
</html>