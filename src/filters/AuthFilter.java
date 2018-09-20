package filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(
    filterName = "AuthFilter",
    urlPatterns = {
        "/main",
        "/user/view",
        "/user/update",
        "/sensor/add",
        "/sensor/view",
        "/sensor/delete"
    }
)
public class AuthFilter implements Filter {
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("user") != null)
            chain.doFilter(request, response);
        else response.sendRedirect(request.getContextPath() + "/user/login");
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
