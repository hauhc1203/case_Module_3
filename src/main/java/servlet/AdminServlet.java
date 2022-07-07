package servlet;


import dao.CategoryDAO;
import dao.ProductDAO;
import model.Category;
import model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/admin")
public class AdminServlet extends HttpServlet {
    CategoryDAO categoryDAO;
    ProductDAO productDAO;
    ArrayList<Category> categories ;
    ArrayList<Product> products;

    @Override
    public void init() throws ServletException {
        categoryDAO=new CategoryDAO();
        productDAO=new ProductDAO();
        categories=categoryDAO.selectAll();
        products=productDAO.selectAll();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session =req.getSession();
        session.setAttribute("categories",categories);
        session.setAttribute("products",products);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/admin/dashboard.jsp");
        requestDispatcher.forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
