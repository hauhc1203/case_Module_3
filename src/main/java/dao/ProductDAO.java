package dao;

import connect.ConnectDB;
import model.Category;
import model.Product;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IDAO<Product> {
    private static final String INSERT_CATEGORY = "INSERT INTO sanPham (nameCategory) VALUES (?);";
    private static final String SELECT_ALL = "select * from sanPham;";
    private static final String SEARCH_CATEGORY = "select * from sanPham where nameCategory like ? ;";
    private static final String DELETE_CATEGORY = "delete from sanPham where idCategory = ?;";
    private static final String SELECT_PRODUCT= "select * from sanPham  where idProduct = ?;";

    private  static  final String UPDATE_CATEGORY="UPDATE sanPham SET nameCategory=?;";
    CategoryDAO categoryDAO = new CategoryDAO();


    @Override
    public ArrayList<Product> selectAll() {
        ArrayList<Product> products =new ArrayList<>();
        try (Connection connection= ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)){
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int idProduct=rs.getInt("idProduct");
                int idCategory=rs.getInt("idCategory");
                String name = rs.getString("nameProduct");
                String imgURL = rs.getString("imgProduct");
                double price =rs.getDouble("price");
                int quantity =rs.getInt("quantity");
                int quantity_sold =rs.getInt("quantity_sold");
                products.add(new Product(idProduct,name,categoryDAO.findCByID(idCategory),imgURL,price,quantity,quantity_sold));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    @Override
    public boolean insert(Product product) {
        return false;
    }

    @Override
    public boolean deleteByID(int id) {
        return false;
    }

    @Override
    public Product findCByID(int id) {

        try (Connection connection= ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT)){
            preparedStatement.setInt(1,id);
            ResultSet resultSet= preparedStatement.executeQuery();
            resultSet.next();
            int idProduct=resultSet.getInt("idProduct");
            int idCategory=resultSet.getInt("idCategory");
            String name = resultSet.getString("nameProduct");
            String imgURL = resultSet.getString("imgProduct");
            double price=resultSet.getDouble("price");
            int quantity = resultSet.getInt("quantity");
            int quantity_sold = resultSet.getInt("quantity_sold");
            return new Product(idProduct,name,categoryDAO.findCByID(idCategory),imgURL,price,quantity,quantity_sold);
        } catch (SQLException e) {

        }
        return null;
    }

    @Override
    public boolean edit(Product product) {
        String sql = "UPDATE product SET name = ?,dateOfBirth = ?, " +
                "address = ?,email = ?,phoneNumber = ?, idClass=? WHERE (id = ?)";
        try (Connection connection = ConnectDB.getConnect()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(2,product.getCategory().getIdCategory());
            preparedStatement.setString(1, product.getNameProduct());
            preparedStatement.setString(2, String.valueOf(product.getImgURL()));
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setInt(4, product.getQuantity());

            return preparedStatement.execute();
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return false;
    }
}
