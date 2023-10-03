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
import model.Product;

/**
 *
 * @author Mido

 */
public class ProductDao extends BaseDao<Product>{
    
    private final String tableName = "[Products_HE163037]";

    public ProductDao() throws Exception {
    }

    @Override
    public List<Product> getAll() {
        String query = "select * from " + tableName;
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), 
                        rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), 
                        rs.getString(13), rs.getString(14), rs.getInt(15));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<Product> getAllByName(String name) {
        String query = "select * from " + tableName + " where productName LIKE ?";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), 
                        rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), 
                        rs.getString(13), rs.getString(14), rs.getInt(15));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<Product> getByName(String name, int offSet, int fetch) {
        String query = "select * from [Products_HE163037] where productName like ? order by productName offset ? rows FETCH FIRST ? ROWS ONLY;";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, offSet);
            ps.setInt(3, fetch);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), 
                        rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), 
                        rs.getString(13), rs.getString(14), rs.getInt(15));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<Product> getByNameSortById(String name, int offSet, int fetch) {
        String query = "select * from [Products_HE163037] where productName like ? order by productID desc offset ? rows FETCH FIRST ? ROWS ONLY;";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, offSet);
            ps.setInt(3, fetch);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), 
                        rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), 
                        rs.getString(13), rs.getString(14), rs.getInt(15));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<Product> getByCategory(int categoryID, int offSet, int fetch) {
        String query = "select * from [Products_HE163037] where categoryID = ? order by productName offset ? rows FETCH FIRST ? ROWS ONLY;";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, categoryID);
            ps.setInt(2, offSet);
            ps.setInt(3, fetch);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), 
                        rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), 
                        rs.getString(13), rs.getString(14), rs.getInt(15));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public List<Product> getByCategorySortById(int categoryID, int offSet, int fetch) {
        String query = "select * from [Products_HE163037] where categoryID = ? order by productID desc offset ? rows FETCH FIRST ? ROWS ONLY;";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, categoryID);
            ps.setInt(2, offSet);
            ps.setInt(3, fetch);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), 
                        rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), 
                        rs.getString(13), rs.getString(14), rs.getInt(15));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public int insert(Product obj) {
        String query = "INSERT INTO " + tableName + "(productName, price, [desc], image, categoryID, brand, country, quantity, discountID, rate) VALUES(?,?,?,?,?,?,?,?,?,?)";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, obj.getProductName(), obj.getPrice(),  obj.getDesc(),
                    obj.getImage(), obj.getCategoryID(), obj.getBrand(), obj.getCountry(), obj.getQuantity(), obj.getDiscountID(), obj.getRate());
            num = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
    }

    @Override
    public int update(Product obj) {
        String query = "UPDATE " + tableName + " SET productName = ?, [price] = ?, [weight] = ?, [desc] = ?, [image] = ?, [categoryID] = ?, "
                + "[discountID] = ?, [rate] = ?, [brand] = ?, [country] = ?, [quantity] = ? "
                + "where productID = ?";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, obj.getProductName(), obj.getPrice(), obj.getWeight(), obj.getDesc(),
                    obj.getImage(), obj.getCategoryID(), obj.getDiscountID(), obj.getRate(), 
                    obj.getBrand(), obj.getCountry(), obj.getQuantity(), obj.getProductId());
            num = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
    }

    @Override
    public int delete(int id) {
        String query = "DELETE FROM " + tableName + " WHERE productID = ?";
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
    public Product get(int id) {
        String query = "select * from Products_HE163037 where productID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), 
                        rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), 
                        rs.getString(13), rs.getString(14), rs.getInt(15));
                return product;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public int getProductID() {
        String query = "select productID from Products_HE163037  where productID >= all (select productID from Products_HE163037)";
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
            Product p = get(id);
            Double weight = p.getWeight() +1;
            String sql ="UPDATE [Products_HE163037] SET [weight]  = " +weight+ " WHERE productID = " + id;
            PreparedStatement stm = con.prepareStatement(sql);
            stm.executeUpdate();
            System.out.println("Success");
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public int getSize() {
        int ans = 0;
        String query = "select count(productID) from [Products_HE163037]";
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
    
    public int getSizeByName(String name) {
        int ans = 0;
        String query = "select count(productID) from [Products_HE163037] where productName like ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
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
    
    public int getSizeByCategory(int categoryID) {
        int ans = 0;
        String query = "select count(productID) from [Products_HE163037] where categoryID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, categoryID);
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
    public static void main(String[] args) throws Exception {
        ProductDao p = new ProductDao();
        p.updatView(1020);
        
        
    }
    
}
