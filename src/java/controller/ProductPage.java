/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDao;
import dao.ProductDao;
import dao.ProductDetailDao;
import dao.RateDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import model.Category;
import model.ProductDetail;
import utility.StringHelper;

/**
 *
 * @author Mido
 */
@WebServlet(name = "Product", urlPatterns = {"/product"})
public class ProductPage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productID = Integer.parseInt(req.getParameter("id"));
        
        ProductDao productDao = null;
        CategoryDao categoryDao = null;
        Product product = null;
        Category category = null;
        ProductDetail productDetail = null;
        RateDao rateDao = null;
        try {
            rateDao = new RateDao();
            req.setAttribute("no_of_voting", rateDao.getNumberOfVoting(productID));
            productDao = new ProductDao();
            categoryDao = new CategoryDao();
            product = productDao.get(productID);
            category = categoryDao.get(product.getCategoryID());
            ProductDetailDao productDetailDao = new ProductDetailDao();
            productDetail = productDetailDao.getByProductID(productID);
            productDao.updatView(productID);
            req.setAttribute("quantity", productDetailDao.getQuantity(productDetail.getId()));
        } catch (Exception ex) {
            Logger.getLogger(ProductPage.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<String> groupNameList1 = new ArrayList<>();
        if (productDetail.getSubgroupName1() != null && !productDetail.getSubgroupName1().equals("")) {
            String[] s = productDetail.getSubgroupValue1().split("\\|");
            req.setAttribute("subgroupvalue1", s);
        }
        if (productDetail.getSubgroupName2() != null && !productDetail.getSubgroupName2().equals("")) {
            String[] s = productDetail.getSubgroupValue2().split("\\|");
            req.setAttribute("subgroupvalue2", s);

        }
        double rate = product.getRate();
        if(rate>0)
            rate = rateDao.getProductRate(productID);
        for (int x = 0; x < 50; x += 1) {
            if (x >= rate*10) {
                rate = (double)x/10;
                break;
            }
        }
        int starPercent1 = Math.min((int) (rate / 1) * 100, 100);

        int starPercent2 = Math.min((int) (Math.max(rate - 1, 0) * 100), 100);
        int starPercent3 = Math.min((int) (Math.max(rate - 2, 0) * 100), 100);
        int starPercent4 = Math.min((int) (Math.max(rate - 3, 0) * 100), 100);
        int starPercent5 = Math.min((int) (Math.max(rate - 4, 0) * 100), 100);

        req.setAttribute("starPercent1", starPercent1);
        req.setAttribute("starPercent2", starPercent2);
        req.setAttribute("starPercent3", starPercent3);
        req.setAttribute("starPercent4", starPercent4);
        req.setAttribute("starPercent5", starPercent5);

        double[] price = StringHelper.getDoubleArr(productDetail.getPrice(), "\\|");
        int[] quantity = StringHelper.getIntArr(productDetail.getQuantity(), "\\|");
        String[] imageArr = productDetail.getSubgroupImage1().split("\\|");
        
        req.setAttribute("rate", rate);
        req.setAttribute("priceArr", price);
        req.setAttribute("quantityArr", quantity);
        req.setAttribute("imageArr", imageArr);
        req.setAttribute("product", product);
        req.setAttribute("category", category);
        req.setAttribute("productdetail", productDetail);

        req.getRequestDispatcher("product.jsp").forward(req, resp);
    }

}
