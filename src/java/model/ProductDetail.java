/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Mido
 */
public class ProductDetail {
    private int id;
    private int productID;
    private String subgroupName1;
    private String subgroupName2;
    private String subgroupValue1;
    private String subgroupValue2;
    private String subgroupImage1;
    private String price;
    private String quantity;
    
    public ProductDetail() {
    }

    public ProductDetail(int id, int productID, String subgroupName1, String subgroupName2, String subgroupValue1, String subgroupValue2, String subgroupImage1, String price, String quantity) {
        this.id = id;
        this.productID = productID;
        this.subgroupName1 = subgroupName1;
        this.subgroupName2 = subgroupName2;
        this.subgroupValue1 = subgroupValue1;
        this.subgroupValue2 = subgroupValue2;
        this.subgroupImage1 = subgroupImage1;
        this.price = price;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getSubgroupName1() {
        return subgroupName1;
    }

    public void setSubgroupName1(String subgroupName1) {
        this.subgroupName1 = subgroupName1;
    }

    public String getSubgroupName2() {
        return subgroupName2;
    }

    public void setSubgroupName2(String subgroupName2) {
        this.subgroupName2 = subgroupName2;
    }

    public String getSubgroupValue1() {
        return subgroupValue1;
    }

    public void setSubgroupValue1(String subgroupValue1) {
        this.subgroupValue1 = subgroupValue1;
    }

    public String getSubgroupValue2() {
        return subgroupValue2;
    }

    public void setSubgroupValue2(String subgroupValue2) {
        this.subgroupValue2 = subgroupValue2;
    }

    public String getSubgroupImage1() {
        return subgroupImage1;
    }

    public void setSubgroupImage1(String subgroupImage1) {
        this.subgroupImage1 = subgroupImage1;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    
    
    
}
