package Controllers;

import Beans.Course;
import Models.CourseModel;
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
import com.cloudinary.Cloudinary;

@WebServlet(name = "AccountServlet", urlPatterns = "/Account/*")
public class AccountServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String path = request.getPathInfo();
        String action = request.getParameter("action");
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
            case "LogoutHome":
                System.out.println(request.getHeader("referer"));
                request.setAttribute("retUrl","/Home");
                postLogout(request, response);
                break;
            case"PasswordChange":
                postPasswordChange(request,response);
                    break;
            case"Avatar":
                        postAvatar(request,response);
                        break;
            case"update":
                postUpdate(request,response);
                break;
            case "AddCourse":
                addCourse(request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }
    }

    public static final Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

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
        System.out.println(dob);
        String phone="";
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
               outResponce+=" pempty ";
           }
         if(!validateEmail(email)){
            response.setHeader("errorMessage","Invalid Email !!!");
            outResponce+=" email ";
        }
        if(UserModel.findByEmail(email)>=1){
            response.setHeader("errorMessage","Email already exist!!!");
            outResponce+=" exist ";
        }
         System.out.println(UserModel.findByEmail(email));
        if(!password.equals(request.getParameter("comfirmpassword"))){
            response.setHeader("errorMessage","Invalid comfirm password !!!");
            outResponce+=" Comfirm ";
        }


        if(outResponce.length()<=0)  {
            User user = new User(-1, username, bcryptHashString, name, email,"", dob, rule,0,"/SdemxStudyOnline/public/ImgLogo/user-logo.png");
            UserModel.add(user);
//            ServletUtils.redirect("/Home", request, response);
            UserModel.ChangeAvatar(user.getUsername(),"/SdemxStudyOnline/public/ImgLogo/user-logo.png");
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
            if(request.getAttribute("retUrl")!=null){
             rqpatch   = (String)request.getAttribute("retUrl");

            }
            if(rqpatch.equals("/SdemxStudyOnline/Account/Profile")){

                ServletUtils.redirect("/Home", request, response);
            }
        else  ServletUtils.redirect(rqpatch, request, response);

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
//                System.out.println("redirect" + url);
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
        String password = request.getParameter("password");

        Optional<User> user = UserModel.findByUserName(rquser.getUsername());
//        System.out.println(request.getParameter("password"));

        if(password==""){
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            response.setHeader("errorMessage","New password is empty");
            out.println("New password is empty !!!!");
            out.close();
            return;

        }
        if(!password.equals(request.getParameter("comfirmpassword"))){
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            response.setHeader("errorMessage"," Password not Match");
            out.println("Password not match !!!!");
            out.close();
            return;
        };
        BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.get().getPassword());

        if(!result.verified){
//            System.out.println("nott     Matchhhhhhhhhhhhh");
            System.out.println("userpass "+user.get().getPassword());
            System.out.println("password "+request.getParameter("password").length());
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            response.setHeader("errorMessage","Invalid password");
            out.println("Invalid password !!!!");
            out.close();

            return;
        }

        if(result.verified){
//            System.out.println("nott     Matchhhhhhhhhhhhh");
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            response.setHeader("errorMessage","successfully");
//            UserModel.ChangePassword((int)request.getParameter("Usera"),
//                    request.getParameter("newpassword"));
            System.out.println(request.getParameter("newpassword"));
            String newpassword = BCrypt.withDefaults().hashToString(12, request.getParameter("newpassword").toCharArray());

            UserModel.ChangePassword(rquser.getUsername(),newpassword );
            out.println("Your password has been changed successfully! !!!!");
            out.close();
            return;
        }


    }
    private void postUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User rquser = (User) session.getAttribute("authUser");
        String phone = request.getParameter("phone");
        String email=request.getParameter("email");
        String name= request.getParameter("name");
        String fullname = request.getParameter("fullname");
        Date dob = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String outResponce= new String();
        if(request.getParameter("dob")==""){
            response.setHeader("errorMessage","Invalid birthday !!!");
            response.setContentType("text/html");
            outResponce+="birthday";
            out.println("Invalid birthday");
            out.close();

        }else {
            try {
                dob = formatter.parse(request.getParameter("dob"));

            } catch (ParseException e) {

                response.setContentType("text/html");
                response.setHeader("errorMessage","Invalid birthday !!!");
                out.println("Invalid infomation");
                out.close();
                e.printStackTrace();
                return;
            }
        }
        if(!validateEmail(email)){
            out.println("Invalid Email !!!");
            out.close();
            return;

        }
        if(fullname==""){
            out.println("Invalid Name !!!");
            out.close();
            return;

        }
        if(UserModel.findByEmail(email)>1){
            out.println("Email already exist!!!");
            out.close();
            return;
        }

        if(outResponce.length()<=0)  {

            response.setContentType("text/html");
            response.setHeader("errorMessage","successfully");
            UserModel.update(rquser.getUsername(),email,dob,fullname,phone);
//            ServletUtils.redirect("/Home", request, response);
            Optional<User> user = UserModel.findByUserName(rquser.getUsername());
               request.setAttribute("authUser",user.get());
//            UserModel.ChangeAvatar(user.getUsername(),\"/SdemxStudyOnline/public/ImgLogo/user-logo.png");
            out.println("Your infomation has been changed successfully! !!!!");
            out.close();
        }
    }

    private void postAvatar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User rquser = (User) session.getAttribute("authUser");
        String url =request.getParameter("url");
        rquser.setAvatar(url);
        String username=  rquser.getUsername();
        UserModel.ChangeAvatar(username,url);
    }

    private void addCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User rquser = (User) session.getAttribute("authUser");
        String url =request.getParameter("url");
        String title = request.getParameter("title");
        String catName = request.getParameter("catid");
