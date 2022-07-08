package servlet;

import dao.ProductDAO;
import model.Cart;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AddToCartServlet", urlPatterns = "/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    public static Cart cart;
    ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO=new ProductDAO();

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String action =req.getParameter("action");
        if (cart==null){
            Map<Product,Integer> details=new HashMap<>();
            cart=new Cart(null,details,0);
        }

        switch (action){
            case "add":
                addToCart(req,resp);
                break;


        }
        session.setAttribute("soSp",checkProductCart());
        resp.sendRedirect("/home.jsp");
    }




    public void addToCart(HttpServletRequest req, HttpServletResponse resp){


            int id = Integer.parseInt(req.getParameter("id"));
            Product product=productDAO.findCByID(id);

            Map.Entry<Product,Integer>  entry=checkCart(product);
            if (entry!=null){
                entry.setValue(entry.getValue()+1);
            }else {
                cart.getDetail().put(product,1);
            }
            cart.setTotalValue(product.getPrice()+cart.getTotalValue());
//        Cookie cookie =new Cookie("cart",cart);


    }
    public int checkProductCart(){
        int soSPKhacNhau=0;
        for (Map.Entry<Product, Integer> entry : cart.getDetail().entrySet()) {
            soSPKhacNhau++;
        }
        return soSPKhacNhau;
    }

    public Map.Entry<Product,Integer> checkCart(Product product){
        for (Map.Entry<Product, Integer> entry : cart.getDetail().entrySet()) {
            if (entry.getKey().getIdProduct()==product.getIdProduct()){
                return entry;
            }
        }
        return null;
    }


}
