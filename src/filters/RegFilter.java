package filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * RegFilter makes sure you cannot register if you currently logged in
 */
@WebFilter(
    filterName = "RegFilter",
    urlPatterns = {"/user/add"}
)
public class RegFilter implements Filter {

    // check user is not logged in
    // check all required parameters are present and valid
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
        throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect("/main.jsp");
            return;
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) { }

    public void destroy() { }
}