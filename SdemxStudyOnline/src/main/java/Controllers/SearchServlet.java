package Controllers;

import Beans.Course;
import Models.CourseModel;
import Utility.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchServlet", urlPatterns = "/Search/*")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String search = request.getParameter("search");
//        System.out.println("search");
//        List<Course> lstCourseSearch = CourseModel.searchCourse("")
//        ServletUtils.forward("/Views/vwCourse/Search.jsp", request, response);
//        ServletUtils.redirect("/Home/",request,response);
        String path = request.getPathInfo();
        switch (path){
            case "/search":
                String search = request.getParameter("search");
                List<Course> lstCourseSearch = CourseModel.searchCourse(search);
                request.setAttribute("lstCourse",lstCourseSearch);
                ServletUtils.forward("/Views/vwCourse/Search.jsp",request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
