/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartDao;
import dao.CartDetailDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.User;
import utility.StringHelper;

/**
 *
 * @author Mido
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getAttribute("isExist") != null) {
            resp.sendRedirect("login");
            return;
        }

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            UserDao userDao = new UserDao();
            boolean check = userDao.checkLogin(username, username, StringHelper.toSHA256(password));

            if (check) {
                User user = userDao.getByUsername(username);
                if (user == null) {
                    user = userDao.get(username);
                }
                if (user.getIsActive() == 1) {
                    req.setAttribute("active", "");
                    req.setAttribute("isExist", !check);
                    req.setAttribute("username", username);
                    req.setAttribute("password", password);
                    doGet(req, resp);
                    return;
                }
                CartDao cartDao = new CartDao();
                Cart cart = cartDao.getByUserID(user.getUserID());
                CartDetailDao cartDetailDao = new CartDetailDao();
                String cartNumber = cartDetailDao.getAllByCartID(cart.getCartID()).size() + "";

                Cookie cookie1 = new Cookie("account", user.getUserID() + "|" + user.getRole());
                Cookie cookie2 = new Cookie("username", user.getUsername());
                Cookie cookie3 = new Cookie("image", user.getImg());
                if (!"0".equals(cartNumber)) {
                    Cookie cookie4 = new Cookie("cart_number", cartNumber);
                    cookie4.setMaxAge(100000);
                    resp.addCookie(cookie4);

                }
                cookie1.setMaxAge(100000);
                cookie2.setMaxAge(100000);
                cookie3.setMaxAge(100000);
                resp.addCookie(cookie1);
                resp.addCookie(cookie2);
                resp.addCookie(cookie3);
                if (user.getRole() < 2) {
                    resp.sendRedirect("/mido");
                } else {
                    resp.sendRedirect("admin");
                }

            } else {

                req.setAttribute("isExist", check);
                req.setAttribute("username", username);
                req.setAttribute("password", password);
                doGet(req, resp);
            }
        } catch (Exception ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
