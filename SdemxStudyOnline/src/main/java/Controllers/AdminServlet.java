package Controllers;

import Beans.Branch;
import Beans.Category;
import Beans.Course;
import Beans.User;
import Models.CategoryModel;
import Models.CourseModel;
import Models.UserModel;
import Utility.ServletUtils;
import at.favre.lib.crypto.bcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "AdminServlet", urlPatterns = "/Admin/*")
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/AddCategory":
                addCategory(request, response);
                break;
            case "/DeleteCategory":
                deleteCategory(request,response);
                break;
            case "/UpdateCategory":
                updateCategory(request,response);
                break;
            case "/AddTeacher":
                addTeacher(request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
        }
    }

    private void addCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String catName = request.getParameter("categoryname");
        int branchID = Integer.parseInt(request.getParameter("branchID"));
        System.out.println(catName +"--"+branchID);
        CategoryModel.addCategory(catName,branchID);
        List<Category> lstCat = CategoryModel.getCategory();
        request.setAttribute("lstCat", lstCat);
        ServletUtils.forward("/Views/vwAdmin/AdCategory.jsp", request, response);
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int catID = Integer.parseInt(request.getParameter("CatID"));
        if(CategoryModel.checkCourseByCatID(catID)==false){
            ServletUtils.forward("/Views/vwNotFound/CanNotDelete.jsp", request, response);
        }
        CategoryModel.deleteCategory(catID);
        List<Category> lstCat = CategoryModel.getCategory();
        request.setAttribute("lstCat", lstCat);
        ServletUtils.forward("/Views/vwAdmin/AdCategory.jsp", request, response);
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int catID = Integer.parseInt(request.getParameter("CatID"));
        String catName = request.getParameter("catName");
        CategoryModel.updateCategory(catID,catName);
        List<Category> lstCat = CategoryModel.getCategory();
        request.setAttribute("lstCat", lstCat);
        ServletUtils.forward("/Views/vwAdmin/AdCategory.jsp", request, response);
    }

    private void addTeacher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username=request.getParameter("username");
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, request.getParameter("password").toCharArray());
        UserModel.addTeacher(username,bcryptHashString,fullname,email);
        ServletUtils.redirect("/Admin/User",request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        switch (path) {
            case "/Index":
                ServletUtils.forward("/Views/vwAdmin/Index.jsp", request, response);
                break;
            case "/Category":
                List<Category> lstCat = CategoryModel.getCategory();
                request.setAttribute("lstCat", lstCat);
                ServletUtils.forward("/Views/vwAdmin/AdCategory.jsp", request, response);
                break;
            case "/EditCategory":
                int catID = Integer.parseInt(request.getParameter("id"));
                Optional<Category> cat = CategoryModel.getCategoryByCatID(catID);
                System.out.println("catID=" + cat.get().getCatName());
                if (cat.isPresent()) {
                    request.setAttribute("category", cat.get());
                    ServletUtils.forward("/Views/vwAdmin/EditCategory.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Home", request, response);
                }
                break;
            case "/AddCategory":
                ServletUtils.forward("/Views/vwAdmin/AddCategory.jsp", request, response);
                break;
            case"/User":
                List<User> lstTeacher = UserModel.getUserTeacher();
                request.setAttribute("lstTeacher",lstTeacher);
                List<User> lstStudent = UserModel.getUsserStudent();
                request.setAttribute("lstStudent",lstStudent);
                ServletUtils.forward("/Views/vwAdmin/AdUser.jsp", request, response);
                break;
            case"/AddTeacher":
                ServletUtils.forward("/Views/vwAdmin/AddTeacher.jsp", request, response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }

    }
}
