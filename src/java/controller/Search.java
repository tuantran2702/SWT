/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author Mido
 */
@WebServlet(name="search", urlPatterns={"/search"})
public class Search extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        if(type == null)
            type = "1";
        String keyword = req.getParameter("keyword");
        String pageNumberString = req.getParameter("page_number");
        if(pageNumberString == null || pageNumberString.equals("")) pageNumberString="1";
        int pageNumber = Integer.parseInt(pageNumberString);
        keyword = "%" + keyword + "%";
        List<Product> productList = new ArrayList<>();
        List<Product> productNewestList = new ArrayList<>();
        List<Product> productBestList = new ArrayList<>();
        int count=0;
        int numberOfProduct = 1;
        int numberOfPage = 0;
        try {
            ProductDao productDao = new ProductDao();
            
            count = productDao.getSizeByName(keyword);
            numberOfPage = (count-1)/numberOfProduct + 1;
            pageNumber = Integer.min(pageNumber, numberOfPage);
            if(count>0 && !type.equals("2"))
                productList = productDao.getByName(keyword, (pageNumber-1)*numberOfProduct, numberOfProduct);
            else if(count>0)
                productList = productDao.getByNameSortById(keyword, (pageNumber-1)*numberOfProduct, numberOfProduct);
        } catch (Exception ex) {
            Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        req.setAttribute("product_list", productList);
        req.setAttribute("pageNumber", pageNumber);
        req.setAttribute("numberOfPage", numberOfPage);
        req.getRequestDispatcher("search.jsp").forward(req, resp);
    }
}
