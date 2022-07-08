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

@WebServlet(urlPatterns = "/home")
public class HomeServlet extends HttpServlet {

    CategoryDAO categoryDAO;
    ProductDAO productDAO;
    ArrayList<Category> categories ;
    ArrayList<Product> products;

    @Override
    public void init() throws ServletException {
        categoryDAO=new CategoryDAO();
        productDAO=new ProductDAO();
        categories=categoryDAO.selectAll();

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session =req.getSession();

        String action=req.getParameter("action");

        if (action==null){
            action="";
        }
        switch (action){
            case "showall":
                products=productDAO.selectAll();
                break;
            case "showByCategory":
                int idCategory= Integer.parseInt(req.getParameter("idCategory"));
                products=productDAO.selectByCategory(idCategory);
                break;
            default:
                products=productDAO.selectTop3();


        }
        session.setAttribute("category",categories);
        session.setAttribute("products",products);
        resp.sendRedirect("/home.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }



}
