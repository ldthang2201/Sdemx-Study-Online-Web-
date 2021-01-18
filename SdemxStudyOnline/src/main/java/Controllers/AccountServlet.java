package Controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import Beans.Branch;
import Beans.Category;
import Models.CategoryModel;

import Beans.User;
import Models.UserModel;
import Utility.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;
import java.util.List;

@WebServlet(name = "AccountServlet", urlPatterns = "/Account/*")
public class AccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Login":
                 postRegister(request, response);
                break;
            case "/login":
//                postLogin(request, response);
                break;
            case "/Logout":
                postLogout(request, response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();

        switch (path){
            case "/Login":
            case "/login":
                ServletUtils.forward("/Views/vwAccount/Login.jsp", request, response);
                break;
            case "/signup" :
            case "/Signup" :
                ServletUtils.forward("/Views/vwAccount/Signup.jsp", request, response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }
    }
    private void postRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, password.toCharArray());

        Date dob = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        try {
            dob = formatter.parse(request.getParameter("dob"));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int permission = 0;
        User user = new User(-1, username, bcryptHashString, name, email, dob, permission);
        System.out.println("1");
        UserModel.add(user);
        System.out.println("2");

        ServletUtils.redirect("/Home", request, response);
    }
    private void postLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
//    private void postLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//
//        Optional<User> user = UserModel.findByUserName(username);
//        if (user.isPresent()) {
//            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.get().getPassword());
//            if (result.verified) {
//                HttpSession session = request.getSession();
//                session.setAttribute("auth", true);
//                session.setAttribute("authUser", user.get());
//
//                String url = (String) session.getAttribute("retUrl");
//                if (url == null) url = "/Home";
//                ServletUtils.redirect(url, request, response);
//            } else {
//                request.setAttribute("hasError", true);
//                request.setAttribute("errorMessage", "Invalid password.");
//                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
//            }
//        } else {
//            request.setAttribute("hasError", true);
//            request.setAttribute("errorMessage", "Invalid login.");
//            ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
//        }
//    }
}
