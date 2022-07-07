package servlet;

import com.mysql.cj.xdevapi.Session;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;


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
        session.setAttribute("acction",action);
        if (action==null){
            action="";
        }

        switch (action){
            case "show":

                show(req,resp,session);
                break;
            case "showByAcc":
                showByAcc(req,resp,session);
                break;
            case "showDetail":
                orderDetail(req,resp ,session);
                break;
            default:
                resp.sendRedirect("index.jsp");

        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
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

        orders=orderDAO.selectAllByACC(idAcc);
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
}
