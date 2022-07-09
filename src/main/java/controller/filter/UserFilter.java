package controller.filter;

import model.Login;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(urlPatterns = {"/orders/*"})
public class UserFilter implements Filter {
        @Override
        public void init(FilterConfig filterConfig) throws ServletException {
            Filter.super.init(filterConfig);
        }

        @Override
        public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
            if (Login.account == null) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
                dispatcher.forward(request, response);
            } else {
                    chain.doFilter(request, response);

            }
        }

        @Override
        public void destroy() {
            Filter.super.destroy();
        }
    }
