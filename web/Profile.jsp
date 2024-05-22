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
        <form action="viewprofile" method="post">
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

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">UserID</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" value="${sessionScope.data.id}" readonly>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Name</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" value="${sessionScope.data.name}" readonly>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Gender</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" value="${sessionScope.data.gender}" readonly>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Date of birth</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" value="${sessionScope.data.dob}" readonly>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Ethnicity</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" value="${sessionScope.data.ethnicity}" readonly>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Nationality</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" value="${sessionScope.data.nation}" readonly>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Phone Number</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" value="${sessionScope.data.phone_num}" readonly>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Email</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" value="${sessionScope.data.email}" readonly>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">CCCD</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" value="${sessionScope.data.cccd}" readonly>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Address</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" value="${sessionScope.data.address}" readonly>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Major</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" value="${sessionScope.data.major}" readonly>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Course</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" value="${sessionScope.data.course}" readonly>
                                        </div>
                                        
                                        
                                    </div> 
                                </div>
                            </div>
                        </div> 

                        <div class="row mb-5 gx-5">
                            <div class="col-xxl-6 mb-5 mb-xxl-0">
                                <div class="bg-secondary-soft px-4 py-5 rounded">
                                    <div class="row g-3">
                                        <h4 class="mb-4 mt-0" style="color: black; font-weight: bold;">Family Member Contact</h4>
                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Name</label>
                                            <input type="text" class="form-control" style ="background-color: whitesmoke" value="${sessionScope.data.relative_name}" readonly>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Phone Number</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" value="${sessionScope.data.relative_contact}" readonly>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Address</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" value="${sessionScope.data.address}" readonly>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label" style="color: black; font-weight: bold;">Email</label>
                                            <input type="text" class="form-control" style="background-color: whitesmoke" value="${sessionScope.data.email}" readonly>
                                        </div>
                                    </div> 
                                </div>
                            </div>

                            
                        </div> 

                        <div class="gap-3 d-md-flex justify-content-md-end text-center" >
                            <button type="submit" class="btn btn-danger btn-lg" style="font-weight: bold" name="update" value="pass_update">Update Password</button>
                            <button type="submit" class="btn btn-primary btn-lg" style="font-weight: bold" name="update" value="profile_update">Update Profile</button>
                        </div>

                    </div>
                </div>
            </div>

            <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            <script type="text/javascript">
                // Your JavaScript code
            </script>
        </form>
    </body>
</html>
