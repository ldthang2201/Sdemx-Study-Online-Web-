package Controllers;

import Beans.Branch;
import Beans.Category;
import Beans.Course;
import Beans.News;
import Models.CategoryModel;
import Models.CourseModel;
import Models.NewsModel;
import Utility.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", urlPatterns = "/Home/*")
public class HomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path == null || path.equals("/")){
            path="/Index";
        }
        switch (path){
            case "/Index":
                List<Course> lstNewestCour = CourseModel.getTop10NewestCourse();
                request.setAttribute("lstNewest",lstNewestCour);
                List<Course> lstMostViewedCour = CourseModel.getTop10MostViewdCourse();
                request.setAttribute("lstMV",lstMostViewedCour);
                List<Branch> lstMostSubBranch = CategoryModel.getTop4MostSubBranch();
                request.setAttribute("lstMSB",lstMostSubBranch);
                List<Course> lstBestCourse = CourseModel.getTop3Course();
                request.setAttribute("lstBC",lstBestCourse);
                List<News> lstNews = NewsModel.getListNew();
                request.setAttribute("lstNews",lstNews);
                ServletUtils.forward("/Views/vwHome/Home.jsp", request, response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }
    }
}
