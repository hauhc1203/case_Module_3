package dao;

import connect.ConnectDB;
import model.Category;
import model.Order;
import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class OrderDAO implements IDAO<Order> {


    private static final String INSERT_ORDER = "INSERT INTO donHang (idOrder,idAcc,statusDelivery,address) VALUES (?,?,?,?);";

    private static final String SELECT_ALL = "select * from donHang;";
    private static final String SELECT_ALL_BY_ID_ACC = "select * from donHang where idAcc=?;";

    private static final String SEARCH_ORDER = "select * from donHang where nameCategory like ? ;";
    private static final String DELETE_ORDER = "delete from donHang where idCategory = ?;";
    private static final String SELECT_ORDER= "select * from donHang  where idOrder = ?;";

    private  static  final String UPDATE_ORDER="UPDATE donHang SET nameCategory=?;";

    CategoryDAO categoryDAO=new CategoryDAO();
    AccountDAO accountDao=new AccountDAO();

    @Override
    //hien thi don hang
    public ArrayList<Order> selectAll() {
        ArrayList<Order> orders =new ArrayList<>();
        try (Connection connection= ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)){
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                Map<Product,Integer> detail=new HashMap();
                int id=rs.getInt("idOrder");
                int idAcc=rs.getInt("idAcc");
                Date orderDate = rs.getDate("orderDate");
                String statusDelivery = rs.getString("statusDelivery");
                String address = rs.getString("address");
                double totalValue =rs.getDouble("totalValue");
                orders.add(new Order(id,accountDao.findCByID(idAcc),orderDate,detail,statusDelivery,address,totalValue));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orders;

    }

    public ArrayList<Order> selectAllByACC(int idACC) {
        ArrayList<Order> orders =new ArrayList<>();
        try (Connection connection= ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BY_ID_ACC)){
            preparedStatement.setInt(1,idACC);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                Map<Product,Integer> detail=new HashMap();
                int id=rs.getInt("idOrder");
                int idAcc=rs.getInt("idAcc");
                Date orderDate = rs.getDate("orderDate");
                String statusDelivery = rs.getString("statusDelivery");
                String address = rs.getString("address");
                double totalValue =rs.getDouble("totalValue");
                orders.add(new Order(id,accountDao.findCByID(idAcc),orderDate,detail,statusDelivery,address,totalValue));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orders;

    }



    private static final String INSERT_CTHD="insert into chiTietDH values(?,?,?)";

    @Override
    public boolean insert(Order order) {
        Connection connection=null  ;
        PreparedStatement preparedStatement=null;
        PreparedStatement preparedStatement1=null;
        try {
             connection= ConnectDB.getConnect(); connection.setAutoCommit(false);
             preparedStatement = connection.prepareStatement(INSERT_ORDER);
            preparedStatement.setInt(1,order.getIdOrder());
            preparedStatement.setInt(2,order.getAccount().getIdAccount());
            preparedStatement.setString(3,order.getStatusDelivery());
            preparedStatement.setString(4,order.getAddress());
            preparedStatement.execute();
            for (Map.Entry<Product, Integer> entry : order.getDetail().entrySet()) {
                preparedStatement1=connection.prepareStatement(INSERT_CTHD);
               preparedStatement1.setInt(1,order.getIdOrder());
               preparedStatement1.setInt(2,entry.getKey().getIdProduct());
               preparedStatement1.setInt(3,entry.getValue());
               preparedStatement1.execute();
            }
            connection.commit();




            return true;

        } catch (SQLException e) {
            try{
                if(connection!=null)
                    connection.rollback();
            }catch(SQLException se2){
                se2.printStackTrace();
            }// Ket thuc khoi try

        }finally {
            try{
                if(preparedStatement1!=null)
                    preparedStatement1.close();
            }catch(SQLException se2){
            }
            try{
                if(preparedStatement!=null)
                    preparedStatement.close();
            }catch(SQLException se2){
            }
            try{
                if(connection!=null)
                    connection.close();
            }catch(SQLException se){
                se.printStackTrace();
            }// Ket thuc khoi finally
        }// Ket thuc khoi try

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
        try (Connection connection= ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER)){
            preparedStatement.setInt(1,id);
            ResultSet resultSet= preparedStatement.executeQuery();
            resultSet.next();
            Map<Product,Integer> detail=new HashMap();

            int idAcc=resultSet.getInt("idAcc");
            Date orderDate = resultSet.getDate("orderDate");
            String statusDelivery = resultSet.getString("statusDelivery");
            String address = resultSet.getString("address");
            double totalValue =resultSet.getDouble("totalValue");

            return new Order(id,accountDao.findCByID(idAcc),orderDate,detail,statusDelivery,address,totalValue);
        } catch (SQLException e) {

        }
        return null;
    }

    @Override
    public boolean edit(Order order) {
        return false;
    }
}
