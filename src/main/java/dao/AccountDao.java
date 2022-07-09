package dao;

import connect.ConnectDB;
import model.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AccountDao implements IDAO<Account>{
    String sql = "select * from taiKhoan where phoneNumber = ? and passWord =?";



    private static final String SEARCH_ACCOUNT = "select * from taiKhoan where idAccount = ? ;";
    public Account getAccount(String phoneNumbe, String passWord) {
        ConnectDB Connect_MySQL = null;
        try (Connection connection = Connect_MySQL.getConnect()) {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, phoneNumbe);
            statement.setString(2, passWord);
            ResultSet resultSet = statement.executeQuery();
            resultSet.next();

            int idacount = resultSet.getInt("idAccount");
            String name = resultSet.getString("fullName");
            String phone = resultSet.getString("phoneNumber");
            String pass = resultSet.getString("passWord");
            String role = resultSet.getString("role");

            return new Account(idacount, phone, pass, name, role);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

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
    public boolean create(String fullName, String phoneNumber, String passWord, String role ) {
        String sql = "INSERT into taiKhoan( fullName ,phoneNumber , passWord ,role )  value (?,?,?,?)";
        ConnectDB Connect_MySQL = null;
        try (Connection connection = Connect_MySQL.getConnect()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, fullName);
            preparedStatement.setString(2, phoneNumber);
            preparedStatement.setString(3, passWord);
            preparedStatement.setString(4, role);
            return preparedStatement.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }
}
