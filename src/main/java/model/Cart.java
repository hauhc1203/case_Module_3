package model;

import java.util.Map;

public class Cart extends Product{
    private Account account;
    private Map<Product,Integer> detail;
    private double totalValue;

    public Cart(Account account, Map<Product, Integer> detail, double totalValue) {
        this.account = account;
        this.detail = detail;
        this.totalValue = totalValue;
    }


    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Map<Product, Integer> getDetail() {
        return detail;
    }

    public void setDetail(Map<Product, Integer> detail) {
        this.detail = detail;
    }

    public double getTotalValue() {
        return totalValue;
    }

    public void setTotalValue(double totalValue) {
        this.totalValue = totalValue;
    }
}
