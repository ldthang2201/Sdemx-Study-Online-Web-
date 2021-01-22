package Models;

import Beans.Branch;
import Beans.Category;
import Beans.Course;
import Beans.Feedback;
import Utility.DBUtils;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;
import java.util.Optional;

public class CourseModel {
    public static Optional<Course> getCourseDetailsById(int id) {
        //final String sql = "select * from course where courID = :courID";
        final String sql = "call sp_ViewDetailCourseByID(:courID)";
        try (Connection con = DBUtils.getConnection()) {
            List<Course> lstCourse = con.createQuery(sql)
                    .addParameter("courID", id)
                    .executeAndFetch(Course.class);

            if (lstCourse.size() == 0) {
                return Optional.empty();
            }

            return Optional.ofNullable(lstCourse.get(0));
        }
    }

    public static int getNumberofRegisterByCourID(int id) {
        final String sql = "select f_countNumberRegisterByCourID(:courID)";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql).addParameter("courID", id).executeScalar(int.class);
        }
    }

    public static int calcDateUpload(int id) {
        final String sql = "select f_CalcDateUpload(:courID)";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql).addParameter("courID", id).executeScalar(int.class);
        }
    }

    public static List<Course> getTop10MostViewdCourse() {
        final String sql = "select * from vw_top10mostviewed";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql).executeAndFetch(Course.class);
        }
    }

    public static List<Course> getTop10NewestCourse() {
        final String sql = "select * from vw_Top10NewestCourse";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql).executeAndFetch(Course.class);
        }
    }


    public static List<Course> getAllCourseByCatID(int id, int limit, int offset){
        final String sql = "call sp_ViewAllCourseByCatID(:catID,:limit,:offset)";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("catID",id)
                    .addParameter("limit",limit)
                    .addParameter("offset",offset)
                    .executeAndFetch(Course.class);
        }
    }

    public static List<Course> getAllCourseByBranchID(int id, int limit, int offset){
        final String sql = "call sp_ViewAllCourseByBranchID(:branchID,:limit,:offset)";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("branchID",id)
                    .addParameter("limit",limit)
                    .addParameter("offset",offset)
                    .executeAndFetch(Course.class);
        }
    }

    public static int CountNoCourseByBranchID(int id){
        final String sql = "select CountNoCourseByBranchID(:branchID)";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("branchID",id)
                    .executeScalar(int.class);
        }
    }

    public static int CountNoCourseByCatID(int id){
        final String sql = "select CountNoCourseByCatID(:catID)";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("catID",id)
                    .executeScalar(int.class);
        }
    }

    public static List<Feedback> getAllFeedbackByCourID(int id){
        final String sql = "call sp_getAllFeedbackByCourID(:courID)";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("courID", id)
                    .executeAndFetch(Feedback.class);
        }
    }
}
