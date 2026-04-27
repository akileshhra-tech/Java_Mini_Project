package com.model;

public class Product {
    private int productID;
    private String productName;
    private String category;
    private double price;
    private int quantity;

    public Product() {}

    public Product(int productID, String productName, String category, double price, int quantity) {
        this.productID = productID;
        this.productName = productName;
        this.category = category;
        this.price = price;
        this.quantity = quantity;
    }

    public int getProductID() { return productID; }
    public void setProductID(int productID) { this.productID = productID; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    @Override
    public String toString() {
        return "Product{ID=" + productID + ", Name=" + productName +
               ", Category=" + category + ", Price=" + price + ", Qty=" + quantity + "}";
    }
}
