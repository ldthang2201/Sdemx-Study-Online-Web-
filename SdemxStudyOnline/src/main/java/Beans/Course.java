package Beans;

import Models.CategoryModel;
import Models.CourseModel;
import Models.UserModel;

import java.time.DateTimeException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

public class Course {
    int courID;
    String title;
    int catID;
    int branchID;
    int teacherID;
    String tiniDes;
    int prices;
    float sale;
    String fullDes;
    Date dateUpload;
    Date lastUpdate;
    int views;
    boolean status;
    boolean premium;
    String language;
    float rate;
    int numRate;
    int numRegister;

    public Course() {
    }

    public Course(int courID, String title, int catID, int branchID, int teacherID, String tiniDes, int prices, float sale, String fullDes, Date dateUpload, Date lastUpdate, int views, boolean status, boolean premium, String language, float rate, int numRate, int numRegister) {
        this.courID = courID;
        this.title = title;
        this.catID = catID;
        this.branchID = branchID;
        this.teacherID = teacherID;
        this.tiniDes = tiniDes;
        this.prices = prices;
        this.sale = sale;
        this.fullDes = fullDes;
        this.dateUpload = dateUpload;
        this.lastUpdate = lastUpdate;
        this.views = views;
        this.status = status;
        this.premium = premium;
        this.language = language;
        this.rate = rate;
        this.numRate = numRate;
        this.numRegister = numRegister;
    }

    public Course(int courID, String title, int branchID, int teacherID, int prices, float sale, Date dateUpload, int views, boolean premium, float rate, int numRate) {
        this.courID = courID;
        this.title = title;
        this.branchID = branchID;
        this.teacherID = teacherID;
        this.prices = prices;
        this.sale = sale;
        this.dateUpload = dateUpload;
        this.views = views;
        this.premium = premium;
        this.rate = rate;
        this.numRate = numRate;
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

    public String getTiniDes() {
        return tiniDes;
    }

    public void setTiniDes(String tiniDes) {
        this.tiniDes = tiniDes;
    }

    public int getPrices() {
        return prices;
    }

    public void setPrices(int prices) {
        this.prices = prices;
    }

    public float getSale() {
        return sale;
    }

    public void setSale(float sale) {
        this.sale = sale;
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

    public boolean isPremium() {
        return premium;
    }

    public void setPremium(boolean premium) {
        this.premium = premium;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public float getRate() {
        return (float)(Math.round(rate*10.0)/10.0);
    }
    public float getStarRate(){

        float x = (int)(rate / 0.5);
        float y = (rate % 1);
        if (y%0.5 > 0.2)
            return ((x+1)/2);
        else
            return (x/2);
    }
    public void setRate(float rate) {
        this.rate = rate;
    }

    public int getNumRate() {
        return numRate;
    }

    public void setNumRate(int numRate) {
        this.numRate = numRate;
    }

    public int getNumRegister() {
        return numRegister;
    }

    public void setNumRegister(int numRegister) {
        this.numRegister = numRegister;
    }

    public String getCatNameByCatID(){
        return CategoryModel.getCategoryNameByCatID(this.catID);
    }

    public String getBranchNameByBranchID(){
        return CategoryModel.getBranchNameByBranchID(this.branchID);
    }

    public String getTeacherNameByTeacherID(){
        return UserModel.getUserFullnameByUserID(this.teacherID);
    }
    public int getNumberofRegiterByCourID(){
        return CourseModel.getNumberofRegisterByCourID(this.courID);
    }
    public int getFinalPrice()
    {
        return (int)(prices * sale);
    }

}
