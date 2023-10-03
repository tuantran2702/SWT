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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.User;

/**
 *
 * @author Mido
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/order"})
public class OrderServlet extends HttpServlet {

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

        List<Order> orderList = new ArrayList<>();
        List<Product> productList = new ArrayList<>();
        List<OrderDetail> orderDetails = new ArrayList<>();
        try {
            OrderDao orderDao = new OrderDao();
            orderList = orderDao.getAllByUserId(user.getUserID());
            for (Order order : orderList) {
                OrderDetailDao orderDetailDao = new OrderDetailDao();
                if (type == 1) {
                    List<OrderDetail> orderDetailList = orderDetailDao.getAllByOrderId(order.getOrderID());
                    orderDetails.addAll(orderDetailList);
                } else {
                    String status="";
                    if(type==2) status = "chờ xác nhận";
                    if(type==3) status = "đang giao hàng";
                    if(type==4) {status = "đã giao"; orderDao.updatView(user.getUserID());}
                    if(type==5) status = "đã hủy";
                    List<OrderDetail> orderDetailList = orderDetailDao.getAllByOrderId(order.getOrderID());
                    for(OrderDetail orderDetail: orderDetailList) {
                        if(orderDetail.getStatus().equalsIgnoreCase(status)) {
                            orderDetails.add(orderDetail);
                        }
                    }
                }

            }
            ProductDao productDao = new ProductDao();
            for (OrderDetail orderDetail : orderDetails) {
                productList.add(productDao.get(orderDetail.getProductID()));
            }
            req.setAttribute("orderDetails", orderDetails);
            req.setAttribute("productList", productList);
        } catch (Exception e) {
        }
        req.getRequestDispatcher("order.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

        try {
            double total = 0;
            OrderDao orderDao = new OrderDao();
            orderDao.insert(new Order(0, user.getUserID(), 0, 0));
            String[] productIDArrString = req.getParameterValues("product_id");
            String[] quantityArrString = req.getParameterValues("quantity");
            String[] subValueArrString = req.getParameterValues("subvalue");
            String[] priceArrString = req.getParameterValues("price");
            String[] imageArrString = req.getParameterValues("image");
            for (int i = 0; i < imageArrString.length; i++) {
                int productID = Integer.parseInt(productIDArrString[i]);
                int quantity = Integer.parseInt(quantityArrString[i]);
                String value1 = subValueArrString[i].split("\\,\\s")[0];
                String value2 = "";
                if (subValueArrString[i].split("\\,\\s").length > 1) {
                    value2 = subValueArrString[i].split("\\,\\s")[1];
                }
                double price = Double.parseDouble(priceArrString[i]);
                total += price * quantity;
                OrderDetailDao orderDetailDao = new OrderDetailDao();
                orderDetailDao.insert(new OrderDetail(0, orderDao.getOrderId(), productID, quantity, value1, value2, price, imageArrString[i], ""));
            }
            Order order = orderDao.get(orderDao.getOrderId());
            order.setTotal(total);
            orderDao.update(order);
        } catch (Exception e) {
        }

        doGet(req, resp);
    }

}
