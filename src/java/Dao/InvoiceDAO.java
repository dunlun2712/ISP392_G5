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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
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
    
    public int getID() {
        int invoiceId = 0;
        String sql = "SELECT invoice_id FROM billService\n"
                + "ORDER BY invoice_id DESC";
        try {
            conn = connection; // Assuming connection is properly initialized elsewhere
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                invoiceId = rs.getInt("invoice_id") + 1;
            } else {
                // If there are no rows in the ResultSet, start with ID 1
                invoiceId = 1;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return invoiceId;
    }
     public List<Invoice> selectAllInvoices() {
        List<Invoice> invoices = new ArrayList<>();
        String sql = "SELECT * FROM billService";
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
                String totalPayment = rs.getString("totalPayment");
                invoices.add(new Invoice(invoice_id, room_id, users_id, createdDate, description, paymentType, paymentDate, status, totalPayment));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return invoices;
    }
     public List<Invoice> viewInvoices() {
        List<Invoice> invoices = new ArrayList<>();
        String sql = "SELECT invoice_id, room_id, users_id, createdDate, description, paymentType, paymentDate, status, totalPayment FROM billService";
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
                String totalPayment = rs.getString("totalPayment");
                invoices.add(new Invoice(invoice_id, room_id, users_id, createdDate, description, paymentType, paymentDate, status, totalPayment));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return invoices;
     }
     public void addInvoice(Invoice invoice) {
         String sql ="INSERT INTO billService ( room_id, users_id, createdDate,"
                 + " description, paymentType, paymentDate, status, "
                 + "totalPayment) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)";
        try {

            stm = connection.prepareStatement(sql);
            
            stm.setString(1, invoice.getRoom_id());
            stm.setString(2, invoice.getUsers_id());
            stm.setDate(3, java.sql.Date.valueOf(invoice.getCreatedDate()));
            stm.setString(4, invoice.getDescription());
            stm.setString(5, invoice.getPaymentType());
             stm.setNull(6, java.sql.Types.DATE);
            stm.setString(7, invoice.getStatus());
            stm.setString(8, invoice.getTotalPayment());
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
     }
      public List<Invoice> searchInvoices(String userId, String roomId, String fromDate) {
        List<Invoice> invoices = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM billService WHERE 1=1");

        if (userId != null && !userId.isEmpty()) {
            sql.append(" AND users_id = ?");
        }
        if (roomId != null && !roomId.isEmpty()) {
            sql.append(" AND room_id = ?");
        }
        if (fromDate != null && !fromDate.isEmpty()) {
            sql.append(" AND createdDate >= ?");
        }

        try {
            conn = connection; // Assuming connection is properly initialized elsewhere
            ps = conn.prepareStatement(sql.toString());

            int index = 1;
            if (userId != null && !userId.isEmpty()) {
                ps.setString(index++, userId);
            }
            if (roomId != null && !roomId.isEmpty()) {
                ps.setString(index++, roomId);
            }
            if (fromDate != null && !fromDate.isEmpty()) {
                ps.setString(index++, fromDate);
            }

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
                String totalPayment = rs.getString("totalPayment");
                invoices.add(new Invoice(invoice_id, room_id, users_id, createdDate, description, paymentType, paymentDate, status, totalPayment));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return invoices;
    }
      public boolean isUserExist(String userId) throws SQLException {
        String query = "SELECT COUNT(*) FROM users WHERE users_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    public boolean isRoomExist(String roomId) throws SQLException {
        String query = "SELECT COUNT(*) FROM room WHERE room_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, roomId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
}
