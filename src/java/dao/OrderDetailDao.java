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
import model.OrderDetail;

/**
 *
 * @author Mido
 */
public class OrderDetailDao extends BaseDao<OrderDetail>{
    private final String tableName = "[Order_Details_HE163037]";

    public OrderDetailDao() throws Exception {
    }
    
    

    @Override
    public List<OrderDetail> getAll() {
        String query = "select * from " + tableName;
        List<OrderDetail> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6), rs.getDouble(7), 
                        rs.getString(8), rs.getString(9));
                list.add(orderDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    public List<OrderDetail> getAllByOrderId(int orderID) {
        String query = "select * from " + tableName + " where orderID = ? order by id desc";
        List<OrderDetail> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6), rs.getDouble(7), 
                        rs.getString(8), rs.getString(9));
                list.add(orderDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    public List<OrderDetail> getAllByProductId(int productID) {
        String query = "select * from " + tableName + " where productID = ? order by id desc";
        List<OrderDetail> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6), rs.getDouble(7), 
                        rs.getString(8), rs.getString(9));
                list.add(orderDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    public List<OrderDetail> getAllByStatus(String status) {
        String query = "select * from " + tableName + " where status like ? order by id desc";
        List<OrderDetail> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6), rs.getDouble(7), 
                        rs.getString(8), rs.getString(9));
                list.add(orderDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }

    @Override
    public int insert(OrderDetail obj) {
        String query = "INSERT INTO " + tableName + "(orderID, productID, quantity, [subgroupvalue1], "
                + "[subgroupvalue2], [price], image) VALUES(?,?,?,?,?,?,?)";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, obj.getOrderID(), obj.getProductID(), obj.getQuantity(),
                    obj.getSubValue1(), obj.getSubValue2(), obj.getPrice(), obj.getImage());
            num = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
    }

    @Override
    public int update(OrderDetail obj) {
        String query = "UPDATE " + tableName + " SET [orderID] = ?, [productID] = ?, [quantity] = ?, [subgroupvalue1] = ?, "
                + "[subgroupvalue2] = ?, [price] = ?, [image] = ?, [status] = ? "
                + "where id = ?";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, obj.getOrderID(), obj.getProductID(), obj.getQuantity(),
                    obj.getSubValue1(), obj.getSubValue2(), obj.getPrice(), obj.getImage(), obj.getStatus(), obj.getId());
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
    public OrderDetail get(int id) {
        String query = "select * from [Order_Details_HE163037] where id = ?";
        try {
            PreparedStatement ps = createPreparedStatement(query, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6), rs.getDouble(7), 
                        rs.getString(8), rs.getString(9));
                return orderDetail;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
