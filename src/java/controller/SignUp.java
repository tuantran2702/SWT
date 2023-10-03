/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CartDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.User;
import utility.Captcha;
import utility.StringHelper;

/**
 *
 * @author Mido
 */
@WebServlet(name="SignUp", urlPatterns={"/signup"})
public class SignUp extends HttpServlet {
    
   
   @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try {
           UserDao userDao = new UserDao();
           req.setAttribute("userList", userDao.getAll());
       } catch (Exception ex) {
           Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
       }
        req.getRequestDispatcher("signup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String password = req.getParameter("password");
        String username = req.getParameter("username");
        String token = req.getParameter("captcha-response");
        boolean checkToken = Captcha.checkToken(token);
        String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
        String usernameRegex = "^[a-zA-Z0-9]{4,}$";
        if(!checkToken || !password.matches(passwordRegex) || !username.matches(usernameRegex)) {
            doGet(req, resp);
            return; 
        }
        int role = 1;
        
        try {
            UserDao userDao = new UserDao();
            if(userDao.getByUsername(username)!=null) {
                req.setAttribute("username", username);
                doGet(req, resp);
                return;
            }
            User user = new User(0, username, StringHelper.toSHA256(password), null, null, null, "img/default.jpg", role, null, null, null, -1, null, 0);
            userDao.insert(user);
            CartDao cartDao = new CartDao();
            cartDao.insert(new Cart(0, userDao.getByUsername(username).getUserID(), 0));
        } catch (Exception ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        resp.sendRedirect("login");
    }

}
