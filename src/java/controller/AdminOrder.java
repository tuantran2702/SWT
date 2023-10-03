/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.OrderDao;
import dao.OrderDetailDao;
import dao.ProductDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;
import model.Product;
import model.User;

/**
 *
 * @author Mido
 */
@WebServlet(name="AdminOrder", urlPatterns={"/admin/order"})
public class AdminOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int type;
        String typeString = req.getParameter("type");
        if (typeString == null) {
            type = 1;
        } else {
            type = Integer.parseInt(typeString);
        }

        req.setAttribute("type", type);
        List<Product> productList = new ArrayList<>();
        List<OrderDetail> orderDetails = new ArrayList<>();
        try {
            OrderDetailDao orderDetailDao = new OrderDetailDao();
                if (type == 1) {
                    List<OrderDetail> orderDetailList = orderDetailDao.getAllByStatus("%%");
                    orderDetails.addAll(orderDetailList);
                } else {
                    String status="";
                    if(type==2) status = "chờ xác nhận";
                    if(type==3) status = "đang giao hàng";
                    if(type==4) status = "đã giao";
                    if(type==5) status = "đã hủy";
                    List<OrderDetail> orderDetailList = orderDetailDao.getAllByStatus("%"+status+"%");
                    orderDetails.addAll(orderDetailList);
                }
            
            ProductDao productDao = new ProductDao();
            List<User> userList = new ArrayList<>();
            UserDao userDao = new UserDao();
            for (OrderDetail orderDetail : orderDetails) {
                productList.add(productDao.get(orderDetail.getProductID()));
                int orderID = orderDetail.getOrderID();
                int userID = new OrderDao().get(orderID).getUserID();
                userList.add(userDao.get(userID));
            }
            
            req.setAttribute("userList", userList);
            req.setAttribute("orderDetails", orderDetails);
            req.setAttribute("productList", productList);
            
        } catch (Exception e) {
        }
        req.getRequestDispatcher("../adminorder.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
   
    

}
