package Models;


import Beans.User;
import org.sql2o.Connection;
import Utility.DBUtils;
import java.util.List;
import java.util.Optional;

public class UserModel {

    public static Optional<User> findByUserName(String username) {
        final String sql = "select * from user where username = :username";
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
//        final String sql = "INSERT INTO user (useridusername, password, fullname, email, dob,rule, permission) VALUES (:username,:password,:name,:email,:dob,3,0)";
        final String sql="INSERT INTO user (userID,username, `password`, fullname, email, dob,rule, premium) VALUES (10,:username,:password,:name,:email,:dob,3,0)";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("username", user.getUsername())
                    .addParameter("password", user.getPassword())
                    .addParameter("name", user.getName())
                    .addParameter("email", user.getEmail())
                    .addParameter("dob", user.getDob())
                    .executeUpdate();
        }
    }
}
