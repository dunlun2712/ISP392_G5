/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.water;

/**
 *
 * @author DELL
 */
public class WaterDAO extends DBContext{
    private DBContext dbContext;

    public WaterDAO() {
        dbContext = new DBContext();
    }

    public List<water> getAll() throws SQLException {
        List<water> wate = new ArrayList<>();
        String query = "SELECT * FROM Water";
        try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                water el = new water();
                el.setWater_id(resultSet.getInt("water_id"));
                el.setRoom_id(resultSet.getString("room_id"));
                el.setUsage_type(resultSet.getString("usage_type"));
                el.setCreation_date(resultSet.getDate("creation_date"));
                el.setExpiration_date(resultSet.getDate("expiration_date"));
                el.setSemester(resultSet.getString("semester"));
                el.setMeter_number(resultSet.getString("meter_number"));
                el.setNew_reading(resultSet.getDouble("new_reading"));
                el.setOld_reading(resultSet.getDouble("old_reading"));
                el.setConsumption(resultSet.getDouble("consumption"));
                wate.add(el);
            }
        }
        return wate;
    }
    public void updateWater(water water) {
        String query = "UPDATE Water SET room_id = ?, usage_type = ?, "
                + "creation_date = ?, expiration_date = ?, semester = ?, meter_number = ?, "
                + "new_reading = ?, old_reading = ?, consumption = ? WHERE water_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, water.getRoom_id());
            ps.setString(2, water.getUsage_type());
            ps.setDate(3, new java.sql.Date(water.getCreation_date().getTime()));
            ps.setDate(4, new java.sql.Date(water.getExpiration_date().getTime()));
            ps.setString(5, water.getSemester());
            ps.setString(6, water.getMeter_number());
            ps.setDouble(7, water.getNew_reading());
            ps.setDouble(8, water.getOld_reading());
            ps.setDouble(9, water.getConsumption());
            ps.setInt(10, water.getWater_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public water getWaterById(int water_id) {
        water water = null;
        String query = "SELECT * FROM Water WHERE water_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, water_id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    water = new water();
                    water.setWater_id(rs.getInt("water_id"));
                    water.setRoom_id(rs.getString("room_id"));
                    water.setUsage_type(rs.getString("usage_type"));
                    water.setCreation_date(rs.getDate("creation_date"));
                    water.setExpiration_date(rs.getDate("expiration_date"));
                    water.setSemester(rs.getString("semester"));
                    water.setMeter_number(rs.getString("meter_number"));
                    water.setNew_reading(rs.getDouble("new_reading"));
                    water.setOld_reading(rs.getDouble("old_reading"));
                    water.setConsumption(rs.getDouble("consumption"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return water;
    }
    public List<water> searchByName(String keyword) {
        List<water> wa = new ArrayList<>();
        String sql = "SELECT * FROM Water WHERE room_id like ?"; 
        try (PreparedStatement stmt = dbContext.connection.prepareStatement(sql)) {
            String likeKeyword = "%" + keyword + "%";
            stmt.setString(1, likeKeyword);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    water wt = new water();
                    wt.setWater_id(rs.getInt("water_id"));
                    wt.setRoom_id(rs.getString("room_id"));
                    wt.setUsage_type(rs.getString("usage_type"));
                    wt.setCreation_date(rs.getDate("creation_date"));
                    wt.setExpiration_date(rs.getDate("expiration_date"));
                    wt.setSemester(rs.getString("semester"));
                    wt.setMeter_number(rs.getString("meter_number"));
                    wt.setNew_reading(rs.getDouble("new_reading"));
                    wt.setOld_reading(rs.getDouble("old_reading"));
                    wt.setConsumption(rs.getDouble("consumption"));
                    wa.add(wt);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return wa;
    }
    
}
