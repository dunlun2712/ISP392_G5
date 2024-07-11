/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import java.sql.Date;
/**
 *
 * @author ADMIN
 */
public class Water {

    int water_id;
    String room_id;
    String usage_type;
    Date creation_date;
    Date expiration_date;
    String semester;
    String meter_number;
    Double new_reading;
    Double old_reading;
    Double consumption;

    public Water() {
    }

    public Water(int water_id, String room_id, String usage_type, Date creation_date, Date expiration_date, String semester, String meter_number, Double new_reading, Double old_reading, Double consumption) {
        this.water_id = water_id;
        this.room_id = room_id;
        this.usage_type = usage_type;
        this.creation_date = creation_date;
        this.expiration_date = expiration_date;
        this.semester = semester;
        this.meter_number = meter_number;
        this.new_reading = new_reading;
        this.old_reading = old_reading;
        this.consumption = consumption;
    }

    public int getWater_id() {
        return water_id;
    }

    public void setWater_id(int water_id) {
        this.water_id = water_id;
    }

    public String getRoom_id() {
        return room_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    public String getUsage_type() {
        return usage_type;
    }

    public void setUsage_type(String usage_type) {
        this.usage_type = usage_type;
    }

    public Date getCreation_date() {
        return creation_date;
    }

    public void setCreation_date(Date creation_date) {
        this.creation_date = creation_date;
    }

    public Date getExpiration_date() {
        return expiration_date;
    }

    public void setExpiration_date(Date expiration_date) {
        this.expiration_date = expiration_date;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getMeter_number() {
        return meter_number;
    }

    public void setMeter_number(String meter_number) {
        this.meter_number = meter_number;
    }

    public Double getNew_reading() {
        return new_reading;
    }

    public void setNew_reading(Double new_reading) {
        this.new_reading = new_reading;
    }

    public Double getOld_reading() {
        return old_reading;
    }

    public void setOld_reading(Double old_reading) {
        this.old_reading = old_reading;
    }

    public Double getConsumption() {
        return consumption;
    }

    public void setConsumption(Double consumption) {
        this.consumption = consumption;
    }
    
}
