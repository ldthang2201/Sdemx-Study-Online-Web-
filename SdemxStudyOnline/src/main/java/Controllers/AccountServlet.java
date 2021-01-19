package Controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import Beans.Branch;
import Beans.Category;
import Models.CategoryModel;

import Beans.User;
import Models.UserModel;
import Utility.ServletUtils;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Optional;
import java.util.List;
import java.net.URL;

@WebServlet(name = "AccountServlet", urlPatterns = "/Account/*")
public class AccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        String action = request.getParameter("action");
        System.out.println(action);
        switch (action) {
            case "Login":
               postLogin(request, response);
                break;
            case "Signup" :
                postRegister(request, response);
                break;
            case "Logout":
//                postLogout(request, response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }
        switch (path) {
            case "/Logout":
                postLogout(request, response);
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
//            case"/Logout":
//            case"/logout":
//                 String url = request.getHeader("referer");
//                if (url == null) url = "/Home";
//                ServletUtils.forward(url, request, response);
//                break;
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
        int rule = 0;
        User user = new User(-1, username, bcryptHashString, name, email, dob, rule,0,"-1");
        UserModel.add(user);
        ServletUtils.redirect("/Home", request, response);
    }
    private void postLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("auth",false);
        session.setAttribute("authUser",new User());


        String url = request.getHeader("referer");;
        String patch = request.getScheme() + "://" +   // "http" + "://
                request.getServerName() +       // "myhost"
                ":" + request.getServerPort(); //port
        System.out.println(patch);
        String rqpatch=url.replace(patch,"");
        System.out.println(rqpatch );

//        System.out.println(url);
        if (url == null) url = "/Home";
//
//
        ServletUtils.redirect(rqpatch, request, response);

    }
    private void postLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Optional<User> user = UserModel.findByUserName(username);
         if (user.isPresent()) {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.get().getPassword());
            if (result.verified) {

                HttpSession session = request.getSession();
                session.setAttribute("auth", true);
                session.setAttribute("authUser", user.get());
                String url = (String) session.getAttribute("retUrl");

//                set cookie
                Cookie cookie = new Cookie("User",user.get().getUsername());
                cookie.setMaxAge(60 * 60 * 24);
                response.addCookie(cookie);

                if (url == null) url = "/Home";
                ServletUtils.redirect(url, request, response);
            } else {
                request.setAttribute("hasError", true);
                request.setAttribute("errorMessage", "Invalid password.");
                ServletUtils.forward("/Views/vwAccount/Login.jsp", request, response);
            }
        } else {
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Invalid login.");
            ServletUtils.forward("/Views/vwAccount/Login.jsp", request, response);
        }
    }
}
