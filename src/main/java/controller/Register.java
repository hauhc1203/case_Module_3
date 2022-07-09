package controller;

import dao.AccountDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/register")
public class Register extends HttpServlet {
    AccountDao accountDao= new AccountDao();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String phoneNumber = req.getParameter("phoneNumber");
        String passWord =  req.getParameter("passWord");
        accountDao.create(fullName,phoneNumber,passWord,"user");
        resp.sendRedirect("/login");
    }
}

