/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Booking;
import Model.Student;
import dal.DBContext;
import jakarta.servlet.http.HttpServletRequest;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class RoomDao extends DBContext {

    public RoomDao() {
        connectDB();
    }
    Connection cnn; //ket noi db
    PreparedStatement stm; // thuc hien cac cau lenh sql
    ResultSet rs;//luu tru va xu ly du lieu

//khai bao thanh phan xu ly database
    private void connectDB() {
        cnn = connection;
        if (cnn != null) {
            System.out.println("connect succes");
        } else {
            System.out.println("connect fail");
        }
    }

    public Booking getBookInfo(String id) {
        Booking book = null;
        try {
            String strSQL = "select * from room_booking where users_id = ? ";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                String book_id = rs.getString(1);
                String room_id = rs.getString(2);
                Date checkin = rs.getDate(4);
                Date checkout = rs.getDate(5);
                String price = rs.getString(6);
                String note = rs.getString(7);
                book = new Booking(book_id, room_id, id, checkin, checkout, price, note);
                return book;
            }
        } catch (Exception e) {
            System.out.println("getUsers:" + e.getMessage());
        }
        return book;
    }

    public void addNewRequest(String room_id, String user_id, String type, String request, LocalDate sqlDate) {
        try {
            String strSQL = "insert into Request (room_id,users_id,request_type,request,request_date) VALUES(?,?,?,?,? )";
            stm = cnn.prepareStatement(strSQL);

            stm.setString(1, room_id);
            stm.setString(2, user_id);
            stm.setString(3, type);
            stm.setString(4, request);
            stm.setDate(5, java.sql.Date.valueOf(sqlDate));

            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateStudentInfo: " + e.getMessage());
        }
    }

}
