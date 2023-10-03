/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CategoryDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author Mido
 */
@WebServlet(name="UpdateCategory", urlPatterns={"/admin/updatecategory"})
@MultipartConfig
public class UpdateCategory extends HttpServlet {
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
        List<Category> categoryList = new ArrayList<>();
        try {
            CategoryDao categoryDao = new CategoryDao();
            categoryList = categoryDao.getAll();
        } catch (Exception e) {
        }
        req.setAttribute("categoryList", categoryList);
        req.getRequestDispatcher("../updatecategory.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int oldCategoryId = Integer.parseInt(req.getParameter("old-category"));
        String categoryName = req.getParameter("name");
        String image = getFile("file", req);
        if(categoryName==null || "".equals(categoryName)) {
            doGet(req, resp);
            return;
        }
        try {
            CategoryDao categoryDao = new CategoryDao();
            Category category = categoryDao.get(oldCategoryId);
            category.setName(categoryName);
            if(!image.equals(""))
                category.setImage(image);
            categoryDao.update(category);
        } catch (Exception ex) {
            Logger.getLogger(AddCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        doGet(req, resp);
    }
    
    
   
    
}
