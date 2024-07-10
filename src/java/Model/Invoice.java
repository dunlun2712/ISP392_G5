/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author khanh
 */
public class Invoice {
     private String invoice_id;
     private String room_id;
    private String users_id;
    private String createdDate;
    private String description;
    private String paymentType;
    private String paymentDate;
    private String status;
    private String paymentCode;
    private String modifiedDate;
    private String totalPayment;
    private String paid;
    private String remaining;

    public Invoice() {
    }

    public Invoice(String invoice_id, String room_id, String users_id, String createdDate, String description, String paymentType, String paymentDate, String status, String paymentCode, String modifiedDate, String totalPayment, String paid, String remaining) {
        this.invoice_id = invoice_id;
        this.room_id = room_id;
        this.users_id = users_id;
        this.createdDate = createdDate;
        this.description = description;
        this.paymentType = paymentType;
        this.paymentDate = paymentDate;
        this.status = status;
        this.paymentCode = paymentCode;
        this.modifiedDate = modifiedDate;
        this.totalPayment = totalPayment;
        this.paid = paid;
        this.remaining = remaining;
    }

    public String getInvoice_id() {
        return invoice_id;
    }

    public void setInvoice_id(String invoice_id) {
        this.invoice_id = invoice_id;
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

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentCode() {
        return paymentCode;
    }

    public void setPaymentCode(String paymentCode) {
        this.paymentCode = paymentCode;
    }

    public String getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(String modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public String getTotalPayment() {
        return totalPayment;
    }

    public void setTotalPayment(String totalPayment) {
        this.totalPayment = totalPayment;
    }

    public String getPaid() {
        return paid;
    }

    public void setPaid(String paid) {
        this.paid = paid;
    }

    public String getRemaining() {
        return remaining;
    }

    public void setRemaining(String remaining) {
        this.remaining = remaining;
    }

    
    
}
