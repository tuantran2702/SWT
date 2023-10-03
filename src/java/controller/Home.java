/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CategoryDao;
import dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Product;

/**
 *
 * @author Mido
 */
@WebServlet(name="Mido", urlPatterns={""})
public class Home extends HttpServlet {
    public int compareWith(Product p1, Product p2){
        if(p1.getWeight() > p2.getWeight()){
            return -1;
        }else if(p1.getWeight() == p2.getWeight()){
            return 0;
        }else {
            return 1;
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> productList = new ArrayList<>();
        try {
            ProductDao productDao = new ProductDao();
            productList = productDao.getAll();
            
        } catch (Exception ex) {
            Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
        }
        productList.sort((t, t1) -> {
            return compareWith(t, t1);
        });
        List<Category> categoryList = new ArrayList<>();
        try {
            CategoryDao categoryDao = new CategoryDao();
            categoryList = categoryDao.getByParent(0);
        } catch (Exception e) {
        }
        req.setAttribute("product_list", productList);
        req.setAttribute("categoryList", categoryList);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

}
