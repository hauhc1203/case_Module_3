package dao;

import connect.ConnectDB;
import model.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDao {
    String sql = "select * from account where phoneNumbe = ? and password =?";
    public Account getAccount(String phoneNumbe, String password) {
        ConnectDB Connect_MySQL = null;
        try (Connection connection = Connect_MySQL.getConnect()) {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, phoneNumbe);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            resultSet.next();
            int idacount = resultSet.getInt("idAccount");
            String name = resultSet.getString("fullName");
            String phone = resultSet.getString("phoneNumber");
            String pass = resultSet.getString("password");
            String role = resultSet.getString("role");

            return new Account(idacount, name,phone, pass, role);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
