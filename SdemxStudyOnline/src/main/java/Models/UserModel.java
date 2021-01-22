package Models;


import Beans.User;
import org.sql2o.Connection;
import Utility.DBUtils;
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
    public static void add(User user) {
        int randomNum = ThreadLocalRandom.current().nextInt(1, 500 + 1);

//        final String sql = "INSERT INTO user (useridusername, password, fullname, email, dob,rule, permission) VALUES (:username,:password,:name,:email,:dob,3,0)";
        final String sql="INSERT INTO user (userID,username, `password`, fullname, email, dob,rule, premium) VALUES (:userID,:username,:password,:name,:email,:dob,3,0)";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("username", user.getUsername())
                    .addParameter("password", user.getPassword())
                    .addParameter("name", user.getName())
                    .addParameter("email", user.getEmail())
                    .addParameter("userID", randomNum)
                    .addParameter("dob", user.getDob())
                    .executeUpdate();
        }
    }
    public static String getUserFullnameByUserID(int id){
        final String sql = "select fullname from user where userID=:userID";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("userID",id)
                    .executeScalar(String.class);
        }
    }
    public  static void ChangePassword(String Username,String newpassword){
        final String sql =" call sp_ChangePassword(:Username,:newpassword)";
        try(Connection con = DBUtils.getConnection()){
                con.createQuery(sql)
                        .addParameter("Username",Username)
                        .addParameter("newpassword",newpassword)
                        .executeUpdate();
        }

    }
}
