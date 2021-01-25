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
    public static void buyCourse(int courseID,int userID){
        final String sql="call add_WatchList(:userID,:courID) ";
        try (Connection con = DBUtils.getConnection()) {
             con.createQuery(sql).addParameter("courID", courseID)
                     .addParameter("userID",userID)
                    .executeUpdate();
        }


    }
    public static void likeCourse(int courseID,int userID){
        final String sql="call add_removeWishList(:userID, :courID) ";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql).addParameter("courID", courseID)
                    .addParameter("userID",userID)
                    .executeUpdate();
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

    public static List<Course> getTop5CourseByCourID(int courID, int catID) {
        final String sql= "call sp_getTop5CourseByCourID(:courID,:catID)";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("courID",courID)
                    .addParameter("catID",catID)
                    .executeAndFetch(Course.class);
        }
    }

    public static int getCatIDByCourID (int courID){
        final String sql = "select catID from course where courID=:courID";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("courID",courID)
                    .executeScalar(int.class);
        }
    }

    public static float getRateByCourID(int courID){
        final String sql = "select f_calcRateByCourID(:courID)";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("courID",courID)
                    .executeScalar(float.class);
        }
    }

    public static List<Course> getMyWatchListByUserID(int id){
        final String sql = "CALL sp_getMyWatchListByUserID(:userID)";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("userID",id)
                    .executeAndFetch(Course.class);
        }
    }

    public static List<Course> getMyWishListByUserID(int id){
        final String sql = "CALL sp_getMyWishListByUserID(:userID)";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("userID",id)
                    .executeAndFetch(Course.class);
        }
    }

    public static boolean checkWistList(int userID, int courID){
        final String sql = "select f_checkWishList(:userID,:courID)";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("userID",userID)
                    .addParameter("courID",courID)
                    .executeScalar(boolean.class);
        }
    }
    public static boolean checkBuy(int userID, int courID){
        final String sql = "SELECT count(*) from watchlist WHERE userID=:userID and courID=:courID";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("userID",userID)
                    .addParameter("courID",courID)
                    .executeScalar(boolean.class);
        }
    }

    public static List<Course> getTop3Course(){
        final String sql="select * from Top3Course";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).executeAndFetch(Course.class);
        }
    }

    public static void addNewCourse(String title, int CatID, int TeacherID, String tiniDes, int prices, String fullDes,String language){
        final String sql="call sp_addNewCourse(:title,:catID,:teacherID,:tiniDes,:prices,:fullDes,:language)";
        try (Connection con = DBUtils.getConnection()){
             con.createQuery(sql)
                    .addParameter("title",title)
                    .addParameter("catID",CatID)
                    .addParameter("teacherID",TeacherID)
                    .addParameter("tiniDes",tiniDes)
                    .addParameter("prices", prices)
                    .addParameter("fullDes",fullDes)
                    .addParameter("language",language)
                    .executeUpdate();
        }
    }

    public static List<Course> searchCourse(String search){
        final String sql="call sp_SearchCourse(:search)";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("search",search)
                    .executeAndFetch(Course.class);
        }
    }

    public static List<Course> getAllCourse(){
        final String sql="select courID, title, catName, branchName,teacherID from alldetailcourse";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .executeAndFetch(Course.class);
        }
    }

    public static void deleteCourse(int id){
        final String sql="delete from course where courID=:courID";
        try(Connection con = DBUtils.getConnection()){
            con.createQuery(sql)
                    .addParameter("courID",id)
                    .executeUpdate();
        }
    }

    public static void addFeedback(int courID, int userID, float rate, String feedback){
        final String sql = "INSERT into feedback(userID,courID,fullfeedback,rate,dateFeedback) values(:userID,:courID,:feedback,:rate,now())";
        try(Connection con = DBUtils.getConnection()){
            con.createQuery(sql)
                    .addParameter("userID",userID)
                    .addParameter("courID",courID)
                    .addParameter("feedback",feedback)
                    .addParameter("rate",rate)
                    .executeUpdate();
        }
    }
}
