/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDetailDao;
import dao.ProductDao;
import dao.ProductDetailDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.OrderDetail;
import model.Product;
import model.ProductDetail;
import model.User;

/**
 *
 * @author Mido
 */
@WebServlet(name = "UpdateOrder", urlPatterns = {"/updateorder"})
public class UpdateOrder extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cancel = req.getParameter("cancel");
        if (cancel != null) {
            int id = Integer.parseInt(cancel);
            try {
                OrderDetailDao orderDetailDao = new OrderDetailDao();
                OrderDetail orderDetail = orderDetailDao.get(id);
                orderDetail.setStatus("Đã Hủy");
                orderDetailDao.update(orderDetail);
            } catch (Exception ex) {
                Logger.getLogger(UpdateOrder.class.getName()).log(Level.SEVERE, null, ex);
            }

            UserDao userDao = null;
            User user = null;
            Cookie[] cookies = req.getCookies();
            try {
                userDao = new UserDao();
                for (Cookie c : cookies) {
                    if ("username".equals(c.getName())) {
                        user = userDao.getByUsername(c.getValue());
                    }
                }
            } catch (Exception ex) {
                Logger.getLogger(Profile.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if(user.getRole()>1) {
                resp.sendRedirect("/mido/admin/order");
            } else resp.sendRedirect("/mido/order");

        }

        String check = req.getParameter("check");
        if (check != null) {
            int id = Integer.parseInt(check);
            try {
                OrderDetailDao orderDetailDao = new OrderDetailDao();
                OrderDetail orderDetail = orderDetailDao.get(id);
                orderDetail.setStatus("Đang giao hàng");
                orderDetailDao.update(orderDetail);
            } catch (Exception ex) {
                Logger.getLogger(UpdateOrder.class.getName()).log(Level.SEVERE, null, ex);
            }
            resp.sendRedirect("/mido/admin/order");
        }

        String done = req.getParameter("done");
        if (done != null) {
            int id = Integer.parseInt(done);
            try {
                OrderDetailDao orderDetailDao = new OrderDetailDao();
                OrderDetail orderDetail = orderDetailDao.get(id);
                orderDetail.setStatus("Đã Giao");
                orderDetailDao.update(orderDetail);
                ProductDao productDao = new ProductDao();
                Product product = productDao.get(orderDetail.getProductID());
                ProductDetailDao productDetailDao = new ProductDetailDao();
                ProductDetail productDetail = productDetailDao.getByProductID(product.getProductId());
                String value1 = orderDetail.getSubValue1();
                String value2 = orderDetail.getSubValue2();
                String[] value1Arr = productDetail.getSubgroupValue1().split("\\|");
                String[] value2Arr = productDetail.getSubgroupValue2().split("\\|");
                String[] quantityArr = productDetail.getQuantity().split("\\|");
                if(value1.equals("") && value2.equals("")) {
                    product.setQuantity(product.getQuantity() - orderDetail.getQuantity());
                    productDao.update(product);
                    resp.sendRedirect("/mido/order");
                    return;
                } else if(value2.equals("")) {
                    int index1 = 0;
                    for(String s: value1Arr) {
                        if(s.trim().equals(value1)) break;
                        index1++;
                    }
                    quantityArr[index1*4] = Integer.parseInt(quantityArr[index1*4]) - orderDetail.getQuantity() + "";
                } else {
                    int index1 = 0;
                    for(String s: value1Arr) {
                        if(s.equals(value1)) break;
                        index1++;
                    }
                    int index2 = 0;
                    for(String s: value2Arr) {
                        if(s.equals(value2)) break;
                        index2++;
                    }
                    quantityArr[index1*4+index2] = Integer.parseInt(quantityArr[index1*4+index2]) - orderDetail.getQuantity() + "";
                }
                String quantity="";
                for(String s: quantityArr) {
                    quantity += s + "|";
                }
                quantity = quantity.substring(0 , quantity.length()-1);
                productDetail.setQuantity(quantity);
                productDetailDao.update(productDetail);
                
            } catch (Exception ex) {
                Logger.getLogger(UpdateOrder.class.getName()).log(Level.SEVERE, null, ex);
            }
            resp.sendRedirect("/mido/order");
        }
    }

}
