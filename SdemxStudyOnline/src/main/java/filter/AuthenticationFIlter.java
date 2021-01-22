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

@WebFilter(filterName = "AuthenticationFIlter")
public class AuthenticationFIlter implements Filter {
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest rq = (HttpServletRequest) req;
        HttpSession session=rq.getSession();
        boolean auth =(boolean) session.getAttribute("auth");
         if(!auth){
//             System.out.println("rq uri"+rq.getRequestURI());
//             session.setAttribute("retUrl",rq.getRequestURI());
             session.setAttribute("retUrl","/Account/Profile");
             rq.setAttribute("retUrl","/Account/Profile");
              ServletUtils.forward("/Account/Login",rq,(HttpServletResponse)resp);
            return;
        }


        chain.doFilter(req, resp);
    }
    public void destroy() {
    }
    public void init(FilterConfig config) throws ServletException {

    }

}
