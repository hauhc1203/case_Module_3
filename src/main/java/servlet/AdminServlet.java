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
    ArrayList<Category> categories;
    ArrayList<Product> products;

    @Override
    public void init() throws ServletException {
        categoryDAO = new CategoryDAO();
        productDAO = new ProductDAO();
        categories = categoryDAO.selectAll();
        products = productDAO.selectAll();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("categories", categories);
        session.setAttribute("products", products);
        RequestDispatcher requestDispatcher;



        String action = req.getParameter("action");
        int id;

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                requestDispatcher = req.getRequestDispatcher("/admin/createproduct.jsp");
                requestDispatcher.forward(req, resp);
                break;
            case "edit":
                id = Integer.parseInt(req.getParameter("id"));
                Product product = productDAO.selectAll().get(id);
                categories = categoryDAO.selectAll();
                session.setAttribute("categories", categories);
                session.setAttribute("products", products);
                requestDispatcher = req.getRequestDispatcher("/admin/editproduct.jsp");
                requestDispatcher.forward(req, resp);
                break;
            case "delete":
                id = Integer.parseInt(req.getParameter("id"));
                productDAO.deleteByID(id);
                products = productDAO.selectAll();
                requestDispatcher = req.getRequestDispatcher("/admin/dashboard.jsp");
                requestDispatcher.forward(req, resp);
                break;
            default:
                products = productDAO.selectAll();
                requestDispatcher = req.getRequestDispatcher("/admin/dashboard.jsp");
                requestDispatcher.forward(req, resp);


        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        RequestDispatcher dispatcher = null;
        switch (action) {
            case "create":
                int idProduct = productDAO.selectAll().size() + 1;
                int idCategory = Integer.parseInt(req.getParameter("category"));
                String nameProduct = req.getParameter("nameProduct");
                String imgURL = req.getParameter("imgURL");
                Double price = Double.valueOf(req.getParameter("price"));
                int quantity = Integer.parseInt(req.getParameter("quantity"));
                int quanlity_sold = Integer.parseInt(req.getParameter("quantity_sold"));


                Product product = new Product(idProduct, nameProduct, categoryDAO.findCByID(idCategory), imgURL, price, quantity, quanlity_sold);
                productDAO.insert(product);
                resp.sendRedirect("/admin");
                break;
        }
    }
}
