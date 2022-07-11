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
                Product product = productDAO.findCByID(id);
                categories = categoryDAO.selectAll();
                session.setAttribute("categories", categories);
                session.setAttribute("product", product);
                requestDispatcher = req.getRequestDispatcher("/admin/editproduct.jsp");
                requestDispatcher.forward(req, resp);
                break;
            case "delete":
                id = Integer.parseInt(req.getParameter("id"));
                productDAO.deleteByID(id);
                products = productDAO.selectAll();
                session.setAttribute("products", products);
                resp.sendRedirect("/admin");
                break;
            case "createc":
                requestDispatcher = req.getRequestDispatcher("/create" + "category.jsp");
                requestDispatcher.forward(req, resp);
                break;
            case "editc":
                id = Integer.parseInt(req.getParameter("idCategory"));
                Category category = categoryDAO.selectAll().get(id);
                categories = categoryDAO.selectAll();
                session.setAttribute("categories", categories);
                session.setAttribute("products", products);
                requestDispatcher = req.getRequestDispatcher("/edit"+"category.jsp");
                requestDispatcher.forward(req, resp);
                break;
            case "search":
                session.setAttribute("categories", categories);
                requestDispatcher = req.getRequestDispatcher("/admin/dashboard.jsp");
                requestDispatcher.forward(req, resp);
            default:

                session.setAttribute("categories", categories);
                session.setAttribute("products", products);
                requestDispatcher = req.getRequestDispatcher("/admin/dashboard.jsp");
                requestDispatcher.forward(req, resp);


        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        RequestDispatcher requestDispatcher;
        int id;
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        RequestDispatcher dispatcher = null;
        switch (action) {
            case "create":

                int idCategory = Integer.parseInt(req.getParameter("category"));
                String nameProduct = req.getParameter("nameProduct");
                String imgURL = req.getParameter("imgURL");
                Double price = Double.valueOf(req.getParameter("price"));
                int quantity = Integer.parseInt(req.getParameter("quantity"));
                Product product = new Product( nameProduct, categoryDAO.findCByID(idCategory), imgURL, price, quantity );
                productDAO.insert(product);
                resp.sendRedirect("/admin");
                break;

            case "edit":
                id = Integer.parseInt(req.getParameter("id"));
                int idCategory1= Integer.parseInt(req.getParameter("category"));
                String name=req.getParameter("nameProduct");
                String img=req.getParameter("imgURL");
                if (img.equals("")){
                    img=req.getParameter("oldIMG");
                }
                double price1= Double.parseDouble(req.getParameter("price"));
                int quantity1= Integer.parseInt(req.getParameter("quantity"));
                productDAO.edit(new Product(id,name,categoryDAO.findCByID(idCategory1),img,price1,quantity1,0));
                resp.sendRedirect("/admin");
                break;
            case "delete":
                id = Integer.parseInt(req.getParameter("id"));
                productDAO.deleteByID(id);
                products = productDAO.selectAll();
                requestDispatcher = req.getRequestDispatcher("/admin/dashboard.jsp");
                requestDispatcher.forward(req, resp);
                break;
            case "createc":

                String nameCategory = req.getParameter("nameCategory");

                Category categories = new Category(nameCategory);
                categoryDAO.insert(categories);
                resp.sendRedirect("/admin");
                break;
            case "search":
                String key =req.getParameter("key1");
                key = "%"+key+"%";
                HttpSession session=req.getSession();
                session.setAttribute("products", productDAO.search(key));

                resp.sendRedirect("/admin?action=search");
                break;

        }




    }
}
