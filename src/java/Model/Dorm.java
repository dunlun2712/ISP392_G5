/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author khanh
 */
public class Dorm {
    private int dormID;
    private String dormName;

    public Dorm() {
    }

    public Dorm(int dormID, String dormName) {
        this.dormID = dormID;
        this.dormName = dormName;
    }

    public int getDormID() {
        return dormID;
    }

    public void setDormID(int dormID) {
        this.dormID = dormID;
    }

    public String getDormName() {
        return dormName;
    }

    public void setDormName(String dormName) {
        this.dormName = dormName;
    }
    
}
