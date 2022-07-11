package dao;

import connect.ConnectDB;
import model.Account;
import model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AccountDAO implements IDAO<Account> {

    private static final String INSERT_ACCOUNT = "INSERT INTO taiKhoan (nameCategory) VALUES (?);";
    private static final String SELECT_ALL = "select * from taiKhoan;";
    private static final String SEARCH_ACCOUNT = "select * from taiKhoan where idAccount = ? ;";
    private static final String DELETE_ACCOUNT = "delete from taiKhoan where idCategory = ?;";
    private static final String SELECT_ACCOUNT= "select * from taiKhoan  where idAccount = ?;";

    private  static  final String UPDATE_ACCOUNT="UPDATE taiKhoan SET nameCategory=?;";


    @Override
    public ArrayList<Account> selectAll() {
        return null;
    }

    @Override
    public boolean insert(Account account) {
        return false;
    }

    @Override
    public boolean deleteByID(int id) {
        return false;
    }

    @Override
    public Account findCByID(int id) {

        try (Connection connection= ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_ACCOUNT)){
            preparedStatement.setInt(1,id);
            ResultSet resultSet= preparedStatement.executeQuery();
            resultSet.next();
            int idAccount=resultSet.getInt("idAccount");
            String name = resultSet.getString("fullName");
            String phoneNumber = resultSet.getString("phoneNumber");
            String passWord = resultSet.getString("passWord");
            String role = resultSet.getString("role");
            return new Account(idAccount,phoneNumber,passWord,name,role);
        } catch (SQLException e) {

        }
        return null;
    }

    @Override
    public boolean edit(Account account) {
        return false;
    }
}
