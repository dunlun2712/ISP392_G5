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
import model.electric;
import java.sql.Connection;
/**
 *
 * @author DELL
 */
public class ElectricDAO extends DBContext {

    private DBContext dbContext;

    public ElectricDAO() {
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

    public List<electric> searchByNameElec(String roomId, String usageType, String semester, String meterNumber) {
        List<electric> elList = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Electricity WHERE 1=1");

        if (roomId != null && !roomId.isEmpty()) {
            sql.append(" AND room_id LIKE ?");
        }
        if (usageType != null && !usageType.isEmpty()) {
            sql.append(" AND usage_type LIKE ?");
        }
        if (semester != null && !semester.isEmpty()) {
            sql.append(" AND semester LIKE ?");
        }
        if (meterNumber != null && !meterNumber.isEmpty()) {
            sql.append(" AND meter_number LIKE ?");
        }

        try (PreparedStatement stmt = dbContext.connection.prepareStatement(sql.toString())) {
            int index = 1;
            if (roomId != null && !roomId.isEmpty()) {
                stmt.setString(index++, "%" + roomId + "%");
            }
            if (usageType != null && !usageType.isEmpty()) {
                stmt.setString(index++, "%" + usageType + "%");
            }
            if (semester != null && !semester.isEmpty()) {
                stmt.setString(index++, "%" + semester + "%");
            }
            if (meterNumber != null && !meterNumber.isEmpty()) {
                stmt.setString(index++, "%" + meterNumber + "%");
            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    electric el = new electric();
                    el.setElectricity_id(rs.getInt("electricity_id"));
                    el.setRoom_id(rs.getString("room_id"));
                    el.setUsage_type(rs.getString("usage_type"));
                    el.setCreation_date(rs.getDate("creation_date"));
                    el.setExpiration_date(rs.getDate("expiration_date"));
                    el.setSemester(rs.getString("semester"));
                    el.setMeter_number(rs.getString("meter_number"));
                    el.setConsumption(rs.getDouble("consumption"));
                    el.setOld_number(rs.getDouble("old_number"));
                    el.setNew_number(rs.getDouble("new_number"));
                    elList.add(el);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return elList;
    }

    public List<String> getAllRooms() {
        List<String> rooms = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement("SELECT DISTINCT room_id FROM Electricity"); 
                ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                rooms.add(rs.getString("room_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    public List<String> getAllSemesters() {
        List<String> semesters = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement("SELECT DISTINCT semester FROM Electricity");
                ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                semesters.add(rs.getString("semester"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return semesters;
    }

    public List<String> getAllMeters() {
        List<String> meters = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement("SELECT DISTINCT meter_number FROM Electricity"); 
                ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                meters.add(rs.getString("meter_number"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return meters;
    }
}
