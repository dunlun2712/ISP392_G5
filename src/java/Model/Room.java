/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.format.DecimalStyle;

/**
 *
 * @author ASUS
 */
public class Room {
    private String room_id;
    private int floor;
    private String room_type;
    private int price;
    private String room_status;

    public Room() {
    }

    public Room(String room_id, int floor, String room_type, int price, String room_status) {
        this.room_id = room_id;
        this.floor = floor;
        this.room_type = room_type;
        this.price = price;
        this.room_status = room_status;
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
    
}
