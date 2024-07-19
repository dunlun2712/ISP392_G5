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

    public List<water> searchByNameWater(String roomId, String usageType, String semester, String meterNumber) {
        List<water> elList = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Water WHERE 1=1");

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
                    elList.add(wt);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return elList;
    }

    public List<String> getAllRooms() {
        List<String> rooms = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement("SELECT DISTINCT room_id FROM Water"); 
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
        try (PreparedStatement stmt = connection.prepareStatement("SELECT DISTINCT semester FROM Water");
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
        try (PreparedStatement stmt = connection.prepareStatement("SELECT DISTINCT meter_number FROM Water"); 
                ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                meters.add(rs.getString("meter_number"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return meters;
    }
    
    public void delete(int waterId) throws SQLException {
        String query = "DELETE FROM Water WHERE water_id = ?";
        try (PreparedStatement statement = dbContext.connection.prepareStatement(query)) {
            statement.setInt(1, waterId);
            statement.executeUpdate();
        }
    }
}
