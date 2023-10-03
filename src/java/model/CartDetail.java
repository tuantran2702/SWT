/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Mido
 */
public class CartDetail {
    private int id;
    private  int cartID;
    private int productID;
    private int quantity;
    private int index1;
    private int index2;

    public CartDetail() {
    }

    public CartDetail(int id, int cartID, int productID, int quantity, int index1, int index2) {
        this.id = id;
        this.cartID = cartID;
        this.productID = productID;
        this.quantity = quantity;
        this.index1 = index1;
        this.index2 = index2;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
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

    public int getIndex1() {
        return index1;
    }

    public void setIndex1(int index1) {
        this.index1 = index1;
    }

    public int getIndex2() {
        return index2;
    }

    public void setIndex2(int index2) {
        this.index2 = index2;
    }
    
}
