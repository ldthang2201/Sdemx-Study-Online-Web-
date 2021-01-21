package Models;

import Beans.Branch;
import Beans.Category;
import Beans.Course;
import Utility.DBUtils;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;
import java.util.Optional;

public class CourseModel {
    public static Optional<Course> getCourseDetailsById(int id)
    {
        //final String sql = "select * from course where courID = :courID";
        final String sql = "call sp_ViewDetailCourseByID(:courID)";
        try (Connection con = DBUtils.getConnection()) {
            List<Course> lstCourse = con.createQuery(sql)
                .addParameter("courID", id)
                .executeAndFetch(Course.class);

            if(lstCourse.size() == 0)  {
                return Optional.empty();
            }

            return Optional.ofNullable(lstCourse.get(0));
        }
    }

    public static int getNumberofRegisterByCourID(int id){
        final  String sql = "select f_countNumberRegisterByCourID(:courID)";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).addParameter("courID",id).executeScalar(int.class);
        }
    }

    public static int calcDateUpload(int id){
        final String sql = "select f_CalcDateUpload(:courID)";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).addParameter("courID",id).executeScalar(int.class);
        }
    }

    public static List<Course> getTop10MostViewdCourse(){
        final String sql = "select * from vw_top10mostviewed";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).executeAndFetch(Course.class);
        }
    }

    public static List<Course> getTop10NewestCourse(){
        final String sql = "select * from vw_Top10NewestCourse";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).executeAndFetch(Course.class);
        }
    }
}
