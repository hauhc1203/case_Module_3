package servlet;

import dao.ProductDAO;
import model.Cart;
import model.Login;
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
    public static Cart cart=null;
    ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO=new ProductDAO();

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String action =req.getParameter("action");

        if (action==null){
            action="";
        }
        if (cart==null){
            Map<Product,Integer> details=new HashMap<>();
            cart=new Cart(Login.account,details,0);

        }else if (Login.account!=null){
            if (cart.getAccount()==null){
                cart.setAccount(Login.account);
            }else if (cart.getAccount().getIdAccount()!=Login.account.getIdAccount()){
                    Map<Product, Integer> details1 = new HashMap<>();
                    cart.setDetail(details1);
                }


        }


        switch (action){
            case "add":
                addToCart(req,resp);


                break;
            case "remove":
                removeP(req,resp);

                break;

            case "updateQuantity":
                redirectToOrder(req,resp);
                break;


        }
        session.setAttribute("soSp",checkProductCart());
        session.setAttribute("cart",cart);
        resp.sendRedirect("/home");

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
        totalCart();

    }
    public static void totalCart(){
        double total=0;
        for (Map.Entry<Product, Integer> entry1 : cart.getDetail().entrySet()) {
            total+=entry1.getKey().getPrice()*entry1.getValue();
        }
        cart.setTotalValue(total);
    }

    public static int checkProductCart(){
        int soSP=0;
        for (Map.Entry<Product, Integer> entry : cart.getDetail().entrySet()) {
            soSP+=entry.getValue();
        }
        return soSP;
    }



    public static Map.Entry<Product,Integer> checkCart(Product product){
        for (Map.Entry<Product, Integer> entry : cart.getDetail().entrySet()) {
            if (entry.getKey().getIdProduct()==product.getIdProduct()){
                return entry;
            }
        }
        return null;
    }
    public  static void removeP(HttpServletRequest req, HttpServletResponse resp){
        Map<Product,Integer> tmp=new HashMap<>();
        int idP= Integer.parseInt(req.getParameter("id"));
        for (Map.Entry<Product, Integer> entry : cart.getDetail().entrySet()) {
            if (entry.getKey().getIdProduct()!=idP){
                tmp.put(entry.getKey(),entry.getValue());
            }
        }
        cart.setDetail(tmp);
        totalCart();


    }
    public void redirectToOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect("/orders");

    }


}
