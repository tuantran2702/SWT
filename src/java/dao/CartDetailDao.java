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
import model.CartDetail;

/**
 *
 * @author Mido
 */
public class CartDetailDao extends BaseDao<CartDetail>{
    
    private final String tableName = "[Cart_Details_HE163037]";
    
    public CartDetailDao() throws Exception {
    }
    
    @Override
    public List<CartDetail> getAll() {
        String query = "select * from " + tableName;
        List<CartDetail> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CartDetail cartDetail = new CartDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), 
                rs.getInt(4), rs.getInt(5), rs.getInt(6));
                list.add(cartDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<CartDetail> getAllByCartID(int cartID) {
        String query = "select * from " + tableName + " where cartID = ?";
        List<CartDetail> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cartID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CartDetail cartDetail = new CartDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), 
                rs.getInt(4), rs.getInt(5), rs.getInt(6));
                list.add(cartDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public int insert(CartDetail obj) {
        String query = "insert into Cart_Details_HE163037(cartID, productID, quantity, [subgroupindex1],[subgroupindex2])"
                + " values(?,?,?,?,?)";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, obj.getCartID(), obj.getProductID(), 
                    obj.getQuantity(), obj.getIndex1(), obj.getIndex2());
            num = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
        
    }

    @Override
    public int update(CartDetail obj) {
        String query = "UPDATE " + tableName + " SET cartID = ?, productID = ?, quantity = ?, "
                + "[subgroupindex1] = ?, [subgroupindex2] = ?"
                + " where id = ?";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, obj.getCartID(), obj.getProductID(), obj.getQuantity(),
                    obj.getIndex1(), obj.getIndex2(), obj.getId());
            num = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
    }

    @Override
    public int delete(int id) {
        String query = "DELETE FROM " + tableName + " WHERE id = ?";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, id);
            num =  ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
    }

    @Override
    public CartDetail get(int id) {
        String query = "select * from Cart_Details_HE163037 where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CartDetail cartDetail = new CartDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), 
                rs.getInt(4), rs.getInt(5), rs.getInt(6));
                return cartDetail;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public CartDetail getBySubgroup(int cartID, int productID, int index1, int index2) {
        String query = "select * from Cart_Details_HE163037 where cartID = ? and productID = ? "
                + "and [subgroupindex1] = ? and [subgroupindex2] = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cartID);
            ps.setInt(2, productID);
            ps.setInt(3, index1);
            ps.setInt(4, index2);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CartDetail cartDetail = new CartDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), 
                rs.getInt(4), rs.getInt(5), rs.getInt(6));
                return cartDetail;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
