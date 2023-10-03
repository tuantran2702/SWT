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
import model.Rate;

/**
 *
 * @author Mido
 */
public class RateDao extends BaseDao<Rate>{
    private final String tableName = "[Rate_HE163037]";

    public RateDao() throws Exception {
    }
    

    @Override
    public List<Rate> getAll() {
        String query = "select * from " + tableName;
        List<Rate> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Rate rate = new Rate(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5));
                list.add(rate);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }

    @Override
    public int insert(Rate obj) {
        String query = "INSERT INTO " + tableName + "(userID, productID, rate_value, orderDetailID) VALUES(?,?,?,?)";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, obj.getUserID(), obj.getProductID(), obj.getValue(), obj.getOrderDetailId());
            num = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
    }

    @Override
    public int update(Rate obj) {
        String query = "UPDATE " + tableName + " SET userID = ?, productID = ?, rate_value = ?, orderDetailID = ? "
                + "where id = ?";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, obj.getUserID(),
                    obj.getProductID(), obj.getValue(), obj.getOrderDetailId(), obj.getId());
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
    public Rate get(int id) {
        String query = "select * from [Rate_HE163037] where id = ?";
        try {
            PreparedStatement ps = createPreparedStatement(query, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Rate rate = new Rate(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5));
                return rate;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Rate get(int userID, int productID, int orderDetailId) {
        String query = "select * from [Rate_HE163037] where userID = ? and productID = ? and orderDetailID = ?";
        try {
            PreparedStatement ps = createPreparedStatement(query, userID, productID, orderDetailId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Rate rate = new Rate(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5));
                return rate;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public int getNumberOfVoting(int producID) {
        String query = "select count(id) from [Rate_HE163037] where rate_value > 0 and productID = ?";
        try {
            int count = 0;
            PreparedStatement ps = createPreparedStatement(query, producID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }     
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return 0;
    }
    
    public double getProductRate(int productID) {
        String query = "select sum(rate_value) from [Rate_HE163037] where productID = ?";
        try {
            double sum = 0;
            int count = 0;
            PreparedStatement ps = createPreparedStatement(query, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                sum = rs.getInt(1);
            }
            
            query = "select count(id) from [Rate_HE163037] where rate_value > 0 and productID = ?";
            ps = createPreparedStatement(query, productID);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
            
            return sum/count;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return 0;
    }
    
}
