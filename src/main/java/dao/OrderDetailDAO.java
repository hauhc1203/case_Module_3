package dao;

import connect.ConnectDB;
import model.Category;
import model.Order;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class OrderDetailDAO {
    private static final String INSERT_ORDER = "INSERT INTO donHang (nameCategory) VALUES (?);";
    private static final String SELECT_ALL = "select * from donHang;";
    private static final String SELECT_ALL_BY_ORDER = "select * from chiTietDH where idOrder=? ;";

    private static final String SEARCH_ORDER = "select * from donHang where nameCategory like ? ;";
    private static final String DELETE_ORDER = "delete from donHang where idCategory = ?;";
    private static final String SELECT_ORDER= "select * from donHang  where idProduct = ?;";

    private  static  final String UPDATE_ORDER="UPDATE donHang SET nameCategory=?;";




    ProductDAO productDAO=new ProductDAO();
    public ArrayList<Map> selectAll() {
        return null;
    }

    public boolean insert(Map map) {
        return false;
    }

    public boolean deleteByID(int id) {
        return false;
    }


    public void  findByOrder(Order order) {
        Map<Product,Integer> map=new HashMap<>();
        try (Connection connection= ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BY_ORDER)){
            preparedStatement.setInt(1,order.getIdOrder());
            ResultSet resultSet= preparedStatement.executeQuery();
            while (resultSet.next()){
                int idProduct=resultSet.getInt("idProduct");

                int quantity = resultSet.getInt("quantity");
                map.put(productDAO.findCByID(idProduct),quantity);

            }
            order.setDetail(map);

        } catch (SQLException e) {

        }

    }


    public boolean edit(Map map) {
        return false;
    }
}
