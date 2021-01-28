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

                int curPage = 1;
                if (request.getParameter("page") != null) {
                    curPage = Integer.parseInt(request.getParameter("page"));
                }

                final int LIMIT = 6;
                int offset = (curPage - 1) * LIMIT;
                int total = CourseModel.searchCourse(search).size();
                int nPages=total/LIMIT;
                if(total % LIMIT > 0) nPages++;
                int[] pages = new int[nPages];
                for (int i = 0; i < nPages; i++) {
                    pages[i] = i + 1;
                }

                request.setAttribute("pages", pages);
                request.setAttribute("curPage",curPage);
                request.setAttribute("nPages",nPages);
                request.setAttribute("total",total);
                request.setAttribute("txtSearch",search);

                List<Course> lstCourseSearch = CourseModel.searchCourseWithPage(search,LIMIT,offset);
                request.setAttribute("lstCourse",lstCourseSearch);
                ServletUtils.forward("/Views/vwCourse/Search.jsp",request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/search":
                String search = request.getParameter("text");
                int curPage = 1;
                if (request.getParameter("page") != null) {
                    curPage = Integer.parseInt(request.getParameter("page"));
                }

                final int LIMIT = 6;
                int offset = (curPage - 1) * LIMIT;
                int total = CourseModel.searchCourse(search).size();
                int nPages = total / LIMIT;
                if (total % LIMIT > 0) nPages++;
                int[] pages = new int[nPages];
                for (int i = 0; i < nPages; i++) {
                    pages[i] = i + 1;
                }

                request.setAttribute("pages", pages);
                request.setAttribute("curPage", curPage);
                request.setAttribute("nPages", nPages);
                request.setAttribute("total", total);
                request.setAttribute("txtSearch",search);

                String sort = request.getParameter("sort");
                if(sort==null){
                    sort="default";
                }
                request.setAttribute("sort",sort);
                switch (sort){
                    case "newest":
                        List<Course> lstCourseSearchNewst = CourseModel.searchCourseWithPageNewest(search, LIMIT, offset);
                        request.setAttribute("lstCourse", lstCourseSearchNewst);
                        break;
                    case "highrate":
                        List<Course> lstCourseSearchHighest = CourseModel.searchCourseWithPageHighest(search, LIMIT, offset);
                        request.setAttribute("lstCourse", lstCourseSearchHighest);
                        break;
                    default:
                        List<Course> lstCourseSearch = CourseModel.searchCourseWithPage(search, LIMIT, offset);
                        request.setAttribute("lstCourse", lstCourseSearch);
                }
                ServletUtils.forward("/Views/vwCourse/Search.jsp", request, response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
        }
    }
}
