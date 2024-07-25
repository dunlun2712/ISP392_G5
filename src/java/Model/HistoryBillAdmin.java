/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ASUS
 */
public class HistoryBillAdmin {
    private String users_id;
    private String users_name;
    private String cccd;
    private String dob;
    private String course;
    private String phone_number;
    private String gender;
    private String major;
    private String room_id;
    private String checkin_date;
    private String checkout_date;
    private String total_price;

    public HistoryBillAdmin() {
    }

    public HistoryBillAdmin(String users_id, String users_name, String cccd, String dob, String course, String phone_number, String gender, String major, String room_id, String checkin_date, String checkout_date, String total_price) {
        this.users_id = users_id;
        this.users_name = users_name;
        this.cccd = cccd;
        this.dob = dob;
        this.course = course;
        this.phone_number = phone_number;
        this.gender = gender;
        this.major = major;
        this.room_id = room_id;
        this.checkin_date = checkin_date;
        this.checkout_date = checkout_date;
        this.total_price = total_price;
    }

    public String getUsers_id() {
        return users_id;
    }

    public void setUsers_id(String users_id) {
        this.users_id = users_id;
    }

    public String getUsers_name() {
        return users_name;
    }

    public void setUsers_name(String users_name) {
        this.users_name = users_name;
    }

    public String getCccd() {
        return cccd;
    }

    public void setCccd(String cccd) {
        this.cccd = cccd;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getRoom_id() {
        return room_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    public String getCheckin_date() {
        return checkin_date;
    }

    public void setCheckin_date(String checkin_date) {
        this.checkin_date = checkin_date;
    }

    public String getCheckout_date() {
        return checkout_date;
    }

    public void setCheckout_date(String checkout_date) {
        this.checkout_date = checkout_date;
    }

    public String getTotal_price() {
        return total_price;
    }

    public void setTotal_price(String total_price) {
        this.total_price = total_price;
    }
    
    
}
