package servlet;

import dao.ProductDAO;
import model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = "/product")
public class ProductSeverlet extends HttpServlet {
    ProductDAO productDAO = new ProductDAO();
    ArrayList<Product> products=new ArrayList<>();
    Map<Product, Integer> carts = new HashMap<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        Product product= new Product();
        if (action == null) {
            action = "";
        }
        RequestDispatcher dispatcher = null;
        switch (action){
            case "add":
                int id = Integer.parseInt(req.getParameter("id"));
                Product sp = null;
                carts.put(sp,1);
                req.setAttribute("product", product.getIdProduct());
                dispatcher = req.getRequestDispatcher("/cart.jsp");
                dispatcher.forward(req, resp);
                break;
            default:
                products=productDAO.selectAll();
                req.setAttribute("products",products);
                dispatcher = req.getRequestDispatcher("/product.jsp");
                dispatcher.forward(req, resp);

        }
}


}

