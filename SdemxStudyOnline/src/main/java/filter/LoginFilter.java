package filter;

import Beans.Branch;
import Models.CategoryModel;
import Utility.ServletUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "LoginFilter")
public class LoginFilter implements Filter {
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session=request.getSession();
        boolean auth =(boolean) session.getAttribute("auth");
         if(!auth){
            String rqpatch=new String();
            String url = request.getHeader("referer");;
            String patch = request.getScheme() + "://" +   // "http" + "://
                    request.getServerName() +       // "myhost"
                    ":" + request.getServerPort(); //port
             if(url!=null)rqpatch=url.replace(patch,"");
             request.setAttribute("retUrl", rqpatch);
//            session.setAttribute("retUrl",request.getRequestURI());
//            System.out.println("uri get"+rq.getRequestURI());
            ServletUtils.forward("/Account/Login",request,(HttpServletResponse)resp);
            return;
        }

        chain.doFilter(req, resp);
    }
    public void destroy() {
    }
    public void init(FilterConfig config) throws ServletException {

    }

}
