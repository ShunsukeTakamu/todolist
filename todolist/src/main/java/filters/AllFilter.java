package filters;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*") 
public class AllFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String uri = req.getRequestURI();
        String ctx = req.getContextPath();

        boolean isLoggedIn = session != null && session.getAttribute("username") != null;
        
        // ログイン可能ページ
        boolean isLoginPage = uri.equals(ctx + "/login.jsp");
        boolean isSignupPage = uri.equals(ctx + "/signup.jsp");
        boolean isLoginServlet = uri.equals(ctx + "/LoginServlet");
        boolean isRegisterServlet = uri.equals(ctx + "/UserRegisterServlet");
        boolean isStatic = uri.matches(".*(\\.css|\\.js|\\.png|\\.jpg|\\.woff2?)$");

        if (isLoggedIn || isLoginPage || isSignupPage || isLoginServlet || isRegisterServlet || isStatic) {
            chain.doFilter(request, response);
        } else {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }
}
