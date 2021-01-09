package Models;

import Beans.Branch;
import Beans.Category;
import Utility.DBUtils;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

public class CategoryModel {

    public static List<Branch> getAllBranch() {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/udemxstudy", "root", "");
        String sql ="select * from branches";
        try(Connection con = sql2o.open()) {
            return con.createQuery(sql).executeAndFetch(Branch.class);
        }
    }

    public static List<Category> getCategoryWithBranchID(int branchID){
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/udemxstudy", "root", "");
        String sql ="select * from categories where branchID ='"+branchID+"'";
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
        String sql = "select * from categories";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql).executeAndFetch(Category.class);
        }
    }
}
