/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.*;
import dal.DBContext;

/**
 *
 * @author khanh
 */
public class RoomDAO extends DBContext {

    public List<RoomHome> searchRoomByName(String txtSearch) {
        List<RoomHome> list = new ArrayList<>();
        String query = """
                       SELECT r.[room_id]
                             ,r.[dorm_id]
                             ,r.[floor]
                             ,r.[room_type]
                             ,r.[price]
                             ,r.[room_status]
                             ,d.[dorm_name]
                         FROM [dbo].[Room] r
                         JOIN Dormitory d ON r.dorm_id = d.dorm_id
                         WHERE r.room_type LIKE ? OR d.dorm_name LIKE ?""";
        try (Connection conn = connection;
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, "%" + txtSearch + "%");
            ps.setString(2, "%" + txtSearch + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    RoomHome room = new RoomHome();
                    room.setRoomID(rs.getString("room_id"));
                    room.setFloor(rs.getString("floor"));
                    room.setRoomType(rs.getString("room_type"));
                    room.setPrice(rs.getInt("price"));
                    room.setRoomStatus(rs.getString("room_status"));

                    Dorm dorm = new Dorm();
                    dorm.setDormName(rs.getString("dorm_name"));
                    room.setDorm(dorm);

                    list.add(room);
                }
            }
        } catch (SQLException e) {
           
        }
        return list;
    }
    public static void main(String[] args) {
        RoomDAO r = new RoomDAO();
        System.out.println(r);
    }
}
