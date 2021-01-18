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
import java.util.Optional;

@WebServlet(name = "CourseServlet", urlPatterns = "/Course/*")
public class CourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path){
            case "/Detail":
                int id = Integer.parseInt(request.getParameter("id"));
                System.out.println(id);
                Optional<Course> c = CourseModel.getCourseDetailsById(id);
                if(c.isPresent()){
                    System.out.println(c.get());
                    request.setAttribute("course",c.get());
                    ServletUtils.forward("/Views/vwCourse/Detail.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Home",request,response);
                }
                break;
            case "/ByCat":
                ServletUtils.forward("/Views/vwCourse/ByCat.jsp", request, response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }

    }
}
