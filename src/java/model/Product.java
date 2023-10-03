/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Mido
 */
public class Product {
    private int productId;
    private String sku;
    private String productName;
    private double price;
    private double weight;
    
    private String desc;
    private String image;
    private int categoryID;
    private int shopID;
    private int inventoryID;
    private int discountID;
    private double rate;
    private String brand;
    private String country;
    private int quantity;

    public Product() {
    }

    public Product(int productId, String sku, String productName, double price, double weight, String desc, String image, int categoryID, int shopID, int inventoryID, int discountID, double rate, String brand, String country, int quantity) {
        this.productId = productId;
        this.sku = sku;
        this.productName = productName;
        this.price = price;
        this.weight = weight;
        this.desc = desc;
        this.image = image;
        this.categoryID = categoryID;
        this.shopID = shopID;
        this.inventoryID = inventoryID;
        this.discountID = discountID;
        this.rate = rate;
        this.brand = brand;
        this.country = country;
        this.quantity = quantity;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getShopID() {
        return shopID;
    }

    public void setShopID(int shopID) {
        this.shopID = shopID;
    }

    public int getInventoryID() {
        return inventoryID;
    }

    public void setInventoryID(int inventoryID) {
        this.inventoryID = inventoryID;
    }

    public int getDiscountID() {
        return discountID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    

    
    
    public String getPriceString(double price) {
        String s = (int)price + "";
        int n = s.length();
        String priceString="";
        for(int i=0;i<n;i++) {
            priceString += s.charAt(i);
            if((n-i-1)%3 == 0 && i!=n-1)
                priceString += ".";
        }
        return priceString;
    }
    
    
}
