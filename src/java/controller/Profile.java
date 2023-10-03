/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BaseDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Mido
 */
@WebServlet(name = "Profile", urlPatterns = {"/profile"})
@MultipartConfig
public class Profile extends HttpServlet {
    public static void main(String[] args) {
    }
    String getFile(String name, HttpServletRequest req) throws IOException, ServletException {
        String filePath = "C:\\Users\\Mido\\Documents\\NetBeansProjects\\MidoShop\\web\\img\\";
        Part filePart = req.getPart(name);
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        if (fileName == null || fileName.length() == 0) {
            return "";
        }
        InputStream fileContent = filePart.getInputStream();

        File f = new File(filePath + fileName);
        OutputStream os = new FileOutputStream(f);
        byte[] buf = new byte[1024];
        int len;
        while ((len = fileContent.read(buf)) > 0) {
            os.write(buf, 0, len);
        }
        os.close();
        fileContent.close();

        return "img/" + fileName;
    }

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

        req.getRequestDispatcher("profile.jsp").forward(req, resp);
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

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String day = req.getParameter("day");
        if (day.length() == 1) {
            day = "0" + day;
        }
        String month = req.getParameter("month");
        if (month.length() == 1) {
            month = "0" + month;
        }
        String year = req.getParameter("year");
        String dob = year + "-" + month + "-" + day;
        int gender;
        try {
            gender = Integer.parseInt(req.getParameter("gender"));
        } catch (Exception e) {
            gender = -1;
        }
        String phoneNumber = req.getParameter("phonenumber");
        String image =  getFile("file", req);
        if((user.getEmail()==null || !user.getEmail().equals(email)) && userDao.get(email)!=null) {
            req.setAttribute("name", name);
            req.setAttribute("address", address);
            req.setAttribute("phoneNumber", phoneNumber);
            req.setAttribute("email", email==null?"":email);
            doGet(req, resp);
            return;
        }
        user.setAddress(address);
        user.setEmail(email);
        user.setDob(dob);
        user.setFullName(name);
        user.setGender(gender);
        user.setTelephone(phoneNumber);
        if(!image.equals(""))
            user.setImg(image);
        try {
            userDao.update(user);
        } catch (Exception ex) {
            Logger.getLogger(Profile.class.getName()).log(Level.SEVERE, null, ex);
        }
        Cookie ck = new Cookie("image", user.getImg());
        ck.setMaxAge(10000);
        resp.addCookie(ck);
        doGet(req, resp);
    }

}
