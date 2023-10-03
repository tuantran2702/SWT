/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDao;
import dao.RateDao;
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
import model.Product;
import model.Rate;
import model.User;

/**
 *
 * @author Mido
 */
@WebServlet(name = "RateServlet", urlPatterns = {"/rate"})
public class RateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int star = Integer.parseInt(req.getParameter("star"));
        int id = Integer.parseInt(req.getParameter("productid"));
        int orderDetailId = Integer.parseInt(req.getParameter("orderdetailid"));
        try {
            ProductDao productDao = new ProductDao();
            Product product = productDao.get(id);
            RateDao rateDao = new RateDao();
            UserDao userDao = null;
            User user = null;
            Cookie[] cookies = req.getCookies();
            userDao = new UserDao();
            for (Cookie c : cookies) {
                if ("username".equals(c.getName())) {
                    user = userDao.getByUsername(c.getValue());
                }
            }
            
            Rate rate = rateDao.get(user.getUserID(), id, orderDetailId);
            if(rate == null) {
                rateDao.insert(new Rate(0, user.getUserID(), id, star, orderDetailId));
            } else {
                rate.setValue(star);
                rateDao.update(rate);
            }
            
            product.setRate(rateDao.getProductRate(id));
            productDao.update(product);

        } catch (Exception e) {
        }
        
        resp.sendRedirect("/mido/order?type=4");
    }

}
