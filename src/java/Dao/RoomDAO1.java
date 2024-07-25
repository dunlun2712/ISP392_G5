/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Room;
import dal.DBContext;
import java.util.List;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class RoomDAO1 extends DBContext {

    private DBContext dBContext;

    public RoomDAO1() {
        connectDB();
        dBContext = new DBContext();
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

    public List<Room> getAllRoom() throws SQLException {
        List<Room> room = new ArrayList<>();
        String query = "SELECT * FROM Room";
        try (Statement statement = dBContext.connection.createStatement(); ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                String room_id = resultSet.getString("room_id");
                int dorm_id = resultSet.getInt("dorm_id"); // Ép kiểu sang int vì dorm_id là số nguyên
                int floor = resultSet.getInt("floor"); // Ép kiểu sang int vì floor là số nguyên
                String room_type = resultSet.getString("room_type");
                int price = resultSet.getInt("price"); // Ép kiểu sang int vì price là số nguyên
                String room_status = resultSet.getString("room_status");
                String room_usage = resultSet.getString("room_usage");
                Room r = new Room(room_id, dorm_id, floor, room_type, price, room_status, room_usage);
                room.add(r);
            }
        }
        return room;
    }

    public Room getRoomById(String room_id) {
        try {
            String strSQL = "SELECT * FROM Room WHERE room_id = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, room_id); // Sử dụng chỉ số tham số đúng (1)
            rs = stm.executeQuery();
            if (rs.next()) {
                Room room = new Room();
                room.setRoom_id(rs.getString("room_id"));
                room.setDorm_id(rs.getInt("dorm_id"));
                room.setFloor(rs.getInt("floor"));
                room.setRoom_type(rs.getString("room_type"));
                room.setPrice((int) rs.getDouble("price"));
                room.setRoom_status(rs.getString("room_status"));
                room.setRoom_usage(rs.getString("room_usage"));

                return room;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Room> searchItemsByName(String keyword) {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM Room WHERE room_id like ?";
        try (PreparedStatement stmt = dBContext.connection.prepareStatement(sql)) {
            String likeKeyword = "%" + keyword + "%";
            stmt.setString(1, likeKeyword);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Room room = new Room();
                    room.setRoom_id(rs.getString("room_id"));
                    room.setDorm_id(rs.getInt("dorm_id"));
                    room.setFloor(rs.getInt("floor"));
                    room.setRoom_type(rs.getString("room_type"));
                    room.setPrice(rs.getInt("price"));
                    room.setRoom_status(rs.getString("room_status"));
                    room.setRoom_usage(rs.getString("room_usage"));
                    rooms.add(room);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }
}
