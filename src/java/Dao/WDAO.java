/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.water;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author khanh
 */
public class WDAO extends DBContext {
    private DBContext dbContext;

    public WDAO() {
        dbContext = new DBContext();
    }
    
    public List<water> getAll() throws SQLException {
        List<water> water = new ArrayList<>();
        String query = "SELECT * FROM Water";
        try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                water w = new water();
                w.setWater_id(resultSet.getInt("water_id"));
                w.setRoom_id(resultSet.getString("room_id"));
                w.setUsage_type(resultSet.getString("usage_type"));
                w.setCreation_date(resultSet.getDate("creation_date"));
                w.setExpiration_date(resultSet.getDate("expiration_date"));
                w.setSemester(resultSet.getString("semester"));
                w.setMeter_number(resultSet.getString("meter_number"));
                w.setOld_number(resultSet.getDouble("old_number"));
                w.setNew_number(resultSet.getDouble("new_number"));
                water.add(w);
            }
        }
        return water;
    }
    public void updateWater(water water) {
        String query = "UPDATE Water SET room_id = ?, usage_type = ?, "
                + "creation_date = ?, expiration_date = ?, semester = ?, meter_number = ?, "
                + "old_number = ?, new_number = ? WHERE water_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, water.getRoom_id());
            ps.setString(2, water.getUsage_type());
            ps.setDate(3, new java.sql.Date(water.getCreation_date().getTime()));
            ps.setDate(4, new java.sql.Date(water.getExpiration_date().getTime()));
            ps.setString(5, water.getSemester());
            ps.setString(6, water.getMeter_number());
            ps.setDouble(7, water.getOld_number());
            ps.setDouble(8, water.getNew_number());
            ps.setInt(9, water.getWater_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void deleteWater(int water_id) {
        String query = "DELETE FROM Water WHERE water_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, water_id);
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
                    water.setOld_number(rs.getDouble("old_number"));
                    water.setNew_number(rs.getDouble("new_number"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return water;
    }
}
