package filter;

import Beans.Branch;
import Beans.Category;
import Models.CategoryModel;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "LayoutFilter", urlPatterns = "/*")
public class LayoutFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        List<Branch> lstBranch = CategoryModel.getAllBranch();
        req.setAttribute("filterlstBranch", lstBranch);

        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
