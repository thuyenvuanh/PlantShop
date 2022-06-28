/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dtos;

/**
 *
 * @author anhthuyn
 */
public class Account {
    private int accID, status, role;
    private String email, password, fullname, phone;

    public Account() {
    }

    public Account(int accID, int status, int role, String email, String password, String fullname, String phone) {
        this.accID = accID;
        this.status = status;
        this.role = role;
        this.email = email;
        this.password = password;
        this.fullname = fullname;
        this.phone = phone;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Account[accID = " + accID
                +", email = " + email
                +", fullname = " + fullname
                +", phone = " + phone
                +", status = " + status                
                + "]";
    }
}
