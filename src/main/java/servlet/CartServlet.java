package servlet;

import dao.ProductDAO;
import model.Cart;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = "/cart")
public class CartServlet extends  HomeServlet{
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
                session.setAttribute("soSp",checkProductCart());

                break;
            case "show":


                break;


        }
        session.setAttribute("cart",cart);
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
//            Cookie cookie =new Cookie("cart",cart);


    }
    public int checkProductCart(){
        int soSP=0;
        for (Map.Entry<Product, Integer> entry : cart.getDetail().entrySet()) {
            soSP+=entry.getValue();
        }
        return soSP;
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
