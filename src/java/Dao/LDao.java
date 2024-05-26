/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.*;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;


/**
 *
 * @author ASUS
 */
public class LDao extends DBContext {

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

    public boolean addDorrm(int dorm_id, String dorm_name) {
        boolean status = false;
        String query = "INSERT [dbo].[Dormitory] ( [dorm_id], [dorm_name])\n"
                + "                VALUES (?,?)";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, dorm_id);
            ps.setString(2, dorm_name);

            rs = ps.executeQuery();
//            ps.executeUpdate();

            int val = ps.executeUpdate();
            if (val > 0) {
                status = true;
            } else {
                status = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public void deleteDorm(String pid) {
        String query = "delete from [dbo].[Dormitory]\n"
                + "where dorm_id = ?";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);

            ps.executeUpdate(); //khong tra ve bang result nen phai dung excute update
        } catch (Exception e) {
        }
    }

    public boolean updateDorm(int dorm_id, String dorm_name) {
        String query = "UPDATE [dbo].[Dormitory] "
                + "SET [dorm_id] = ?, "
                + "[dorm_name] = ? "
                + "WHERE [dorm_id] = ?";
        try ( Connection conn = connection;  PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, dorm_id);
            ps.setString(2, dorm_name);
            ps.setInt(3, dorm_id); // Setting the dorm_id for the WHERE clause

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Dorminatory getDormById(int id) {
        String query = "SELECT * FROM [dbo].[Dormitory] WHERE [dorm_id] = ?";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Dorminatory(rs.getInt("dorm_id"), rs.getString("dorm_name"));
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

    public boolean addRoom(String room_id, int dorm_id, int floor, String room_type, int price, String room_status) {
        boolean status = false;
        String query = "INSERT [dbo].[Room] ( room_id,dorm_id, floor, room_type, price, room_status)\n"
                + "                VALUES (?,?,?,?,?,?)";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, room_id);
            ps.setInt(2, dorm_id);
            ps.setInt(3, floor);
            ps.setString(4, room_type);
            ps.setInt(5, price);
            ps.setString(6, room_status);
            rs = ps.executeQuery();
//            ps.executeUpdate();

            int val = ps.executeUpdate();
            if (val > 0) {
                status = true;
            } else {
                status = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
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

    public boolean updateRoom(String room_id, int dorm_id, int floor, String room_type, int price, String room_status) {
        String query = "UPDATE [dbo].[Room] "
                + "SET [room_id] = ?, "
                + "[dorm_id] = ?, "
                + "[floor] = ?, "
                + "[room_type] = ?, "
                + "[price] = ?, "
                + "[room_status] = ? "
                + "WHERE [room_id] = ?";
        try ( Connection conn = connection;  PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, room_id);
            ps.setInt(2, dorm_id);
            ps.setInt(3, floor);
            ps.setString(4, room_type);
            ps.setInt(5, price);
            ps.setString(6, room_status);
            ps.setString(7, room_id); // Đặt giá trị cho tham số WHERE

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
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

    public void deleteRoom(String pid) {
        String query = "delete from [dbo].[Room]\n"
                + "WHERE [room_id] = ?";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);

            ps.executeUpdate(); //khong tra ve bang result nen phai dung excute update
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        LDao dao = new LDao();

        int testDormId = 1;  // Thay đổi giá trị này thành ID tồn tại trong cơ sở dữ liệu của bạn
        Dorminatory d = dao.getDormById(testDormId);

        if (d != null) {
            System.out.println("Retrieved Dormitory: " + d.getDorm_name());
        } else {
            System.out.println("No Dormitory found with ID: " + testDormId);
        }
    }
}
