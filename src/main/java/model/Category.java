package model;

public class Category {
    private int idCategory;
    private String  nameCategory;
    private int productQuantity;

    public Category() {
    }

    public Category(String nameCategory) {
        this.nameCategory = nameCategory;
    }

    public Category(int idCategory, String nameCategory, int productQuantity) {
        this.idCategory = idCategory;
        this.nameCategory = nameCategory;
        this.productQuantity = productQuantity;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getNameCategory() {
        return nameCategory;
    }

    public void setNameCategory(String nameCategory) {
        this.nameCategory = nameCategory;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }
}
