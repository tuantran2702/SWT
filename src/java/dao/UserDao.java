/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Mido
 * @param <User>
 */
public class UserDao extends BaseDao<User> {

    private final String tableName = "Users_HE163037";

    public UserDao() throws Exception {
    }

    @Override
    public int delete(int id) {
        String query = "DELETE FROM " + tableName + " WHERE userID = ?";
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
    public int update(User obj) {
        String query = "UPDATE " + tableName + " SET username = ?, password = ?, email = ?, telephone = ?, "
                + "fullName = ?, img = ?, role = ?, "
                + "one_time_password = ?, otp_request_time = ?, dob = ?, gender = ?, address = ?, isactive = ? "
                + " WHERE userID = ?";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, obj.getUsername(), obj.getPassword(), obj.getEmail(), obj.getTelephone(),
                    obj.getFullName(), obj.getImg(), obj.getRole(), obj.getOtp(), obj.getOtpRequestTime(), obj.getDob(), 
                    obj.getGender(), obj.getAddress(), obj.getIsActive(), obj.getUserID());
            num = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
    }

    @Override
    public int insert(User obj) {
        String query = "INSERT INTO " + tableName + "(username, email, password, role, img) VALUES(?,?,?,?,?)";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, obj.getUsername(), obj.getEmail(),  obj.getPassword(), obj.getRole(), obj.getImg());
            num = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
    }

    @Override
    public List<User> getAll() {
        String query = "select * from " + tableName;
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), 
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9), 
                        rs.getDate(10), rs.getString(11), rs.getInt(12), rs.getString(13), rs.getInt(14));
                list.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    public boolean checkLogin(String username, String email, String password) {
        String query = "select * from Users_HE163037 where (username = ? or email=?) and password = ? collate Latin1_General_CS_AS";
        try {
            PreparedStatement ps = createPreparedStatement(query, username, email, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    @Override
    public User get(int id) {
        String query = "select * from Users_HE163037 where userID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), 
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9), 
                        rs.getDate(10), rs.getString(11), rs.getInt(12), rs.getString(13), rs.getInt(14));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public  User get(String email) {
        String query = "select * from Users_HE163037 where email = ?";
        try {
            PreparedStatement ps = createPreparedStatement(query, email);
            //PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), 
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9), 
                        rs.getDate(10), rs.getString(11), rs.getInt(12), rs.getString(13), rs.getInt(14));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public  User getByUsername(String username) {
        String query = "select * from Users_HE163037 where username = ?";
        try {
            PreparedStatement ps = createPreparedStatement(query, username);
            //PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), 
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9), 
                        rs.getDate(10), rs.getString(11), rs.getInt(12), rs.getString(13), rs.getInt(14));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
