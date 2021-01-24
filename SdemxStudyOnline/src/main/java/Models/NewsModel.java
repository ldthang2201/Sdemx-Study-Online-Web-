package Models;

import Beans.News;
import Utility.DBUtils;
import org.sql2o.Connection;

import java.util.List;

public class NewsModel {
    public static List<News> getListNew(){
        final String sql="select * from getnews";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).executeAndFetch(News.class);
        }
    }
}
