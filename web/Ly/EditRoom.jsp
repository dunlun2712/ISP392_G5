

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Room</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="updateroom" method="post" >
                            <input type="hidden" value="${back}" name="back">
                            <div class="modal-header">						
                                <h4 class="modal-title"></h4>
                                <a href="${back}" >
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" >&times;</button>
                                </a> 
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${details.room_id}" name="room_id" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Dorm_id</label>
                                    <input value="${details.dorm_id}" name="dorm_id" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Floor</label>
                                    <input value="${details.floor}" name="floor" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Room_Type</label>
                                      <select class="form-control" name="room_type">
                                    <option value="4 bed" <c:if test="${details.room_type == '4 bed'}">selected</c:if>>4 bed</option>
                                    <option value="6 bed" <c:if test="${details.room_type == '6 bed'}">selected</c:if>>6 bed</option>
                                  
                                </select>
                                    
                                </div>

                                <div class="form-group">
                                    <label>Price</label>
                                    <input value="${details.price}" name="price" type="text" class="form-control"  required>
                                </div>
                                <select name="room_status">
                                    <option value="Available" <c:if test="${details.room_status == 'Available'}">selected</c:if>>Available</option>
                                    <option value="Under Maintenance" <c:if test="${details.room_status == 'Under Maintenance'}">selected</c:if>>Under Maintenance</option>
                                    <option value="Occupied" <c:if test="${details.room_status == 'Occupied'}">selected</c:if>>Occupied</option>
                                </select>



                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
