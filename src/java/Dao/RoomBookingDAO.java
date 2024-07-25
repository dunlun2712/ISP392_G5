/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.RoomBooking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dal.DBContext;
import java.sql.Statement;

public class RoomBookingDAO extends DBContext {

    private Connection connection;

    public RoomBookingDAO() {
        try {
            this.connection = getConnection();
        } catch (Exception e) {
            System.out.println("Connect failed");
        }
    }

    public List<RoomBooking> getAllBookings() {
        List<RoomBooking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Room_booking";

        try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {
                RoomBooking booking = new RoomBooking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setRoomId(rs.getString("room_id"));
                booking.setUsersId(rs.getString("users_id"));
                booking.setCheckinDate(rs.getDate("checkin_date").toLocalDate());
                booking.setCheckoutDate(rs.getDate("checkout_date").toLocalDate());
                booking.setTotalPrice(rs.getBigDecimal("total_price"));
                booking.setNote(rs.getString("note"));

                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public RoomBooking getBookingById(int bookingId) {
        String sql = "SELECT * FROM Room_booking WHERE booking_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, bookingId);

            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    RoomBooking booking = new RoomBooking();
                    booking.setBookingId(rs.getInt("booking_id"));
                    booking.setRoomId(rs.getString("room_id"));
                    booking.setUsersId(rs.getString("users_id"));
                    booking.setCheckinDate(rs.getDate("checkin_date").toLocalDate());
                    booking.setCheckoutDate(rs.getDate("checkout_date").toLocalDate());
                    booking.setTotalPrice(rs.getBigDecimal("total_price"));
                    booking.setNote(rs.getString("note"));

                    return booking;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<RoomBooking> getBookingsByUserId(String userId) {
        List<RoomBooking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Room_booking WHERE users_id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, userId);

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    RoomBooking booking = new RoomBooking();
                    booking.setBookingId(rs.getInt("booking_id"));
                    booking.setRoomId(rs.getString("room_id"));
                    booking.setUsersId(rs.getString("users_id"));
                    booking.setCheckinDate(rs.getDate("checkin_date").toLocalDate());
                    booking.setCheckoutDate(rs.getDate("checkout_date").toLocalDate());
                    booking.setTotalPrice(rs.getBigDecimal("total_price"));
                    booking.setNote(rs.getString("note"));

                    bookings.add(booking);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public List<RoomBooking> getBookingsByRoomId(String roomId) {
        List<RoomBooking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Room_booking WHERE room_id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, roomId);

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    RoomBooking booking = new RoomBooking();
                    booking.setBookingId(rs.getInt("booking_id"));
                    booking.setRoomId(rs.getString("room_id"));
                    booking.setUsersId(rs.getString("users_id"));
                    booking.setCheckinDate(rs.getDate("checkin_date").toLocalDate());
                    booking.setCheckoutDate(rs.getDate("checkout_date").toLocalDate());
                    booking.setTotalPrice(rs.getBigDecimal("total_price"));
                    booking.setNote(rs.getString("note"));

                    bookings.add(booking);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public int createBooking(RoomBooking booking) {
        String sql = "INSERT INTO Room_booking (room_id, users_id, checkin_date, checkout_date, total_price, note) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, booking.getRoomId());
            statement.setString(2, booking.getUsersId());
            statement.setDate(3, java.sql.Date.valueOf(booking.getCheckinDate()));
            statement.setDate(4, java.sql.Date.valueOf(booking.getCheckoutDate()));
            statement.setBigDecimal(5, booking.getTotalPrice());
            statement.setString(6, booking.getNote());

            int affectedRows = statement.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1; // Indicate failure
    }

    public boolean updateBooking(RoomBooking booking) {
        String sql = "UPDATE Room_booking SET room_id = ?, users_id = ?, checkin_date = ?, checkout_date = ?, total_price = ?, note = ? WHERE booking_id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, booking.getRoomId());
            statement.setString(2, booking.getUsersId());
            statement.setDate(3, java.sql.Date.valueOf(booking.getCheckinDate()));
            statement.setDate(4, java.sql.Date.valueOf(booking.getCheckoutDate()));
            statement.setBigDecimal(5, booking.getTotalPrice());
            statement.setString(6, booking.getNote());
            statement.setInt(7, booking.getBookingId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean deleteBooking(int bookingId) {
        String sql = "DELETE FROM Room_booking WHERE booking_id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, bookingId);

            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean checkExist(String id) {
        String sql = " select * from Room_booking where users_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
