package Beans;

import java.util.Date;

public class User {
    int UserID;
    String username, password, fullName, email;
    Date dob;
    String avatar;
    int rule;
    int premium;

    public User() {
    }

    public User(int UserID, String username, String password, String fullName ,String email, Date dob, int rule,int premium,String avatar) {
        this.UserID = UserID;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.avatar=avatar;
        this.dob = dob;
        this.rule = rule;
        this.premium=premium;
    }

    public int getId() {
        return UserID;
    }

    public void setId(int id) {
        this.UserID = UserID;
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

    public String getName() {
        return fullName;
    }

    public void setName(String name) {
        this.fullName = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public int getPermission() {
        return rule;
    }

    public void setPermission(int permission) {
        this.rule = rule;
    }
    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(int id) {
        this.avatar = avatar;
    }
    public int getPremium() {
        return premium;
    }

    public void setPremium(int id) {
        this.premium = premium;
    }

    @Override
    public String toString() {
        return "User {" +
                "UserID=" + UserID +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", dob=" + dob +
                ", rule=" + rule +
                '}';
    }
}
