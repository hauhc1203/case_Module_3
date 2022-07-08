package controller;

import dao.AccountDao;
import model.Account;
import model.Login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(urlPatterns = "/login")
    public class LoginAccount extends HttpServlet {
        AccountDao accountDao = new AccountDao();

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
            String phoneNumber = request.getParameter("phoneNumber");
            String password = request.getParameter("password");
            Account account = accountDao.getAccount(phoneNumber, password);
            if (account != null) {
               Login.account = account;
                if (account.getRole().equals("user")) {
                    resp.sendRedirect("/huy");
                } else {
                    resp.sendRedirect("/admin");
                }
            }else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
                dispatcher.forward(request, resp);
            }
        }
}
