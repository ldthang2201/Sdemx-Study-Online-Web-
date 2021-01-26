package Controllers;

import Beans.Course;
import Beans.Teacher;
import Beans.User;
import Models.CourseModel;
import Models.UserModel;
import Utility.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "TeacherServlet", urlPatterns = "/Teacher/*")
public class TeacherServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path){
            case "/Edit":
                String aoe = request.getParameter("aoe");
                String fullDes = request.getParameter("fulldes");
                int id = Integer.parseInt(request.getParameter("id"));
                UserModel.EditTeacher(id, aoe, fullDes);
                ServletUtils.redirect("/Teacher/Detail?id="+id, request, response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path){
            case "/Detail":
                int uID = Integer.parseInt(request.getParameter("id"));
                HttpSession session=request.getSession();
                boolean auth =(boolean) session.getAttribute("auth");
                User curUser = (User) session.getAttribute("authUser");
                List<Course> MyCourse = CourseModel.getMyCourse(uID);
                request.setAttribute("lstMyCourse",MyCourse);
                Optional<Teacher> teacher = UserModel.getTeacherByID(uID);
                if (teacher.isPresent()) {
                    request.setAttribute("teacher", teacher.get());
                    ServletUtils.forward("/Views/vwAccount/DetailTeacher.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Home", request, response);
                }
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
        }

    }
}
