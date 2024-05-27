/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ASUS
 */
public class Dorminatory {

    private int dorm_id;
    private String dorm_name;

    public Dorminatory() {
    }

    public Dorminatory(int dorm_id, String dorm_name) {
        this.dorm_id = dorm_id;
        this.dorm_name = dorm_name;
    }

    public int getDorm_id() {
        return dorm_id;
    }

    public void setDorm_id(int dorm_id) {
        this.dorm_id = dorm_id;
    }

    public String getDorm_name() {
        return dorm_name;
    }

    public void setDorm_name(String dorm_name) {
        this.dorm_name = dorm_name;
    }

}
