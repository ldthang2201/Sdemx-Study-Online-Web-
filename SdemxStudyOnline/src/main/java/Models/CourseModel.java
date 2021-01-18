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
}
