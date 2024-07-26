/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author tranm
 */
public class Student {
    String id,pass,name,role,email,dob,cccd,major,course;
    String address,gender,ethnicity,nation,phone_num,relative_name;
    String relative_contact,status;

    public Student() {
    }

    public Student(String id, String pass, String name, String role, String email, String dob, String cccd, String major, String course, String address, String gender, String ethnicity, String nation, String phone_num, String relative_name, String relative_contact, String status) {
        this.id = id;
        this.pass = pass;
        this.name = name;
        this.role = role;
        this.email = email;
        this.dob = dob;
        this.cccd = cccd;
        this.major = major;
        this.course = course;
        this.address = address;
        this.gender = gender;
        this.ethnicity = ethnicity;
        this.nation = nation;
        this.phone_num = phone_num;
        this.relative_name = relative_name;
        this.relative_contact = relative_contact;
 
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getCccd() {
        return cccd;
    }

    public void setCccd(String cccd) {
        this.cccd = cccd;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEthnicity() {
        return ethnicity;
    }

    public void setEthnicity(String ethnicity) {
        this.ethnicity = ethnicity;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getPhone_num() {
        return phone_num;
    }

    public void setPhone_num(String phone_num) {
        this.phone_num = phone_num;
    }

    public String getRelative_name() {
        return relative_name;
    }

    public void setRelative_name(String relative_name) {
        this.relative_name = relative_name;
    }

    public String getRelative_contact() {
        return relative_contact;
    }

    public void setRelative_contact(String relative_contact) {
        this.relative_contact = relative_contact;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
}
