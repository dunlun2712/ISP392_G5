/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Req;
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

    public ArrayList<Req> getAllRequestOfStudent(String id) {
        ArrayList<Req> data = new ArrayList<Req>();
        Req req = null;
        try {
            String strSQL = "select * from request where users_id = ? ";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                String req_id = rs.getString(1);
                String room_id = rs.getString(2);
                String user = rs.getString(3);
                String request_type = rs.getString(4);

                String note = rs.getString(5);
                Date req_date = rs.getDate(6);
                String response = rs.getString(7);
                Date resp_date = rs.getDate(8);
                String response_status = rs.getString(9);
                req = new Req(req_id, room_id, user, request_type, note, response, response_status, req_date, resp_date);
                data.add(req);
            }
        } catch (Exception e) {
            System.out.println("getUsers:" + e.getMessage());
        }
        return data;
    }

    public void deleteRequest(String req_id) {
        try {
            String strSQL = "Delete from Request where request_id=?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, req_id);

            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateStudentInfo: " + e.getMessage());
        }
    }

    public Req getInfoReq(String req_id) {
        Req req = null;
        
        try {
            String strSQL = "select * from request where request_id = ? ";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, req_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                String request_id = rs.getString(1);
                String room_id = rs.getString(2);
                String user = rs.getString(3);
                String request_type = rs.getString(4);

                String note = rs.getString(5);
                Date req_date = rs.getDate(6);
                String response = rs.getString(7);
                Date resp_date = rs.getDate(8);
                String response_status = rs.getString(9);
                req = new Req(request_id, room_id, user, request_type, note, response, response_status, req_date, resp_date);
                return req;
            }
        } catch (Exception e) {
            System.out.println("getUsers:" + e.getMessage());
        }
        return req;
    }

}
