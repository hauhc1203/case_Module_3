package dao;

import model.Order;

import java.util.ArrayList;

public class OrderDAO implements IDAO<Order> {


    private static final String INSERT_ORDER = "INSERT INTO donHang (nameCategory) VALUES (?);";
    private static final String SELECT_ALL = "select * from donHang;";
    private static final String SEARCH_ORDER = "select * from donHang where nameCategory like ? ;";
    private static final String DELETE_ORDER = "delete from donHang where idCategory = ?;";
    private static final String SELECT_ORDER= "select * from donHang  where idProduct = ?;";

    private  static  final String UPDATE_ORDER="UPDATE donHang SET nameCategory=?;";

    CategoryDAO categoryDAO=new CategoryDAO();



    @Override
    //hien thi don hang
    public ArrayList<Order> selectAll() {



        return null;
    }
//Tao don hang (Dung)
    @Override
    public boolean insert(Order order) {
        return false;
    }

    @Override
    //Huy don hang
    public boolean deleteByID(int id) {
        return false;
    }

    @Override
    //tim kiem don hang
    public Order findCByID(int id) {
        return null;
    }

    @Override
    public boolean edit(Order order) {
        return false;
    }
}
