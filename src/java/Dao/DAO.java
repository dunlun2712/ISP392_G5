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
import static java.util.Collections.list;
import java.util.List;
import Model.*;
import dal.DBContext;

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
        String query = "SELECT * FROM Dormitory ";
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

    public List<Room> getRoomByStatus() {
        List<Room> list = new ArrayList<>();
        String query = "SELECT room_id, dorm_id, floor, room_type, price, room_status\n"
                + "FROM [dbo].[Room]\n"
                + "WHERE room_status LIKE '%Available%'";

        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Room room = new Room(
                        rs.getString("room_id"),
                        rs.getInt("dorm_id"),
                        rs.getInt("floor"),
                        rs.getString("room_type"), // Change this to getString
                        rs.getInt("price"),
                        rs.getString("room_status") // Get the actual room status from the result set
                );
                list.add(room);
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
        StringBuilder query = new StringBuilder("SELECT r.room_id,r.dorm_id ,r.floor, r.room_type, r.price, r.room_status "
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
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6));
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

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Room> rooms = dao.getRoomByStatus();

        if (rooms.isEmpty()) {
            System.out.println("No rooms found with status 'Available'.");
        } else {
            System.out.println("Rooms with status 'Available':");
            for (Room room : rooms) {
                System.out.println(room.getRoom_id());
            }
        }
    }

    public List<Room> getAllRoomById(String id) {
        List<Room> list = new ArrayList<>();
        String query = "SELECT r.room_id,r.dorm_id ,r.floor, r.room_type, r.price, r.room_status "
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
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6));
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

    public Room getRoomById(String room_id) {
        String query = "SELECT * FROM [dbo].[Room] WHERE [room_id] = ?";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, room_id);
            rs = ps.executeQuery();
            if (rs.next()) {

                return new Room(
                        rs.getString("room_id"),
                        rs.getInt("dorm_id"),
                        rs.getInt("floor"),
                        rs.getString("room_type"),
                        rs.getInt("price"),
                        rs.getString("room_status")
                );
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ, ví dụ: ghi log hoặc in ra thông báo lỗi
            e.printStackTrace();
        } finally {
            // Đảm bảo các tài nguyên cơ sở dữ liệu được đóng sau khi sử dụng
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }
}
