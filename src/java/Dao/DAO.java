/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import model.*;

/**
 *
 * @author ASUS
 */
public class DAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Dorminatory> getAllDorm() {
        List<Dorminatory> list = new ArrayList<>();
        String query = "SELECT \n"
                + "    d.dorm_id,\n"
                + "    d.dorm_name\n"
                + "\n"
                + "FROM \n"
                + "    [dbo].[Dormitory] AS d";
        try {

            conn = connection;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Dorminatory(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Room> getAllRoomById(String id) {
        List<Room> list = new ArrayList<>();
        String query = "SELECT r.room_id, r.floor, r.room_type, r.price, r.room_status "
                + "FROM [dbo].[Room] AS r "
                + "JOIN [dbo].[Dormitory] AS d ON d.dorm_id = r.dorm_id "
                + "WHERE d.dorm_id = ?";

        try {
            conn = connection; // Assuming connection is properly initialized elsewhere
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                Room room = new Room(rs.getString(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5));
                list.add(room);
            }
        } catch (SQLException e) {
            // Handle exception appropriately, either logging it or throwing it further
            e.printStackTrace();
        } finally {
            // Close resources properly in a finally block
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public List<Room> searchRoomByStatus(String status) {
        List<Room> list = new ArrayList<>();
        String query = "SELECT r.room_id, r.floor, r.room_type, r.price, r.room_status\n"
                + "FROM [dbo].[Room] AS r\n"
                + "JOIN [dbo].[Dormitory] AS d ON d.dorm_id = r.dorm_id\n"
                + "WHERE d.dorm_id = ?\n"
                + "AND r.room_status LIKE ?	";

        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + status + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getString(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
     public List<Room> getRooms(String dormId, String status) {
        List<Room> list = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT r.room_id, r.floor, r.room_type, r.price, r.room_status "
                + "FROM [dbo].[Room] AS r "
                + "JOIN [dbo].[Dormitory] AS d ON d.dorm_id = r.dorm_id "
                + "WHERE d.dorm_id = ?");

        if (status != null && !status.isEmpty()) {
            query.append(" AND r.room_status LIKE ?");
        }

        try {
            conn = connection; // Assuming connection is properly initialized elsewhere
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, dormId);
            if (status != null && !status.isEmpty()) {
                ps.setString(2, "%" + status + "%");
            }
            rs = ps.executeQuery();

            while (rs.next()) {
                Room room = new Room(rs.getString(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5));
                list.add(room);
            }
        } catch (SQLException e) {
            // Handle exception appropriately, either logging it or throwing it further
            e.printStackTrace();
        } finally {
            // Close resources properly in a finally block
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

}
