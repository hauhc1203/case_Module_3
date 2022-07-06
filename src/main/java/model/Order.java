package model;

import java.sql.Date;
import java.util.Map;

public class Order {
    private int idOrder;
    private Account account;
    private Date orDate;
    private Map<Product,Integer> detail;
    private String statusDelivery;
    private String address;
    private double totalValue;


    public Order() {
    }

    public Order(int idOrder, Account account, Date orDate, Map<Product, Integer> detail, String statusDelivery, String address, double totalValue) {
        this.idOrder = idOrder;
        this.account = account;
        this.orDate = orDate;
        this.detail = detail;
        this.statusDelivery = statusDelivery;
        this.address = address;
        this.totalValue = totalValue;
    }

    public Order(Account account, Date orDate, Map<Product, Integer> detail, String statusDelivery, String address, double totalValue) {
        this.account = account;
        this.orDate = orDate;
        this.detail = detail;
        this.statusDelivery = statusDelivery;
        this.address = address;
        this.totalValue = totalValue;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Date getOrDate() {
        return orDate;
    }

    public void setOrDate(Date orDate) {
        this.orDate = orDate;
    }

    public Map<Product, Integer> getDetail() {
        return detail;
    }

    public void setDetail(Map<Product, Integer> detail) {
        this.detail = detail;
    }

    public String getStatusDelivery() {
        return statusDelivery;
    }

    public void setStatusDelivery(String statusDelivery) {
        this.statusDelivery = statusDelivery;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getTotalValue() {
        return totalValue;
    }

    public void setTotalValue(double totalValue) {
        this.totalValue = totalValue;
    }
}
