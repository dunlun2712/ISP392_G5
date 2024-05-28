/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Dorminatory;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.*;

/**
 *
 * @author khanh
 */
public class RoomDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Dorminatory> searchRoomByName(String dormName) {
        List<Dorminatory> list = new ArrayList<>();
        String query = ("SELECT * FROM [dbo].[Dormitory] WHERE [dorm_name] = ?");
        try (Connection conn = connection; PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(2, dormName);
            rs = ps.executeQuery();
            if (rs.next()) {
                return (List<Dorminatory>) new Dorminatory(rs.getInt("dormID"), rs.getString("dormName"));
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

    public static void main(String[] args) {
        RoomDAO r = new RoomDAO();
        System.out.println(r);
    }
}
