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

    public List<HistoryBillAdmin> getHistoryBillAdmin() {
        List<HistoryBillAdmin> list = new ArrayList<>();
        String query = "select u.users_id, u.users_name ,u.cccd, u.dob, u.course ,u.phone_number, u.gender, u.major, r.room_id, r.checkin_date, r.checkout_date, r.total_price\n"
                + "from [dbo].[Users] as u \n"
                + "join [dbo].[Room_booking] as r on r.users_id = u.users_id ";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new HistoryBillAdmin(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    

   

    public List<HistoryBillAdmin> searchHistoryBill(String txtSearch) {
        List<HistoryBillAdmin> list = new ArrayList<>();
        String query = "select u.users_id, u.users_name ,u.cccd, u.dob, u.course ,u.phone_number, u.gender, u.major, r.room_id, r.checkin_date, r.checkout_date, r.total_price\n"
                + "from [dbo].[Users] as u \n"
                + "join [dbo].[Room_booking] as r on r.users_id = u.users_id\n"
                + "where u.users_id like ? or  u.users_name like ? or  u.gender like ? or  r.room_id like ? or  u.course like ? ";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setString(2, "%" + txtSearch + "%");
            ps.setString(3, "%" + txtSearch + "%");
            ps.setString(4, "%" + txtSearch + "%");
            ps.setString(5, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new HistoryBillAdmin(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

 

    public List<HistoryBooking> getHistoryBookingById(String id) {
        List<HistoryBooking> list = new ArrayList<>();
        String query = "SELECT r.[booking_id],r.[room_id] ,r.[users_id],r.[checkin_date] ,r.[checkout_date],r.[note], d.dorm_name,ro.price,ro.room_type\n"
                + "            FROM [dbo].[Room_booking] as r\n"
                + "			join [dbo].[Room] as ro on ro.room_id =r.room_id\n"
                + "			join [dbo].[Dormitory] as d on d.dorm_id = ro.dorm_id\n"
                + "              WHERE r.users_id = ?;";

        try {
            conn = connection; // Assuming connection is properly initialized elsewhere
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                HistoryBooking room = new HistoryBooking(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
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

    public ParkingH getParkingDetails(String id) {

        String query = "SELECT [ticket_id]\n"
                + "      ,[vehicle_number]\n"
                + "      ,[price]\n"
                + "	  ,[status]\n"
                + "  FROM [dbo].[ParkingTicket]\n"
                + "  where users_id = ?;";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {

                return new ParkingH(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

}
