package model;

public class Product {
    private int idProduct;
    private String nameProduct;
    private Category category ;
    private String imgURL;
    private double price;
    private int quantity;
    private int quantity_sold=0;

    public Product() {
    }

    public Product(int idProduct, String nameProduct, Category category, String imgURL, double price, int quantity, int quantity_sold) {
        this.idProduct = idProduct;
        this.nameProduct = nameProduct;
        this.category = category;
        this.imgURL = imgURL;
        this.price = price;
        this.quantity = quantity;
        this.quantity_sold = quantity_sold;
    }

    public Product(String nameProduct, Category category, String imgURL, double price, int quantity) {
        this.nameProduct = nameProduct;
        this.category = category;
        this.imgURL = imgURL;
        this.price = price;
        this.quantity = quantity;
    }




    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantity_sold() {
        return quantity_sold;
    }

    public void setQuantity_sold(int quantity_sold) {
        this.quantity_sold = quantity_sold;
    }
}
