/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.PreparedStatement;
import Model.electric;
import Model.water;
import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class ElecDAO extends DBContext{
    private DBContext dbContext;

    public ElecDAO() {
        dbContext = new DBContext();
    }
    
    public List<electric> getAll() throws SQLException {
        List<electric> elec = new ArrayList<>();
        String query = "SELECT * FROM Electricity";
        try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                electric el = new electric();
                el.setElectricity_id(resultSet.getInt("electricity_id"));
                el.setRoom_id(resultSet.getString("room_id"));
                el.setUsage_type(resultSet.getString("usage_type"));
                el.setCreation_date(resultSet.getDate("creation_date"));
                el.setExpiration_date(resultSet.getDate("expiration_date"));
                el.setSemester(resultSet.getString("semester"));
                el.setMeter_number(resultSet.getString("meter_number"));
                el.setConsumption(resultSet.getDouble("consumption"));
                el.setOld_number(resultSet.getDouble("old_number"));
                el.setNew_number(resultSet.getDouble("new_number"));
                elec.add(el);
            }
        }
        return elec;
    }
    public void updateElectric(electric electric) {
        String query = "UPDATE Electricity SET room_id = ?, usage_type = ?, "
                + "creation_date = ?, expiration_date = ?, semester = ?, meter_number = ?, "
                + "consumption = ?, old_number = ?, new_number = ? WHERE electricity_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, electric.getRoom_id());
            ps.setString(2, electric.getUsage_type());
            ps.setDate(3, new java.sql.Date(electric.getCreation_date().getTime()));
            ps.setDate(4, new java.sql.Date(electric.getExpiration_date().getTime()));
            ps.setString(5, electric.getSemester());
            ps.setString(6, electric.getMeter_number());
            ps.setDouble(7, electric.getConsumption());
            ps.setDouble(8, electric.getOld_number());
            ps.setDouble(9, electric.getNew_number());
            ps.setInt(10, electric.getElectricity_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void deleteElectric(int electricity_id) {
        String query = "DELETE FROM Electricity WHERE electricity_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, electricity_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public electric getElectricById(int electricity_id) {
        electric electric = null;
        String query = "SELECT * FROM Electricity WHERE electricity_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, electricity_id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    electric = new electric();
                    electric.setElectricity_id(rs.getInt("electricity_id"));
                    electric.setRoom_id(rs.getString("room_id"));
                    electric.setUsage_type(rs.getString("usage_type"));
                    electric.setCreation_date(rs.getDate("creation_date"));
                    electric.setExpiration_date(rs.getDate("expiration_date"));
                    electric.setSemester(rs.getString("semester"));
                    electric.setMeter_number(rs.getString("meter_number"));
                    electric.setConsumption(rs.getDouble("consumption"));
                    electric.setOld_number(rs.getDouble("old_number"));
                    electric.setNew_number(rs.getDouble("new_number"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return electric;
    }
    private boolean isRoomIdExists(String room_id) {
    String query = "SELECT room_id FROM Room WHERE room_id = ?";
    try (PreparedStatement ps = connection.prepareStatement(query)) {
        ps.setString(1, room_id);
        try (ResultSet rs = ps.executeQuery()) {
            return rs.next(); // Returns true if room_id exists, false otherwise
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}
    public List<electric> searchById(String keyword) {
        List<electric> wa = new ArrayList<>();
        String sql = "SELECT * FROM Electricity WHERE room_id like ?";
        try (PreparedStatement stmt = dbContext.connection.prepareStatement(sql)) {
            String likeKeyword = "%" + keyword + "%";
            stmt.setString(1, likeKeyword);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    electric electric = new electric();
                     electric.setElectricity_id(rs.getInt("electricity_id"));
                    electric.setRoom_id(rs.getString("room_id"));
                    electric.setUsage_type(rs.getString("usage_type"));
                    electric.setCreation_date(rs.getDate("creation_date"));
                    electric.setExpiration_date(rs.getDate("expiration_date"));
                    electric.setSemester(rs.getString("semester"));
                    electric.setMeter_number(rs.getString("meter_number"));
                    electric.setConsumption(rs.getDouble("consumption"));
                    electric.setOld_number(rs.getDouble("old_number"));
                    electric.setNew_number(rs.getDouble("new_number"));
                    wa.add(electric);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return wa;
    }
}
