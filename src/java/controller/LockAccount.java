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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Mido
 */
@WebServlet(name = "LockAccount", urlPatterns = {"/admin/lockaccount"})
public class LockAccount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("../lockaccount.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String unlockUsername = req.getParameter("unlock_username");
        try {
            UserDao userDao = new UserDao();
            User user = userDao.getByUsername(username);
            if (user == null) {
                req.setAttribute("username", username);
            } else {

                if (user.getIsActive() == 1) {
                    req.setAttribute("username", username);
                    req.setAttribute("active", "no");
                } else if(user.getRole()==2) {
                    req.setAttribute("username", username);
                    req.setAttribute("admin", "yes");
                } else {
                    user.setIsActive(1);
                    userDao.update(user);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(LockAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        req.getRequestDispatcher("../lockaccount.jsp").forward(req, resp);
    }

}
