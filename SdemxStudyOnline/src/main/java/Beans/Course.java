package Beans;

import java.time.DateTimeException;
import java.util.Date;
import java.util.List;

public class Course {
    int courID;
    String title;
    int catID;
    int branchID;
    int teacherID;
    String tinyDes;
    int prices;
    String fullDes;
    Date dateUpload;
    Date lastUpdate;
    int views;
    boolean status;
    String Language;
    float rate;
    int numberRegister;
    List<Feedback> lstFeedback;

    public Course() {
    }

    public Course(int courID, String title, int catID, int branchID, int teacherID, String tinyDes, int prices, String fullDes, Date dateUpload, Date lastUpdate, int views, boolean status, String language, float rate, int numberRegister) {
        this.courID = courID;
        this.title = title;
        this.catID = catID;
        this.branchID = branchID;
        this.teacherID = teacherID;
        this.tinyDes = tinyDes;
        this.prices = prices;
        this.fullDes = fullDes;
        this.dateUpload = dateUpload;
        this.lastUpdate = lastUpdate;
        this.views = views;
        this.status = status;
        Language = language;
        this.rate = rate;
        this.numberRegister = numberRegister;
    }

//    Hàm constructor không có numberRegister
    public Course(int courID, String title, int catID, int branchID, int teacherID, String tinyDes, int prices, String fullDes, Date dateUpload, Date lastUpdate, int views, boolean status, String language, float rate) {
        this.courID = courID;
        this.title = title;
        this.catID = catID;
        this.branchID = branchID;
        this.teacherID = teacherID;
        this.tinyDes = tinyDes;
        this.prices = prices;
        this.fullDes = fullDes;
        this.dateUpload = dateUpload;
        this.lastUpdate = lastUpdate;
        this.views = views;
        this.status = status;
        Language = language;
        this.rate = rate;
    }

    public List<Feedback> getLstFeedback() {
        return lstFeedback;
    }

    public int getCourID() {
        return courID;
    }

    public void setCourID(int courID) {
        this.courID = courID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCatID() {
        return catID;
    }

    public void setCatID(int catID) {
        this.catID = catID;
    }

    public int getBranchID() {
        return branchID;
    }

    public void setBranchID(int branchID) {
        this.branchID = branchID;
    }

    public int getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(int teacherID) {
        this.teacherID = teacherID;
    }

    public String getTinyDes() {
        return tinyDes;
    }

    public void setTinyDes(String tinyDes) {
        this.tinyDes = tinyDes;
    }

    public int getPrices() {
        return prices;
    }

    public void setPrices(int prices) {
        this.prices = prices;
    }

    public String getFullDes() {
        return fullDes;
    }

    public void setFullDes(String fullDes) {
        this.fullDes = fullDes;
    }

    public Date getDateUpload() {
        return dateUpload;
    }

    public void setDateUpload(Date dateUpload) {
        this.dateUpload = dateUpload;
    }

    public Date getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(Date lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getLanguage() {
        return Language;
    }

    public void setLanguage(String language) {
        Language = language;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    public int getNumberRegister() {
        return numberRegister;
    }

    public void setNumberRegister(int numberRegister) {
        this.numberRegister = numberRegister;
    }
}
