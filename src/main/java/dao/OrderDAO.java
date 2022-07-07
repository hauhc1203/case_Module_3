package dao;

import model.Order;

import java.util.ArrayList;

public class OrderDAO implements IDAO<Order> {

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
