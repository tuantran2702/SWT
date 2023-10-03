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
import model.ProductDetail;
import utility.StringHelper;

/**
 *
 * @author Mido
 */
public class ProductDetailDao extends BaseDao<ProductDetail>{
    private final String tableName = "[Product_Details_HE163037]";

    public ProductDetailDao() throws Exception {
    }

    @Override
    public List<ProductDetail> getAll() {
        String query = "select * from " + tableName;
        List<ProductDetail> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDetail productDetail = new ProductDetail(rs.getInt(1), rs.getInt(2), rs.getString(3), 
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
                list.add(productDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ProductDetail getByProductID(int productID) {
        String query = "select * from " + tableName + " where productID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDetail productDetail = new ProductDetail(rs.getInt(1), rs.getInt(2), rs.getString(3), 
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
                return productDetail;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public int insert(ProductDetail obj) {
        String query = "INSERT INTO " + tableName + "(productID, subgroupName1, [subgroupName2], subgroupValue1, subgroupValue2, "
                + "subgroupImage1, price, quantity) VALUES(?,?,?,?,?,?,?,?)";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, obj.getProductID(), obj.getSubgroupName1(), obj.getSubgroupName2(),
                    obj.getSubgroupValue1(), obj.getSubgroupValue2(), obj.getSubgroupImage1(), obj.getPrice(), obj.getQuantity());
            num = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
    }

    @Override
    public int update(ProductDetail obj) {
        String query = "UPDATE " + tableName + " SET [productID] = ?, [subgroupName1] = ?, [subgroupName2] = ?, [subgroupValue1] = ?, [subgroupValue2] = ?, [subgroupImage1] = ?, "
                + "[price] = ?, [quantity] = ? "
                + "where id = ?";
        int num = 0;
        try {
            PreparedStatement ps = createPreparedStatement(query, obj.getProductID(), obj.getSubgroupName1(), obj.getSubgroupName2(), 
                    obj.getSubgroupValue1(), obj.getSubgroupValue2(), obj.getSubgroupImage1(), obj.getPrice(), obj.getQuantity(), obj.getId());
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
    public ProductDetail get(int id) {
        String query = "select * from Product_Details_HE163037 where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDetail productDetail = new ProductDetail(rs.getInt(1), rs.getInt(2), rs.getString(3), 
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
                return productDetail;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public int getQuantity(int id) {
        ProductDetail productDetail = get(id);
        if(productDetail.getSubgroupName1().equals("") && productDetail.getSubgroupName2().equals("")){
            try {
                ProductDao productDao = new ProductDao();
                return productDao.get(productDetail.getProductID()).getQuantity();
            } catch (Exception ex) {
                Logger.getLogger(ProductDetailDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        int[] quantityArr = StringHelper.getIntArr(productDetail.getQuantity(), "\\|");
        String[] subgroupValue1 = productDetail.getSubgroupValue1().split("\\|");
        String[] subgroupValue2 = productDetail.getSubgroupValue1().split("\\|");
        int ans = 0;
        for(int i=0; i<quantityArr.length; i++) {
            if(quantityArr[i]<=0)
                continue;
            if(!productDetail.getSubgroupName1().equals("") && subgroupValue1[i/4].equals("null"))
                continue;
            if(!productDetail.getSubgroupName2().equals("") && subgroupValue2[i%4].equals("null"))
                continue;
            if(!productDetail.getSubgroupName1().equals("") && productDetail.getSubgroupName2().equals("")) {
                if(i%4!=0)
                    continue;
            }
            if(productDetail.getSubgroupName1().equals("") && !productDetail.getSubgroupName2().equals("")) {
                if(i>3)
                    continue;
            }
            ans+=quantityArr[i];
        }
        return ans;
    }
    
}
