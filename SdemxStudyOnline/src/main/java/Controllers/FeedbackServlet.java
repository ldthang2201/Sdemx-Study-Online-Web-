package Controllers;

import Models.CourseModel;
import Utility.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "FeedbackServlet", urlPatterns = "/AddFeedback")
public class FeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        int courID = Integer.parseInt(request.getParameter("courid"));
        int userID = Integer.parseInt(request.getParameter("userid"));
        String feedback = request.getParameter("feedback");
        float rate = (float) Integer.parseInt(request.getParameter("rate"));
        CourseModel.addFeedback(courID,userID,rate,feedback);
        ServletUtils.redirect("/Course/Detail?id="+courID,request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
