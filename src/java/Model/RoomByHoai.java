/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.format.DecimalStyle;

/**
 *
 * @author ASUS
 */
public class RoomByHoai {

    private String room_id;
    private int dorm_id;
    private int floor;
    private String room_type;
    private int price;
    private String room_status;
    private int room_usage;

    public RoomByHoai() {
    }

    public RoomByHoai(String room_id, int dorm_id, int floor, String room_type, int price, String room_status) {
        this.room_id = room_id;
        this.dorm_id = dorm_id;
        this.floor = floor;
        this.room_type = room_type;
        this.price = price;
        this.room_status = room_status;
    }

    public int getRoom_usage() {
        return room_usage;
    }

    public void setRoom_usage(int room_usage) {
        this.room_usage = room_usage;
    }
    
    

    public String getRoom_id() {
        return room_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public String getRoom_type() {
        return room_type;
    }

    public void setRoom_type(String room_type) {
        this.room_type = room_type;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getRoom_status() {
        return room_status;
    }

    public void setRoom_status(String room_status) {
        this.room_status = room_status;
    }

    public int getDorm_id() {
        return dorm_id;
    }

    public void setDorm_id(int dorm_id) {
        this.dorm_id = dorm_id;
    }

}
