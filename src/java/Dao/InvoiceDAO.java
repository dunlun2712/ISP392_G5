/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Invoice;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author khanh
 */
public class InvoiceDAO extends DBContext{
    public InvoiceDAO() {
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
    Connection conn = null;
    PreparedStatement ps = null;
     public List<Invoice> selectAllInvoices() {
        List<Invoice> invoices = new ArrayList<>();
        String sql = "SELECT * FROM invoices";
        try {
            conn = connection; // Assuming connection is properly initialized elsewhere
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String invoice_id = rs.getString("invoice_id");
                String room_id = rs.getString("room_id");
                String users_id = rs.getString("users_id");
                String createdDate = rs.getString("createdDate");
                String description = rs.getString("description");
                String paymentType = rs.getString("paymentType");
                String paymentDate = rs.getString("paymentDate");
                String status = rs.getString("status");
                String paymentCode = rs.getString("paymentCode");
                String modifiedDate = rs.getString("modifiedDate");
                String totalPayment = rs.getString("totalPayment");
                String paid = rs.getString("paid");
                String remaining = rs.getString("remaining");
                invoices.add(new Invoice(invoice_id, room_id, users_id, createdDate, description, paymentType, paymentDate, status, paymentCode, modifiedDate, totalPayment, paid, remaining));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return invoices;
    }
     public void addInvoice(Invoice invoice) {
         String sql ="INSERT INTO invoices (invoice_id, room_id, createdDate, description, paymentType, paymentDate, status, paymentCode, modifiedDate, totalPayment, paid, remaining) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {

            stm = connection.prepareStatement(sql);
            stm.setString(1, invoice.getInvoice_id());
            stm.setString(2, invoice.getRoom_id());
            stm.setString(3, invoice.getUsers_id());
            stm.setString(4, invoice.getCreatedDate());
            stm.setString(5, invoice.getDescription());
            stm.setString(6, invoice.getPaymentType());
            stm.setString(7, invoice.getPaymentDate());
            stm.setString(8, invoice.getStatus());
            stm.setString(9, invoice.getPaymentCode());
            stm.setString(10, invoice.getModifiedDate());
            stm.setString(11, invoice.getTotalPayment());
            stm.setString(12, invoice.getPaid());
            stm.setString(13, invoice.getRemaining());

            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
     }
}