//        int catID = Integer.parseInt(request.getParameter("catid"));
        int catID = CategoryModel.getCatIDByCatName(catName);
        String language = request.getParameter("language");
        String tiniDes = request.getParameter("tinides");
        String fullDes = request.getParameter("fulldes");
        int prices = Integer.parseInt(request.getParameter("prices")) ;
        CourseModel.addNewCourse(title,catID,rquser.getId(),tiniDes,prices,fullDes,language);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path){
            case "/Login":
                HttpSession session=request.getSession();
                boolean auth =(boolean) session.getAttribute("auth");
                session.setAttribute("retUrl",request.getAttribute("retUrl"));
//                    System.out.print("get url");
//                    System.out.println(request.getAttribute("retUrl"));
//                if(request.getAttribute("retUrl")!=null)
//                    ServletUtils.forward("/Views/vwAccount/Login.jsp", request, response)
                if(!auth)
                    ServletUtils.forward("/Views/vwAccount/Login.jsp", request, response);
              else{

                    ServletUtils.forward("/Views/vwAccount/Profile.jsp", request, response);
                }
                break;
            case "/Signup" :
                ServletUtils.forward("/Views/vwAccount/Signup.jsp", request, response);
                break;
            case "/Profile" :
                HttpSession session1 = request.getSession();
                User curUser = (User) session1.getAttribute("authUser");
                request.setAttribute("curUser",curUser);
                List<Course> lstWatch = CourseModel.getMyWatchListByUserID(curUser.getId());
                List<Course> lstWish = CourseModel.getMyWishListByUserID(curUser.getId());
                request.setAttribute("lstWatch",lstWatch);
                request.setAttribute("lstWish",lstWish);
                List<Category> lstCat = CategoryModel.getCategory();
                request.setAttribute("lstCat",lstCat);
                Optional<User> u = UserModel.getUserByUserID(curUser.getId());
                if (u.isPresent()) {
                    request.setAttribute("user", u.get());
                    ServletUtils.forward("/Views/vwAccount/Profile.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Home", request, response);
                }
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }
    }
}