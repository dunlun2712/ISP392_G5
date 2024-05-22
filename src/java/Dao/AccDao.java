/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Account;
import Model.Student;
import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;

public class AccDao extends DBContext {

    public AccDao() {
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

    public void insertAcc(String acc, String acc_pass) {
        try {
            String strSQL = "INSERT INTO [dbo].[Account]\n"
                    + "           ([acc_username]\n"
                    + "           ,[acc_pass])\n"
                    + "     VALUES (?,?) ";
            stm = cnn.prepareStatement(strSQL);

            stm.setString(1, acc);
            stm.setString(2, acc_pass);

            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateStudentInfo: " + e.getMessage());
        }
    }

}
