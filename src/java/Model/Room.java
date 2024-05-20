/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author khanh
 */
public class Room {
    private String roomID;
    private String floor;
    private String roomType;
    private int price;
    private String roomStatus;
    private Dorm dorm;

    public Room() {
    }

    public Room(String roomID, String floor, String roomType, int price, String roomStatus, Dorm dorm) {
        this.roomID = roomID;
        this.floor = floor;
        this.roomType = roomType;
        this.price = price;
        this.roomStatus = roomStatus;
        this.dorm = dorm;
    }

    public String getRoomID() {
        return roomID;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(String roomStatus) {
        this.roomStatus = roomStatus;
    }

    public Dorm getDorm() {
        return dorm;
    }

    public void setDorm(Dorm dorm) {
        this.dorm = dorm;
    }
    
}
