/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Mido
 */
public class OrderDetail {
    private int id;
    private int orderID;
    private int productID;
    private int quantity;
    private String subValue1;
    private String subValue2;
    private double price;
    private String image;
    private String status;

    public OrderDetail() {
    }

    public OrderDetail(int id, int orderID, int productID, int quantity, String subValue1, String subValue2, double price, String image, String status) {
        this.id = id;
        this.orderID = orderID;
        this.productID = productID;
        this.quantity = quantity;
        this.subValue1 = subValue1;
        this.subValue2 = subValue2;
        this.price = price;
        this.image = image;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSubValue1() {
        return subValue1;
    }

    public void setSubValue1(String subValue1) {
        this.subValue1 = subValue1;
    }

    public String getSubValue2() {
        return subValue2;
    }

    public void setSubValue2(String subValue2) {
        this.subValue2 = subValue2;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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
