package Beans;

public class Chapter {
    int chapID;
    String chapName;
    int courID;
    String videoUrl;

    public Chapter(int chapID, String chapName, int courID, String videoUrl) {
        this.chapID = chapID;
        this.chapName = chapName;
        this.courID = courID;
        this.videoUrl = videoUrl;
    }

    public Chapter() {
    }

    public int getChapID() {
        return chapID;
    }

    public void setChapID(int chapID) {
        this.chapID = chapID;
    }

    public String getChapName() {
        return chapName;
    }

    public void setChapName(String chapName) {
        this.chapName = chapName;
    }

    public int getCourID() {
        return courID;
    }

    public void setCourID(int courID) {
        this.courID = courID;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }
}
