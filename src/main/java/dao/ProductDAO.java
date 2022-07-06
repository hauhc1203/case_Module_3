package dao;

import model.Product;

import java.util.ArrayList;

public class ProductDAO implements IDAO<Product> {
    @Override
    public ArrayList<Product> selectAll() {
        return null;
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
