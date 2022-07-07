package dao;

import model.Account;

import java.util.ArrayList;

public class AccountDAO implements IDAO<Account> {

    private static final String INSERT_ACCOUNT = "INSERT INTO taiKhoan (nameCategory) VALUES (?);";
    private static final String SELECT_ALL = "select * from taiKhoan;";
    private static final String SEARCH_ACCOUNT = "select * from taiKhoan where nameCategory like ? ;";
    private static final String DELETE_ACCOUNT = "delete from taiKhoan where idCategory = ?;";
    private static final String SELECT_ACCOUNT= "select * from taiKhoan  where idProduct = ?;";

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
        return null;
    }

    @Override
    public boolean edit(Account account) {
        return false;
    }
}
