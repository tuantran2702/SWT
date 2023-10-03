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

/**
 *
 * @author Mido
 */
@WebServlet(name="ChangePassword", urlPatterns={"/profile/changepassword"})
public class ChangePassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

        
        
        req.setAttribute("user", user);
        String check = (String) req.getAttribute("wrong-pass");
        if(check != null) {
            req.setAttribute("check", check);
        }
        req.getRequestDispatcher("../changepassword.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oldPass = req.getParameter("password");
        String newPass = req.getParameter("newpassword");
        String passRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
        if(!newPass.matches(passRegex)) {
            doGet(req, resp);
            return;
        }
        
        UserDao userDao = null;
        User user = null;
        Cookie[] cookies = req.getCookies();
        try {
            userDao = new UserDao();
            for (Cookie c : cookies) {
                if ("username".equals(c.getName())) {
                    user = userDao.getByUsername(c.getValue());
                    break;
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(Profile.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(!StringHelper.toSHA256(oldPass).equals(user.getPassword())) {
            req.setAttribute("wrong-pass", "1");
            doGet(req, resp);
            return;
        }
        user.setPassword(StringHelper.toSHA256(newPass));
        userDao.update(user);
        doGet(req, resp);
    }
    
    
   
    

}
