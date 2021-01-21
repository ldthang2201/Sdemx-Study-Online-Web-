package Controllers;

import Beans.Category;
import Beans.Course;
import Models.CategoryModel;
import Models.CourseModel;
import Utility.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
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
                Optional<Course> c = CourseModel.getCourseDetailsById(id);
                if(c.isPresent()){
                    request.setAttribute("course",c.get());
                    ServletUtils.forward("/Views/vwCourse/Detail.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Home",request,response);
                }
                break;
            case "/Category":
                int CatID = Integer.parseInt(request.getParameter("id"));
                List<Course> lstCourByCatID = CategoryModel.getAllCourseByCatID(CatID);
                request.setAttribute("lstCourse",lstCourByCatID);
                request.setAttribute("titleCat",CategoryModel.getCategoryNameByCatID(CatID));
                ServletUtils.forward("/Views/vwCourse/ByCat.jsp", request, response);
                break;
            case "/Branch":
                int branchID = Integer.parseInt(request.getParameter("id"));
                List<Course> lstCourByBranchID = CategoryModel.getAllCourseByBranchID(branchID);
                request.setAttribute("lstCourse",lstCourByBranchID);
                String titleContent = CategoryModel.getBranchNameByBranchID(branchID);
                request.setAttribute("titleBranch",titleContent);
                List<Category> lstCatByBranchID = CategoryModel.getAllCategoryByBranchID(branchID);
                request.setAttribute("lstCat",lstCatByBranchID);
                ServletUtils.forward("/Views/vwCourse/ByBranch.jsp", request, response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }

    }
}
