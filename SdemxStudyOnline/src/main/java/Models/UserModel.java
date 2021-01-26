package Models;


import Beans.Teacher;
import Beans.User;
import org.sql2o.Connection;
import Utility.DBUtils;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.ThreadLocalRandom;

public class UserModel {

    public static Optional<User> findByUserName(String username) {
        final String sql = "select * from user where userName = :username";

        try (Connection con = DBUtils.getConnection()) {

            List<User> list = con.createQuery(sql)
                    .addParameter("username", username)
                    .executeAndFetch(User.class);
            if (list.size() == 0) {
                return Optional.empty();
            }
            return Optional.ofNullable(list.get(0));
        }
    }
    public static  int findByEmail(String email) {
        final String sql = "select count(*) from `user` WHERE email=:email";

        try (Connection con = DBUtils.getConnection()) {

            return  con.createQuery(sql)
                    .addParameter("email", email)
                    .executeScalar(int.class);
        }
    }

    public static void add(User user) {

        final String sql = "call sp_AddNewStudentUser(:username, :password, :name, :email, :dob,:phone);";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("username", user.getUsername())
                    .addParameter("password", user.getPassword())
                    .addParameter("name", user.getName())
                    .addParameter("email", user.getEmail())
                    .addParameter("phone",user.getPhone())
                    .addParameter("dob", user.getDob())
                    .executeUpdate();
        }
    }
    public static void update(String username, String email, Date dob ,String fullName,String phone) {

        final String sql = " UPDATE user set email =:email , dob=:dob,fullname=:name,phone=:phone WHERE userName= :username";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("username",username)
                    .addParameter("name", fullName)
                    .addParameter("email",email)
                    .addParameter("phone",phone)
                    .addParameter("dob", dob)
                    .executeUpdate();
        }
    }

    public static String getUserFullnameByUserID(int id) {
        final String sql = "select fullname from user where userID=:userID";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("userID", id)
                    .executeScalar(String.class);
        }
    }


    public static void ChangePassword(String Username, String newpassword) {
        final String sql = " call sp_ChangePassword( :Username, :newpassword   ) ";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("Username", Username)
                    .addParameter("newpassword", newpassword)
                    .executeUpdate();
        }

    }
    public static void ChangeAvatar(String Username, String Url) {
        final String sql = " UPDATE user set avatar =:Url  WHERE userName=:Username";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("Username", Username)
                    .addParameter("Url", Url)
                    .executeUpdate();
        }

    }

    public static List<User> getUserTeacher(){
        final String sql = "select * from user where rule=2";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .executeAndFetch(User.class);
        }
    }
    public static List<User> getUsserStudent(){
        final String sql = "select * from user where rule=3";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .executeAndFetch(User.class);
        }
    }

    public static void addTeacher(String username, String password, String fullname, String email){
        final String sql = "call sp_AddNewTeacherUser(:userName,:pass,:fullname,:email,now())";
        try (Connection con = DBUtils.getConnection()){
            con.createQuery(sql)
                    .addParameter("userName",username)
                    .addParameter("pass",password)
                    .addParameter("fullname",fullname)
                    .addParameter("email",email)
                    .executeUpdate();
        }
    }

    public static Optional<User> getUserByUserID(int id){
        final String sql = "select * from user where userID = :userID";
        try (Connection con = DBUtils.getConnection()){
            List<User> lstU = con.createQuery(sql)
                                    .addParameter("userID",id)
                                    .executeAndFetch(User.class);
            if (lstU.size() == 0) {
                return Optional.empty();
            }
            return Optional.ofNullable(lstU.get(0));
        }
    }

    public static void deleteUser(int id){
        final String sql = "Delete from user where userID = :userID";
        try(Connection con = DBUtils.getConnection()){
            con.createQuery(sql).addParameter("userID",id).executeUpdate();
        }
    }

    public static boolean checkUser(int id){
        final String sql = "select count(*) from course where teacherID = :userID";
        try(Connection con = DBUtils.getConnection()){
            int a = con.createQuery(sql).addParameter("userID",id).executeScalar(int.class);
            if(a==0)
            {
                return false;
            }
            else
                return true;
        }
    }

    public static Optional<Teacher> getTeacherByID(int id){
        final String sql = "call sp_getDetailTeacher(:teacherID)";
        try (Connection con = DBUtils.getConnection()){
            List<Teacher> lstU = con.createQuery(sql)
                    .addParameter("teacherID",id)
                    .executeAndFetch(Teacher.class);
            if (lstU.size() == 0) {
                return Optional.empty();
            }
            return Optional.ofNullable(lstU.get(0));
        }
    }

    public static void EditTeacher (int id, String aoe, String fulldes){
        final String sql = "call EditTeacher(:teacherID,:aoe,:fullDes)";
        try (Connection con = DBUtils.getConnection()){
            con.createQuery(sql)
                    .addParameter("teacherID",id)
                    .addParameter("aoe",aoe)
                    .addParameter("fullDes",fulldes)
                    .executeUpdate();
        }
    }
}
