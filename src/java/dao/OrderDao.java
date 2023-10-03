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
import model.Order;
import model.Product;

/**
 *
 * @author Mido
 */
public class OrderDao extends BaseDao<Order>{
    
    private final String tableName = "[Orders_HE163037]";
    
    public OrderDao() throws Exception {
    }
    

    @Override
    public List<Order> getAll() {
        String query = "select * from " + tableName;
        List<Order> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getInt(4));
                list.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    public List<Order> getAllByUserId(int userID) {
        String query = "select * from " + tableName +" where userID = ? order by orderID desc";
        List<Order> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getInt(4));
                list.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }

    @Override
    public int insert(Order obj) {
        String query = "INSERT INTO " + tableName + "(userID, total, paymentID) VALUES(?,?,?)";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, obj.getUserID(), obj.getTotal(), obj.getPaymentID());
            num = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
    }

    @Override
    public int update(Order obj) {
        String query = "UPDATE " + tableName + " SET userID = ?, total = ?, paymentID = ? "
                + "where orderID = ?";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, obj.getUserID(),
                    obj.getTotal(), obj.getPaymentID(), obj.getOrderID());
            num = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
    }

    @Override
    public int delete(int id) {
        String query = "DELETE FROM " + tableName + " WHERE orderID = ?";
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
    public Order get(int id) {
        String query = "select * from [Orders_HE163037] where orderID = ?";
        try {
            PreparedStatement ps = createPreparedStatement(query, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getInt(4));
                return order;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public int getOrderId() {
        String query = "select orderID from [Orders_HE163037]  where orderID >= all (select orderID from [Orders_HE163037])";
        int ans = 0;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                ans = rs.getInt(1);
                return ans;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ans;
    }
    public void updatView(int id ){
        try {
            Order p = get(id);
            int payID = p.getPaymentID()+1;
            String sql ="UPDATE [Products_HE163037] SET [weight]  = " +payID+ " WHERE productID = " + id;
            PreparedStatement stm = con.prepareStatement(sql);
            stm.executeUpdate();
            System.out.println("Success");
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
