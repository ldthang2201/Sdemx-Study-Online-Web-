package Controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import Beans.Branch;
import Beans.Category;
import Models.CategoryModel;

import Beans.User;
import Models.UserModel;
import Utility.ServletUtils;
import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Optional;
import java.util.List;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "AccountServlet", urlPatterns = "/Account/*")
public class AccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String path = request.getPathInfo();
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
                postLogout(request, response);
                break;
            case"PasswordChange":
                postPasswordChange(request,response);
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }
    }

        public static final Pattern VALID_EMAIL_ADDRESS_REGEX =
            Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

    public static boolean validateEmail(String emailStr) {
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
        return matcher.find();
    }
    private void postRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, password.toCharArray());
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        Date dob = new Date();
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String outResponce= new String();
        int rule = 0;
        Optional<User> finduser = UserModel.findByUserName(username);
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

            if(request.getParameter("dob")==""){
                response.setHeader("errorMessage","Invalid birthday !!!");
                outResponce+="birthday";
            }else {
                try {
                    dob = formatter.parse(request.getParameter("dob"));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
           if(finduser.isPresent()){
                outResponce+=" Username";
          }
            if(password==""){
               response.setHeader("errorMessage","password empty !!!");
               outResponce+="pempty";
           }
         if(!validateEmail(email)){
            response.setHeader("errorMessage","Invalid Email !!!");
            outResponce+=" Email ";
        }
        if(!password.equals(request.getParameter("comfirmpassword"))){
            response.setHeader("errorMessage","Invalid comfirm password !!!");
            outResponce+=" Comfirm ";
        }


        if(outResponce.length()<=0)  {
            User user = new User(-1, username, bcryptHashString, name, email, dob, rule,0,"-1");
            UserModel.add(user);
//            ServletUtils.redirect("/Home", request, response);
            outResponce+=" Succes ";
        }

        out.println(outResponce);
        out.close();

    }


    private void postLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("auth",false);
        session.setAttribute("authUser",new User());
        String url = request.getHeader("referer");;
        String patch = request.getScheme() + "://" +   // "http" + "://
                request.getServerName() +       // "myhost"
                ":" + request.getServerPort(); //port
        String rqpatch=url.replace(patch,"");

        if (url == null) url = "/Home";
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
                String url=new String();
                session.setAttribute("auth", true);
                session.setAttribute("authUser", user.get());
//                if((String)session.getAttribute("retUrl")!=null) {
//                    url = (String) session.getAttribute("retUrl");
//                }
//                set cookie
//                Cookie cookie = new Cookie("User",user.get().getUsername());
//                cookie.setMaxAge(60 * 60 * 24);
//                response.addCookie(cookie);
                 if ((String) session.getAttribute("retUrl")== null) url = "/Home";
                else {
                    url = (String) session.getAttribute("retUrl");
                }
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

    private void postPasswordChange(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User rquser = (User) session.getAttribute("authUser");
        Optional<User> user = UserModel.findByUserName(rquser.getUsername());
//        System.out.println(request.getParameter("password"));

        if(request.getParameter("newpassword")==""){
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            response.setHeader("errorMessage","New password is empty");
            out.println("New password is empty !!!!");
            out.close();
            return;

        }
        if(!request.getParameter("password").equals(request.getParameter("comfirmpassword"))){
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            response.setHeader("errorMessage"," Password not Match");
            out.println("Password not match !!!!");
            out.close();
            return;
        };

        if(!user.get().getPassword().equals(request.getParameter("password"))){
//            System.out.println("nott     Matchhhhhhhhhhhhh");
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            response.setHeader("errorMessage","Invalid password");
            out.println("Invalid password !!!!");
            out.close();
                        //xu ly thay doi password
            return;
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path){
            case "/Login":
                HttpSession session=request.getSession();
                boolean auth =(boolean) session.getAttribute("auth");
                session.setAttribute("retUrl",request.getAttribute("retUrl"));
//                System.out.println("get request "+request.getAttribute("retUrl"));
//                if(request.getAttribute("retUrl")!=null)
//                    ServletUtils.forward("/Views/vwAccount/Login.jsp", request, response)
                if(!auth)
                    ServletUtils.forward("/Views/vwAccount/Login.jsp", request, response);
              else ServletUtils.forward("/Views/vwAccount/Profile.jsp", request, response);
                break;
            case "/Signup" :
                ServletUtils.forward("/Views/vwAccount/Signup.jsp", request, response);
                break;
            case "/Profile" :
                ServletUtils.forward("/Views/vwAccount/Profile.jsp", request, response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }
    }
}