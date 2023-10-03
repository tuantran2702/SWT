/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.CategoryDao;
import dao.ProductDao;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Product;

/**
 *
 * @author Mido
 */
@WebServlet(name="Category", urlPatterns={"/category"})
public class CategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        if(type == null)
            type = "1";
        int id = Integer.parseInt(req.getParameter("id"));
        try {
            CategoryDao categoryDao = new CategoryDao();
            Category category = categoryDao.get(id);
            req.setAttribute("category", category);
            
        } catch (Exception ex) {
            Logger.getLogger(CategoryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String pageNumberString = req.getParameter("page_number");
        if(pageNumberString == null || pageNumberString.equals("")) pageNumberString="1";
        int pageNumber = Integer.parseInt(pageNumberString);
        List<Product> productList = new ArrayList<>();
        List<Product> productNewestList = new ArrayList<>();
        List<Product> productBestList = new ArrayList<>();
        int count=0;
        int numberOfProduct = 1;
        int numberOfPage = 0;
        try {
            ProductDao productDao = new ProductDao();
            count = productDao.getSizeByCategory(id);
            numberOfPage = (count-1)/numberOfProduct + 1;
            pageNumber = Integer.min(pageNumber, numberOfPage);
            if(count>0 && !type.equals("2"))
                productList = productDao.getByCategory(id, (pageNumber-1)*numberOfProduct, numberOfProduct);
            else if(count>0)
                productList = productDao.getByCategorySortById(id, (pageNumber-1)*numberOfProduct, numberOfProduct);
        } catch (Exception ex) {
            Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
        }
        req.setAttribute("product_list", productList);
        req.setAttribute("pageNumber", pageNumber);
        req.setAttribute("numberOfPage", numberOfPage);
        productList.sort((Product o1, Product o2) -> -Integer.compare(o1.getProductId(), o2.getProductId()));
        req.setAttribute("newest_product_list", productList);
        req.getRequestDispatcher("category.jsp").forward(req, resp);
                
    }
   
    

}
