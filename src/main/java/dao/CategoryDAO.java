package dao;

import connect.ConnectDB;
import model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategoryDAO implements IDAO<Category> {
    private static final String INSERT_CATEGORY = "INSERT INTO loaiSanPham (nameCategory) VALUES (?);";
    private static final String SELECT_ALL_CATEGORY = "select * from loaiSanPham;";
    private static final String SEARCH_CATEGORY = "select * from loaiSanPham where nameCategory like ? ;";
    private static final String DELETE_CATEGORY = "delete from loaiSanPham where idCategory = ?;";
    private static final String SELECT_CATEGORY = "select * from loaiSanPham  where idCategory = ?;";

    private static final String UPDATE_CATEGORY = "UPDATE loaiSanPham SET nameCategory=?;";


    @Override
    public ArrayList<Category> selectAll() {
        ArrayList<Category> categories = new ArrayList<>();
        try (Connection connection = ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORY)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("idCategory");
                String name = rs.getString("nameCategory");
                int productQuantity = rs.getInt("productQuantity");

                categories.add(new Category(id, name, productQuantity));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categories;
    }

    @Override
    public boolean insert(Category category) {
        try (Connection connection = ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CATEGORY)) {
            preparedStatement.setInt(1, category.getIdCategory());
            preparedStatement.setString(2, category.getNameCategory());
            preparedStatement.setInt(3, category.getProductQuantity());
            preparedStatement.executeUpdate();
            return preparedStatement.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteByID(int id) {
        try (Connection connection = ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CATEGORY)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            return preparedStatement.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }

    @Override
    public Category findCByID(int id) {

        try (Connection connection = ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATEGORY)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            int idCategory = resultSet.getInt("idCategory");
            String name = resultSet.getString("nameCategory");
            int productQuantity = resultSet.getInt("productQuantity");

            return new Category(idCategory, name, productQuantity);
        } catch (SQLException e) {

        }

        return null;
    }

    @Override
    public boolean edit(Category category) {
        try (Connection connection = ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CATEGORY)) {
            preparedStatement.setInt(1, category.getIdCategory());
            preparedStatement.setString(2, category.getNameCategory());
            preparedStatement.setInt(3, category.getProductQuantity());
            preparedStatement.executeUpdate();
            return preparedStatement.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }
}
