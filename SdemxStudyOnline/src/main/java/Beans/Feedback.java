package Beans;

import java.util.Date;

public class Feedback {
    int feedbackID;
    int userID;
    int courID;
    String fullfeedback;
    float rate;
    Date dateFeedback;

    public Feedback() {
    }

    public Feedback(int feedbackID, int userID, int courID, String fullfeedback, float rate, Date dateFeedback) {
        this.feedbackID = feedbackID;
        this.userID = userID;
        this.courID = courID;
        this.fullfeedback = fullfeedback;
        this.rate = rate;
        this.dateFeedback = dateFeedback;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getCourID() {
        return courID;
    }

    public void setCourID(int courID) {
        this.courID = courID;
    }

    public String getFullfeedback() {
        return fullfeedback;
    }

    public void setFullfeedback(String fullfeedback) {
        this.fullfeedback = fullfeedback;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    public Date getDateFeedback() {
        return dateFeedback;
    }

    public void setFateDeedback(Date dateFeedback) {
        this.dateFeedback = dateFeedback;
    }
}
