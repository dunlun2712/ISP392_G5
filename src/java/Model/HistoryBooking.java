/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;

/**
 *
 * @author ASUS
 */
public class HistoryBooking {

    private int bookingId;
    private String roomId;
    private String usersId;
    private Date checkinDate;
    private Date checkoutDate;
    private String note;
    private String dorm_name;
    private String price;
    private String room_type;

    public HistoryBooking() {
    }

    public HistoryBooking(int bookingId, String roomId, String usersId, Date checkinDate, Date checkoutDate, String note, String dorm_name, String price, String room_type) {
        this.bookingId = bookingId;
        this.roomId = roomId;
        this.usersId = usersId;
        this.checkinDate = checkinDate;
        this.checkoutDate = checkoutDate;
        this.note = note;
        this.dorm_name = dorm_name;
        this.price = price;
        this.room_type = room_type;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getUsersId() {
        return usersId;
    }

    public void setUsersId(String usersId) {
        this.usersId = usersId;
    }

    public Date getCheckinDate() {
        return checkinDate;
    }

    public void setCheckinDate(Date checkinDate) {
        this.checkinDate = checkinDate;
    }

    public Date getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(Date checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getDorm_name() {
        return dorm_name;
    }

    public void setDorm_name(String dorm_name) {
        this.dorm_name = dorm_name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getRoom_type() {
        return room_type;
    }

    public void setRoom_type(String room_type) {
        this.room_type = room_type;
    }

}
