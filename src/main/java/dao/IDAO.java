package dao;


import java.util.ArrayList;

public interface IDAO<E> {
        ArrayList<E> selectAll();
        boolean insert(E e);
        boolean deleteByID(int id);
        E findCByID(int id);
        boolean edit(E e);
}
