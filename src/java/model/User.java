/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Mido
 */
public class User {
    private int userID;
    private String username;
    private String password;
    private String email;
    private String telephone;
    private String fullName;
    private String img;
    private int role;
    private String otp;
    private Date otpRequestTime;
    private String dob;
    private int gender;
    private String address;
    private int isActive;

    public User() {
    }

    public User(int userID, String username, String password, String email, String telephone, String fullName, String img, int role, String otp, Date otpRequestTime, String dob, int gender, String address, int isActive) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.telephone = telephone;
        this.fullName = fullName;
        this.img = img;
        this.role = role;
        this.otp = otp;
        this.otpRequestTime = otpRequestTime;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.isActive = isActive;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    public Date getOtpRequestTime() {
        return otpRequestTime;
    }

    public void setOtpRequestTime(Date otpRequestTime) {
        this.otpRequestTime = otpRequestTime;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    

    
   
}
