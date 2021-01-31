package Models;

import Beans.Branch;
import Beans.Category;
import Beans.Course;
import Utility.DBUtils;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;
import java.util.Optional;

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

    public static List<Category> getAllCategoryRelatedCatID(int id){
        final String sql = "call sp_getAllCategoryRelatedCatID(:catID)";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("catID",id)
                    .executeAndFetch(Category.class);
        }
    }

    public static Optional<Category> getCategoryByCatID(int id) {
        final String sql = "select * from category where catID = :catID";
        try (Connection con = DBUtils.getConnection()) {
            List<Category> lstCat = con.createQuery(sql)
                    .addParameter("catID", id)
                    .executeAndFetch(Category.class);

            if (lstCat.size() == 0) {
                return Optional.empty();
            }

            return Optional.ofNullable(lstCat.get(0));
        }
    }

    public static void addCategory(String catName, int branchID){
        final String sql="call sp_AddNewCategory(:catName,:branchID)";
        try(Connection con = DBUtils.getConnection()){
            con.createQuery(sql)
                    .addParameter("catName",catName)
                    .addParameter("branchID",branchID)
                    .executeUpdate();
        }
    }

    public static void deleteCategory(int catID){
        final String sql="delete from category where catID=:catID";
        try(Connection con = DBUtils.getConnection()){
            con.createQuery(sql)
                    .addParameter("catID",catID)
                    .executeUpdate();
        }
    }
    public static void updateCategory(int catID, String CatName){
        final String sql="Update category set catName = :catName where catID = :catID";
        try(Connection con = DBUtils.getConnection()){
            con.createQuery(sql)
                    .addParameter("catID",catID)
                    .addParameter("catName",CatName)
                    .executeUpdate();
        }
    }

    public static boolean checkCourseByCatID(int catID){
        final String sql = "select count(*) from course where catID=:catID";
        int f;
        try(Connection con = DBUtils.getConnection()){
            f=con.createQuery(sql).addParameter("catID",catID).executeScalar(int.class);
            if(f==0)
                return true;
            else
                return false;
        }
    }

    public static int getCatIDByCatName(String catName)
    {
        final String sql="select catID from category where catName=:catName";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("catName",catName)
                    .executeScalar(int.class);
        }
    }

    public static int getBranchIDByBranchName(String branchName)
    {
        final String sql="select branchID from branch where branchname=:branchName";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("branchName",branchName)
                    .executeScalar(int.class);
        }
    }
}
