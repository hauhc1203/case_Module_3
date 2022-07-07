package dao;

import connect.ConnectDB;
import model.Category;
import model.Product;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IDAO<Product> {
    CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    public ArrayList<Product> selectAll() {
        String sql = "select * from product";
        List<Product> products = new ArrayList<>();
        try (Connection connection = ConnectDB.getConnect()) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nameProduct = resultSet.getString("nameProduct");
                Category category = categoryDAO.findCByID(resultSet.getInt("idCategory")) ;
                String imgURL = resultSet.getString("imgURL");
                double price = Double.parseDouble((resultSet.getString("price")));
                int quantity = Integer.parseInt(resultSet.getString("quantity"));
  products.add(new Product(nameProduct,category,imgURL,price,quantity));

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
      return (ArrayList<Product>) products;
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
            return false;
        }
    }
}
