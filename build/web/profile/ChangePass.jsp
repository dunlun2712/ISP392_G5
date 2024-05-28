<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/profile.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="my-5">
                    <h3>Change Password</h3>
                    <hr>
                </div>
                <form id="changePassForm" action="${pageContext.request.contextPath}/changepass" method="post">
                    <input type="hidden" name="pass" value="${sessionScope.data.pass}">
                    <div class="row mb-5 gx-5">
                        <div class="col-xxl-6">
                            <div class="bg-secondary-soft px-4 py-5 rounded">
                                <div class="row g-3">

                                    <c:if test="${message == 'Old password is correct' or message =='New passwords do not match'}">
                                        <div class="col-md-7">
                                            <label for="newPassword" class="form-label">New password *</label>
                                            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                                        </div>
                                        <div class="col-md-7">
                                            <label for="confirmPassword" class="form-label">Confirm Password *</label>
                                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                                        </div>
                                    </c:if>
                                    <c:if test="${message == 'Old password is incorrect'  or message =='Password updated successfully' or message == null}">
                                        <div class="col-md-6">
                                            <label for="oldPassword" class="form-label">Old password *</label>
                                            <input type="password" class="form-control" id="oldPassword" name="oldPassword" required>
                                        </div>
                                    </c:if>
                                    <c:choose>
                                        <c:when test="${message == 'Password updated successfully'}">
                                            <div class="col-12">
                                                <div class="alert alert-success" role="alert">
                                                    Password updated successfully!
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${message == 'Old password is incorrect' or message == 'New passwords do not match'}">
                                            <div class="col-12">
                                                <div class="alert alert-danger" role="alert">
                                                    ${message}
                                                </div>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="gap-3 d-md-flex justify-content-md-end text-center">
                        <button type="button" class="btn btn-danger btn-lg" style="font-weight: bold; width: 100px" name="update" value="back" onclick="submitBack()">Back</button>
                        <button type="submit" class="btn btn-danger btn-lg" style="font-weight: bold" name="update" value="pass_update">Confirm</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
        function submitBack() {
            var form = document.getElementById('changePassForm');
            var inputs = form.querySelectorAll('input[required]');
            inputs.forEach(function(input) {
                input.removeAttribute('required');
            });
            form.querySelector('button[name="update"][value="back"]').type = 'submit';
            form.submit();
        }
    </script>
</body>
</html>
