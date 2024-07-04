/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Ticket;
import dal.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class TicketDAO extends DBContext {

    public TicketDAO() {
        connectDB();
    }
    Connection cnn; //ket noi db
    PreparedStatement stm; // thuc hien cac cau lenh sql
    ResultSet rs;//luu tru va xu ly du lieu
    //ket noi voi database

    private void connectDB() {
        cnn = connection;
        if (cnn != null) {
            System.out.println("connect succes");
        } else {
            System.out.println("connect fail");
        }
    }

    public boolean doesUserExist(String usersId) {
        String sql = "SELECT COUNT(*) FROM Users WHERE users_id = ?";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, usersId);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean registerTicket(Ticket ticket) {
        if (!doesUserExist(ticket.getUsersId())) {
            System.out.println("User ID does not exist: " + ticket.getUsersId());
            return false;
        }
        String sql = "INSERT INTO ParkingTicket (users_id, vehicle_number, issue_date, expiry_date, price, status) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, ticket.getUsersId());
            stm.setString(2, ticket.getVehicleNumber());
            stm.setDate(3, new Date(ticket.getIssueDate().getTime()));
            stm.setDate(4, new Date(ticket.getExpiryDate().getTime()));
            stm.setString(5, ticket.getPrice());
            stm.setString(6, ticket.getStatus());
            int rowsInserted = stm.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean isVehicleNumberExists(String vehicleNumber) throws Exception {
        String sql = "SELECT 1 FROM ParkingTicket WHERE vehicle_number = ?";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, vehicleNumber);
            rs = stm.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }


    public List<Ticket> getAllTickets() {
        List<Ticket> tickets = new ArrayList<>();
        String sql = "SELECT * FROM ParkingTicket";
        try {
            stm = cnn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setTicketId(rs.getInt("ticket_id"));
                ticket.setUsersId(rs.getString("users_id"));
                ticket.setVehicleNumber(rs.getString("vehicle_number"));
                ticket.setIssueDate(rs.getDate("issue_date"));
                ticket.setExpiryDate(rs.getDate("expiry_date"));
                ticket.setPrice(rs.getString("price"));
                ticket.setStatus(rs.getString("status"));
                tickets.add(ticket);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tickets;
    }
}
