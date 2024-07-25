/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.RoomByHoai;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoomDaoHoai extends DBContext {

    private Connection connection;

    public RoomDaoHoai() {
        try {
            this.connection = getConnection();
        } catch (Exception e) {
            System.out.println("Connect failed");
        }
    }

    public List<RoomByHoai> getAllRooms() {
        List<RoomByHoai> rooms = new ArrayList<>();
        String sql = "SELECT * FROM Room";

        try ( PreparedStatement statement = connection.prepareStatement(sql);  ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {
                RoomByHoai room = new RoomByHoai();
                room.setRoom_id(rs.getString("room_id"));
                room.setDorm_id(rs.getInt("dorm_id"));
                room.setFloor(rs.getInt("floor"));
                room.setRoom_type(rs.getString("room_type"));
                room.setPrice(rs.getInt("price"));
                room.setRoom_status(rs.getString("room_status"));
                room.setRoom_usage(rs.getInt("room_usage"));

                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rooms;
    }

    public RoomByHoai getRoomById(String roomId) {
        String sql = "SELECT * FROM Room WHERE room_id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, roomId);

            try ( ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    RoomByHoai room = new RoomByHoai();
                    room.setRoom_id(rs.getString("room_id"));
                    room.setDorm_id(rs.getInt("dorm_id"));
                    room.setFloor(rs.getInt("floor"));
                    room.setRoom_type(rs.getString("room_type"));
                    room.setPrice(rs.getInt("price"));
                    room.setRoom_status(rs.getString("room_status"));
                    room.setRoom_usage(rs.getInt("room_usage"));

                    return room;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean createRoom(RoomByHoai room) {
        String sql = "INSERT INTO Room (room_id, dorm_id, floor, room_type, price, room_status, room_usage) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, room.getRoom_id());
            statement.setInt(2, room.getDorm_id());
            statement.setInt(3, room.getFloor());
            statement.setString(4, room.getRoom_type());
            statement.setInt(5, room.getPrice());
            statement.setString(6, room.getRoom_status());
            statement.setInt(7, room.getRoom_usage());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean updateRoom(RoomByHoai room) {
        String sql = "UPDATE Room SET dorm_id = ?, floor = ?, room_type = ?, price = ?, room_status = ?, room_usage = ? WHERE room_id = ?";

        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, room.getDorm_id());
            statement.setInt(2, room.getFloor());
            statement.setString(3, room.getRoom_type());
            statement.setInt(4, room.getPrice());
            statement.setString(5, room.getRoom_status());
            statement.setInt(6, room.getRoom_usage());
            statement.setString(7, room.getRoom_id());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean deleteRoom(String roomId) {
        String sql = "DELETE FROM Room WHERE room_id = ?";

        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, roomId);

            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
