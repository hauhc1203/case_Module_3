package servlet;

import com.mysql.cj.xdevapi.Session;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import model.Login;
import model.Order;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


@WebServlet(urlPatterns = "/orders")
public class OrderServlet extends HttpServlet {
    ArrayList<Order> orders;
    OrderDetailDAO orderDetailDAO;
    OrderDAO orderDAO;
    Order order;

    @Override
    public void init() throws ServletException {
        orderDAO=new OrderDAO();
        orderDetailDAO=new OrderDetailDAO();
        orders=orderDAO.selectAllByACC(2);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String action=req.getParameter("action");

        if (action==null){
            action="";
        }

        switch (action){
            case "show":
                session.setAttribute("action",action);
                show(req,resp,session);
                break;
            case "showByAcc":
                session.setAttribute("action",action);

                showByAcc(req,resp,session);
                break;
            case "showDetail":
                orderDetail(req,resp ,session);
                break;
            case "create":
                resp.sendRedirect("/createOrder.jsp");
                break;
            case "removeItem":
                CartServlet.removeP(req,resp);
                session.setAttribute("soSp",CartServlet.checkProductCart());

                resp.sendRedirect("/createOrder.jsp");
                break;

        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String action=req.getParameter("action");
        HttpSession session=req.getSession();
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                createOrder(req,resp,session);
                break;
            default:
        }

    }
    public void show(HttpServletRequest req, HttpServletResponse resp ,HttpSession session){
        orders=orderDAO.selectAll();
        session.setAttribute("orders",orders);
        try {
            resp.sendRedirect("/orders.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public void showByAcc(HttpServletRequest req, HttpServletResponse resp,HttpSession session) throws IOException {
        int idAcc= Integer.parseInt(req.getParameter("idAcc"));
        String status=req.getParameter("status");
        if (status==null){
            status="";
        }
            if (status.equals("dangxuly")){

            }else if (status.equals("hoanthanh")){

            }else {
                orders=orderDAO.selectAllByACC(idAcc);
            }


        session.setAttribute("idAcc",idAcc);
        session.setAttribute("orders",orders);
        resp.sendRedirect("/orders.jsp");
    }
    public void orderDetail(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws IOException {
        int id= Integer.parseInt(req.getParameter("idOrder"));
        order=orderDAO.findCByID(id);
        orderDetailDAO.findByOrder(order);
        session.setAttribute("order",order);
        resp.sendRedirect("/orderDetail.jsp");


    }
    public void createOrder(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws IOException {


            String address=req.getParameter("address");
            int idOrder=orderDAO.selectAll().size()+1;
            orderDAO.insert(new Order(idOrder,CartServlet.cart.getAccount(),null,CartServlet.cart.getDetail(), "Đang chuẩn bị",address,0));
            Map<Product,Integer> a=new HashMap<Product, Integer>();
            CartServlet.cart.setDetail(a);
            resp.sendRedirect("/cart");
    }
}
