/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;

/**
 *
 * @author Mido
 */
public class CartDao extends BaseDao<Cart> {

    private final String tableName = "[Carts_HE163037]";

    public CartDao() throws Exception {
    }

    @Override
    public List<Cart> getAll() {
        String query = "select * from " + tableName;
        List<Cart> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart(rs.getInt(1), rs.getInt(2), rs.getDouble(3));
                list.add(cart);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public int insert(Cart obj) {
        String query = "insert into Carts_HE163037(userID, total)"
                + " values(?,?)";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, obj.getUserID(), obj.getTotal());
            num = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
    }

    @Override
    public int update(Cart obj) {
        String query = "UPDATE " + tableName + " SET userID = ?, total =?"
                + " where cartID = ?";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, obj.getUserID(), obj.getTotal(), obj.getCartID());
            num = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
    }

    @Override
    public int delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Cart get(int id) {
        String query = "select * from Carts_HE163037 where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart(rs.getInt(1), rs.getInt(2), rs.getDouble(3));
                return cart;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Cart getByUserID(int id) {
        String query = "select * from Carts_HE163037 where userID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart(rs.getInt(1), rs.getInt(2), rs.getDouble(3));
                return cart;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
