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
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet(urlPatterns = "/login")
    public class LoginAccount extends HttpServlet {
        AccountDao accountDao = new AccountDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher;
        String action=req.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "logout":
                Login.account=null;
                dispatcher = req.getRequestDispatcher("/home");
                dispatcher.forward(req, resp);
                break;
            case "signup":
                resp.sendRedirect("/register.jsp");
                break;
            default:
                dispatcher = req.getRequestDispatcher("/login.jsp");
                dispatcher.forward(req, resp);
        }
    }

    @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
            String phoneNumber = request.getParameter("phoneNumber");
            String password = request.getParameter("password");
            Account account = accountDao.getAccount(phoneNumber, password);
            HttpSession session=request.getSession();

            if (account != null) {
               Login.account = account;
               session.setAttribute("account",account);

                if (account.getRole().equals("user")) {
                    resp.sendRedirect("/cart");
                } else {
                    resp.sendRedirect("/admin");
                }
            }else {
                session.setAttribute("account",null);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
                dispatcher.forward(request, resp);
            }
        }
}
