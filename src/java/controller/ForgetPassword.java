/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
import model.User;
import utility.StringHelper;
import utility.UserServices;

/**
 *
 * @author Mido
 */
@WebServlet(name = "ForgetPassword", urlPatterns = {"/forgetpassword"})
public class ForgetPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserDao userDao = new UserDao();
            req.setAttribute("userList", userDao.getAll());
        } catch (Exception ex) {
            Logger.getLogger(ForgetPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
        req.setAttribute("step", 1);
        req.getRequestDispatcher("forgetpassword.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        UserServices userServices = new UserServices();
        User user = null;
        UserDao userDao = null;
        if (email != null) {
            try {
                userDao = new UserDao();
                user = userDao.get(email);
                Cookie cookie = new Cookie("email", email);
                resp.addCookie(cookie);
            } catch (Exception ex) {
                Logger.getLogger(ForgetPassword.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        String otp = req.getParameter("otp");
        String password = req.getParameter("password");
        if (otp == null && email != null) {
            try {
                if (user != null) {
                    userServices.generateOneTimePassword(user);
                    req.setAttribute("step", 2);
                    req.getRequestDispatcher("forgetpassword.jsp").forward(req, resp);
                } else {
                    req.setAttribute("email", email);
                    doGet(req, resp);
                }
            } catch (Exception ex) {
                Logger.getLogger(ForgetPassword.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } else if (password == null && otp != null) {
            try {
                userDao = new UserDao();
            } catch (Exception ex) {
                Logger.getLogger(ForgetPassword.class.getName()).log(Level.SEVERE, null, ex);
            }
            Cookie[] cookies = req.getCookies();
            for (Cookie c : cookies) {
                if ("email".equals(c.getName())) {
                    email = c.getValue();
                }
            }
            user = userDao.get(email);
            if (otp.equals(user.getOtp())) {
                req.setAttribute("step", 3);
                req.getRequestDispatcher("forgetpassword.jsp").forward(req, resp);
            } else {
                req.setAttribute("step", 2);
                req.setAttribute("otp", otp);
                req.getRequestDispatcher("forgetpassword.jsp").forward(req, resp);
            }
        } else if (password != null) {
            String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
            if(!password.matches(passwordRegex)) {
                req.setAttribute("step", 3);
                req.setAttribute("password", password);
                req.getRequestDispatcher("forgetpassword.jsp").forward(req, resp);
                return;
            }
            try {
                userDao = new UserDao();
            } catch (Exception ex) {
                Logger.getLogger(ForgetPassword.class.getName()).log(Level.SEVERE, null, ex);
            }
            Cookie[] cookies = req.getCookies();
            for (Cookie c : cookies) {
                if ("email".equals(c.getName())) {
                    email = c.getValue();
                }
            }
            user = userDao.get(email);
            user.setPassword(StringHelper.toSHA256(password));
            try {
                userDao = new UserDao();
                userDao.update(user);
            } catch (Exception ex) {
                Logger.getLogger(ForgetPassword.class.getName()).log(Level.SEVERE, null, ex);
            }
            //delete cookie email
            Cookie cookie = new Cookie("email", "");
            cookie.setMaxAge(0);
            resp.addCookie(cookie);
            resp.sendRedirect("login");
        }
    }

}
