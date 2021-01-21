package Models;

import Beans.Branch;
import Beans.Category;
import Beans.Course;
import Utility.DBUtils;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

public class CategoryModel {

    public static List<Branch> getAllBranch() {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sdemxstudy", "root", "");
        String sql ="select * from branch";
        try(Connection con = sql2o.open()) {
            return con.createQuery(sql).executeAndFetch(Branch.class);
        }
    }

    public static List<Category> getCategoryWithBranchID(int branchID){
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sdemxstudy", "root", "");
        String sql ="select * from category where branchID ='"+branchID+"'";
        try(Connection con = sql2o.open()) {
            return con.createQuery(sql).executeAndFetch(Category.class);
        }
    }

    public static void main(String[] args){
        List<Category> lstCat = getCategory();
        for (Category c: lstCat) {
            System.out.println(c.getCatName());
        }
    }

    public static List<Category> getCategory()
    {
        String sql = "select * from category";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql).executeAndFetch(Category.class);
        }
    }
    public static String getBranchNameByBranchID(int id){
        final String sql = "select branchName from branch where branchID=:branchID";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("branchID",id)
                    .executeScalar(String.class);
        }
    }

    public static String getCategoryNameByCatID(int id){
        String sql = "select catName from category where catID= :catID ";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("catID",id)
                    .executeScalar(String.class);
        }
    }

    public static List<Course> getAllCourseByCatID(int id){
        final String sql = "call sp_ViewAllCourseByCatID(:catID,10,0)";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("catID",id)
                    .executeAndFetch(Course.class);
        }
    }

    public static List<Course> getAllCourseByBranchID(int id){
        final String sql = "call sp_ViewAllCourseByBranchID(:branchID,10,0)";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("branchID",id)
                    .executeAndFetch(Course.class);
        }
    }

    public static List<Branch> getTop4MostSubBranch(){
        final String sql = "select * from Top4CategoriesMostSubc";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).executeAndFetch(Branch.class);
        }
    }

    public static List<Category> getAllCategoryByBranchID(int id){
        final String sql = "call sp_ViewAllCategoryByBranchID(:branchID)";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).addParameter("branchID",id)
                    .executeAndFetch(Category.class);
        }
    }

}
