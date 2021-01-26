package Beans;

public class Teacher {
    int teacherID;
    String teacherName;
    int Age;
    String aoe;
    String fullDes;
    String avatar;

    public Teacher() {
    }

    public Teacher(int teacherID, String teacherName, int age, String aoe, String fullDes, String avatar) {
        this.teacherID = teacherID;
        this.teacherName = teacherName;
        Age = age;
        this.aoe = aoe;
        this.fullDes = fullDes;
        this.avatar = avatar;
    }

    public int getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(int teacherID) {
        this.teacherID = teacherID;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public int getAge() {
        return Age;
    }

    public void setAge(int age) {
        Age = age;
    }

    public String getAoe() {
        return aoe;
    }

    public void setAoe(String aoe) {
        this.aoe = aoe;
    }

    public String getFullDes() {
        return fullDes;
    }

    public void setFullDes(String fullDes) {
        this.fullDes = fullDes;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
