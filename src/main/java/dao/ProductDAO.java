package dao;

import connect.ConnectDB;
import model.Category;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO implements IDAO<Product> {

    private static final String INSERT_CATEGORY = "INSERT INTO sanPham (nameCategory) VALUES (?);";
    private static final String SELECT_ALL = "select * from sanPham;";
    private static final String SEARCH_CATEGORY = "select * from sanPham where nameCategory like ? ;";
    private static final String DELETE_CATEGORY = "delete from sanPham where idCategory = ?;";
    private static final String SELECT_CATEGORY = "select * from sanPham  where idCategory = ?;";

    private  static  final String UPDATE_CATEGORY="UPDATE sanPham SET nameCategory=?;";

    CategoryDAO categoryDAO=new CategoryDAO();

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
        return null;
    }

    @Override
    public boolean edit(Product product) {
        return false;
    }
}
