package Controllers;

import Beans.*;
import Models.CategoryModel;
import Models.CourseModel;
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

@WebServlet(name = "CourseServlet", urlPatterns = "/Course/*")
public class CourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
            switch (action){
                case "buy":
                    postBuy(request,response);
                    break;
                case "like":
                    postLike(request,response);
                    break;
                default:
                    ServletUtils.redirect("/NotFound", request, response);
                    break;
            }
    }
         private void postBuy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("authUser");
        int userid=user.getId();
        boolean auth= (boolean)session.getAttribute("auth");
         String courseId = (String)request.getParameter("CourseId");
//        System.out.print("user");
//        System.out.println(user);
//        System.out.print(("auth "));
//       System.out.println(auth);
             session.setAttribute("checkBuy",true);
       if(!auth){
           ServletUtils.redirect("/Account/Login", request, response);
       }
        else {
            CourseModel.buyCourse(Integer.parseInt(courseId),userid);
       }

    }

         private void postLike(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             HttpSession session = request.getSession();
             User user = (User)session.getAttribute("authUser");
             int userid=user.getId();
             boolean auth= (boolean)session.getAttribute("auth");
             String courseId = (String)request.getParameter("CourseId");
             if(!auth){
                 ServletUtils.redirect("/Account/Login", request, response);
             }
             else {
                 CourseModel.likeCourse(Integer.parseInt(courseId),userid);
             }
         }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Detail":
                int id = Integer.parseInt(request.getParameter("id"));
                Optional<Course> c = CourseModel.getCourseDetailsById(id);
                int cID = CourseModel.getCatIDByCourID(id);
                List<Course> lstTop5Course = CourseModel.getTop5CourseByCourID(id,cID);
                request.setAttribute("lst5Course",lstTop5Course);
                HttpSession session1 = request.getSession();
                User curUser = (User) session1.getAttribute("authUser");
                boolean likeCourse = CourseModel.checkWistList(curUser.getId(),id);
                boolean buyCourse =  CourseModel.checkBuy(curUser.getId(),id);
                request.setAttribute("checkBuy",buyCourse);
                request.setAttribute("checkLike",likeCourse);
                List<Chapter> lstChap = CourseModel.getAllChapterByCourID(id);
                request.setAttribute("lstChap",lstChap);
                if (c.isPresent()) {
                    request.setAttribute("course", c.get());
                    ServletUtils.forward("/Views/vwCourse/Detail.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Home", request, response);
                }
                break;
            case "/Category":
                int CatID = Integer.parseInt(request.getParameter("id"));
                int curPage = 1;
                if (request.getParameter("page") != null) {
                    curPage = Integer.parseInt(request.getParameter("page"));
                }

                final int LIMIT = 6;
                int offset = (curPage - 1) * LIMIT;
                int total = CourseModel.CountNoCourseByCatID(CatID);
                int nPages=total/LIMIT;
                if(total % LIMIT > 0) nPages++;

                int[] pages = new int[nPages];
                for (int i = 0; i < nPages; i++) {
                    pages[i] = i + 1;
                }
                request.setAttribute("pages", pages);
                request.setAttribute("catID",CatID);
                request.setAttribute("curPage",curPage);
                request.setAttribute("nPages",nPages);
                request.setAttribute("total",total);

                List<Course> lstCourByCatID = CourseModel.getAllCourseByCatID(CatID, LIMIT, offset);
                request.setAttribute("lstCourse", lstCourByCatID);
                request.setAttribute("titleCat", CategoryModel.getCategoryNameByCatID(CatID));
                List<Category> lstCatByBranchID2 = CategoryModel.getAllCategoryRelatedCatID(CatID);
                request.setAttribute("lstCat", lstCatByBranchID2);
                ServletUtils.forward("/Views/vwCourse/ByCat.jsp", request, response);
                break;
            case "/Branch":
                int branchID = Integer.parseInt(request.getParameter("id"));

                int curPage1 = 1;
                if (request.getParameter("page") != null) {
                    curPage1 = Integer.parseInt(request.getParameter("page"));
                }

                final int LIMIT1 = 6;
                int offset1 = (curPage1 - 1) * LIMIT1;
                int total1 = CourseModel.CountNoCourseByBranchID(branchID);
                int nPages1=total1/LIMIT1;
                if(total1 % LIMIT1 > 0) nPages1++;

                int[] pages1 = new int[nPages1];
                for (int i = 0; i < nPages1; i++) {
                    pages1[i] = i + 1;
                }
                request.setAttribute("pages", pages1);
                request.setAttribute("branchID",branchID);
                request.setAttribute("curPage",curPage1);
                request.setAttribute("nPages",nPages1);
                request.setAttribute("total",total1);

                List<Course> lstCourByBranchID = CourseModel.getAllCourseByBranchID(branchID, LIMIT1, offset1);
                request.setAttribute("lstCourse", lstCourByBranchID);
                String titleContent = CategoryModel.getBranchNameByBranchID(branchID);
                request.setAttribute("titleBranch", titleContent);
                List<Category> lstCatByBranchID = CategoryModel.getAllCategoryByBranchID(branchID);
                request.setAttribute("lstCat", lstCatByBranchID);
                ServletUtils.forward("/Views/vwCourse/ByBranch.jsp", request, response);
                break;
//            case "/Search":
//                List<Course> lstCourseSearch = CourseModel.searchCourse("")
//                ServletUtils.forward("/Views/vwCourse/Search.jsp", request, response);
//                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }

    }
}
