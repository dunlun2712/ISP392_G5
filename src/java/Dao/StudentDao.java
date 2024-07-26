/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Booking;
import Model.Student;
import Model.electric;
import Model.water;
import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDao extends DBContext {

    public StudentDao() {
        connectDB();
    }
    Connection cnn; //ket noi db
    PreparedStatement stm; // thuc hien cac cau lenh sql
    ResultSet rs;//luu tru va xu ly du lieu

//khai bao thanh phan xu ly database
    private void connectDB() {
        cnn = connection;
        if (cnn != null) {
            System.out.println("connect succes");
        } else {
            System.out.println("connect fail");
        }
    }

    public String getIdByEmail(String email) {
        try {
            String strSQL = "SELECT users_id FROM Users WHERE email = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, email); // Sử dụng chỉ số tham số đúng (1)
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getString("users_id"); // Lấy giá trị của cột "users_id"
            }
        } catch (Exception e) {
            System.out.println("getIdByEmail: " + e.getMessage());
        }
        return "";
    }

    public Student getInfoStudent(String id) {
        Student student = null;
        try {
            String strSQL = "select * from Users where users_id = ? ";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                String userID = rs.getString(1);
                String role = rs.getString(2);
                String name = rs.getString(3);
                String pass = rs.getString(4);
                String email = rs.getString(5);
                String cccd = rs.getString(6);
                String major = rs.getString(7);
                String course = rs.getString(8);
                String address = rs.getString(9);
                String dob = String.valueOf(rs.getDate(10));
                String gender = rs.getString(11);
                String ethnicity = rs.getString(12);
                String nation = rs.getString(13);
                String phone_num = rs.getString(14);
                String relative_name = rs.getString(15);
                String relative_contact = rs.getString(16);
                String status = rs.getString(17);

                student = new Student(userID, pass, name, role, email, dob, cccd, major, course, address, gender, ethnicity, nation, phone_num, relative_name, relative_contact,  status);
            }
        } catch (Exception e) {
            System.out.println("getUsers:" + e.getMessage());
        }
        return student;
    }

    public void updateStudentInfo(Student student) {
        try {
            String strSQL = "UPDATE [dbo].[Users]\n"
                    + "   SET \n"
                    + "      [users_name] = ?\n"
                    + "      ,[cccd] = ?\n"
                    + "      ,[address] = ?\n"
                    + "      ,[dob] = ?\n"
                    + "      ,[gender] = ?\n"
                    + "      ,[ethnicity] = ?\n"
                    + "      ,[nation] = ?\n"
                    + "      ,[phone_number] = ?\n"
                    + "      \n"
                    + " WHERE users_id=?";
            stm = cnn.prepareStatement(strSQL);

            stm.setString(1, student.getName());            // users_name
            stm.setDate(4, Date.valueOf(student.getDob())); // dob
            stm.setString(2, student.getCccd());            // cccd
            stm.setString(3, student.getAddress());         // address
            stm.setString(5, student.getGender());          // gender
            stm.setString(6, student.getEthnicity());       // ethnicity
            stm.setString(7, student.getNation());          // nation
            stm.setString(8, student.getPhone_num());       // phone_number
            stm.setString(9, student.getId());             // users_id

            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateStudentInfo: " + e.getMessage());
        }
    }

    public void updatePass(String newPassword, String id) {
        try {
            String strSQL = "update Users set pass=? WHERE users_id=?";
            stm = cnn.prepareStatement(strSQL);

            stm.setString(1, newPassword);
            stm.setString(2, id);

            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateStudentInfo: " + e.getMessage());
        }
    }

    public ArrayList<Student> getAllStudent() {
        ArrayList<Student> data = new ArrayList<Student>();
        Student student = null;
        try {
            String strSQL = "select * from Users ";
            stm = cnn.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String userID = rs.getString(1);
                String role = rs.getString(2);
                String name = rs.getString(3);
                String pass = rs.getString(4);
                String email = rs.getString(5);
                String cccd = rs.getString(6);
                String major = rs.getString(7);
                String course = rs.getString(8);
                String address = rs.getString(9);
                String dob = String.valueOf(rs.getDate(10));
                String gender = rs.getString(11);
                String ethnicity = rs.getString(12);
                String nation = rs.getString(13);
                String phone_num = rs.getString(14);
                String relative_name = rs.getString(15);
                String relative_contact = rs.getString(16);
                String status = rs.getString(17);

                student = new Student(userID, pass, name, role, email, dob, cccd, major, course, address, gender, ethnicity, nation, phone_num, relative_name, relative_contact,  status);
                data.add(student);
            }
        } catch (Exception e) {
            System.out.println("getUsers:" + e.getMessage());
        }
        return data;
    }

    public void updateStudentStatus(String id, String newStatus) {

        try {
            String strSQL= "UPDATE Users SET status = ? WHERE users_id = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, newStatus);
            stm.setString(2, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
        public List<electric> getStudentForElec(String roomID) {
       
        List<electric> electic = new ArrayList<>();
        String sql = "SELECT * FROM Electricity  where room_id = ?";
        try {
            stm = cnn.prepareStatement(sql);
             stm.setString(1, roomID);
            rs = stm.executeQuery();
            while (rs.next()) {
                electric elec = new electric();
                elec.setElectricity_id(rs.getInt("electricity_id"));
                elec.setRoom_id(rs.getString("room_id"));
                elec.setUsage_type(rs.getString("usage_type"));
                elec.setCreation_date(rs.getDate("creation_date"));
                elec.setExpiration_date(rs.getDate("expiration_date"));
                elec.setSemester(rs.getString("semester"));
                elec.setMeter_number(rs.getString("meter_number"));
                elec.setConsumption(rs.getDouble("consumption"));
                elec.setOld_number(rs.getDouble("old_number"));
                elec.setNew_number(rs.getDouble("new_number"));
                electic.add(elec);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return electic;
    }
    
    public List<water> getStudentForWater(String roomID) {
        List<water> water = new ArrayList<>();
        String sql = "SELECT * FROM Water where room_id = ?";
        try {
            stm = cnn.prepareStatement(sql);
             stm.setString(1, roomID);
            rs = stm.executeQuery();
            while (rs.next()) {
                water wa = new water();
                wa.setWater_id(rs.getInt("water_id"));
                wa.setRoom_id(rs.getString("room_id"));
                wa.setUsage_type(rs.getString("usage_type"));
                wa.setCreation_date(rs.getDate("creation_date"));
                wa.setExpiration_date(rs.getDate("expiration_date"));
                wa.setSemester(rs.getString("semester"));
                wa.setMeter_number(rs.getString("meter_number"));
                wa.setNew_reading(rs.getDouble("new_reading"));
                wa.setOld_reading(rs.getDouble("old_reading"));
                wa.setConsumption(rs.getDouble("consumption"));
                water.add(wa);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return water;
    }

    public boolean checkEmail(String email) {
        try {
            String strSQL = "SELECT * FROM Users WHERE email = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, email); // Sử dụng chỉ số tham số đúng (1)
            rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("getIdByEmail: " + e.getMessage());
        }
        return false;
    }

}
