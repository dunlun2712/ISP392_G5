<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Update My Profile - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/profile.css">


    </head>
    <body>
        <form action="${pageContext.request.contextPath}/viewprofile" method="post">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="my-5">
                            <h3>My Profile</h3>
                            <hr>
                        </div>


                        <div class="row mb-5 gx-5">

                            <div class="col-xxl-8 mb-5 mb-xxl-0">
                                <div class="bg-secondary-soft px-4 py-5 rounded">
                                    <div class="row g-3">
                                        <h4 class="mb-4 mt-0" style="color: black; font-weight: bold;">Student's profile</h4>

                                        <input type="hidden" name="id" value="${sessionScope.data.id}">

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Name</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" name="name" value="${sessionScope.data.name}">
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Gender</label>
                                            <select class="form-control" style="background-color: whitesmoke" name="gender">

                                                <option value="Nam" ${sessionScope.data.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                                <option value="Nữ" ${sessionScope.data.gender == 'Nữ' ? 'selected' : ''}>Nữ</option> 
                                                <option value="Khác" ${sessionScope.data.gender == 'Khác' ? 'selected' : ''}>Khác</option>
                                            </select>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Date of birth</label>
                                            <input type="date" class="form-control" style="background-color: whitesmoke" name="dob" value="${sessionScope.data.dob}">
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Ethnicity</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" name="ethnicity" value="${sessionScope.data.ethnicity}">
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Nationality</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" name="nation" value="${sessionScope.data.nation}">
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Phone Number</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" name="phone_num" value="${sessionScope.data.phone_num}" pattern="\d{10,11}" title="Số điện thoại phải bao gồm từ 10 đến 11 chữ số" required>
                                            <div class="invalid-feedback">Số điện thoại phải bao gồm từ 10 đến 11 chữ số.</div>
                                        </div>



                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">CCCD</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" name="cccd" value="${sessionScope.data.cccd}" pattern="\d{12}" title="CCCD phải bao gồm đúng 12 chữ số" required>
                                            <div class="invalid-feedback">CCCD phải bao gồm đúng 12 chữ số.</div>
                                        </div>


                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Address</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" name="address" value="${sessionScope.data.address}">
                                        </div>




                                    </div> 
                                </div>
                            </div>
                        </div> 



                        <div class="gap-3 d-md-flex justify-content-md-end text-center" style=" text-align: center">
                            <button type="submit" class="btn btn-primary btn-lg" style="font-weight: bold; width: 100px" name="update" value="update">Update</button>
                            <button type="submit" class="btn btn-danger btn-lg" style="font-weight: bold; width: 100px" name="update" value="back">Back</button>

                        </div>

                    </div> 


                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var form = document.querySelector('form');
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
                form.addEventListener('submit', function (event) {
                    var nameInput = form.querySelector('input[name="name"]');
                    var nameValue = nameInput.value.trim();

                    // Kiểm tra ký tự đặc biệt và chữ số trong tên
                    if (!/^[\p{L}\s]+$/u.test(nameValue)) {
                        alert('Tên chỉ được phép nhập các ký tự tiếng Việt và khoảng trắng.');
                        event.preventDefault();
                        return;
                    }

                    // Kiểm tra nếu tên không rỗng
                    if (nameValue === '') {
                        alert('Vui lòng nhập tên.');
                        event.preventDefault();
                        return;
                    }

                    // Nếu đạt điều kiện, cho phép submit
                    form.classList.add('was-validated');
                });
            });
            document.addEventListener('DOMContentLoaded', function () {
                var form = document.querySelector('form');
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        </script>

    </form>
</body>
</html>
