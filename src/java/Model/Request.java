/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author tranm
 */
public class Request {
    String request_id,room_id,users_id,request_type,request;
    Date request_date,reponse_date;

    public Request() {
    }

    public Request(String request_id, String room_id, String users_id, String request_type, String request, Date request_date, Date reponse_date) {
        this.request_id = request_id;
        this.room_id = room_id;
        this.users_id = users_id;
        this.request_type = request_type;
        this.request = request;
        this.request_date = request_date;
        this.reponse_date = reponse_date;
    }

    public String getRequest_id() {
        return request_id;
    }

    public void setRequest_id(String request_id) {
        this.request_id = request_id;
    }

    public String getRoom_id() {
        return room_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    public String getUsers_id() {
        return users_id;
    }

    public void setUsers_id(String users_id) {
        this.users_id = users_id;
    }

    public String getRequest_type() {
        return request_type;
    }

    public void setRequest_type(String request_type) {
        this.request_type = request_type;
    }

    public String getRequest() {
        return request;
    }

    public void setRequest(String request) {
        this.request = request;
    }

    public Date getRequest_date() {
        return request_date;
    }

    public void setRequest_date(Date request_date) {
        this.request_date = request_date;
    }

    public Date getReponse_date() {
        return reponse_date;
    }

    public void setReponse_date(Date reponse_date) {
        this.reponse_date = reponse_date;
    }
    
}
