package Beans;

import java.util.Date;

public class News {
    int newsID;
    String title;
    String tinyDes;
    String fullDes;
    Date dateUpload;

    public News(int newsID, String title, String tinyDes, String fullDes, Date dateUpload) {
        this.newsID = newsID;
        this.title = title;
        this.tinyDes = tinyDes;
        this.fullDes = fullDes;
        this.dateUpload = dateUpload;
    }

    public News() {
    }

    public int getNewsID() {
        return newsID;
    }

    public void setNewsID(int newsID) {
        this.newsID = newsID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTinyDes() {
        return tinyDes;
    }

    public void setTinyDes(String tinyDes) {
        this.tinyDes = tinyDes;
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
}
