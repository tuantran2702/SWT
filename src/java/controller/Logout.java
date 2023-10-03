/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Mido
 */
@WebServlet(name = "Logout", urlPatterns = {"/logout"})
public class Logout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.removeAttribute("user");
        Cookie ck = new Cookie("account", "");
        ck.setMaxAge(0);
        resp.addCookie(ck);
        ck = new Cookie("username", "");
        ck.setMaxAge(0);
        resp.addCookie(ck);
        ck = new Cookie("cart_number", "");
        ck.setMaxAge(0);
        resp.addCookie(ck);
        resp.sendRedirect("/mido");
    }

}
