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
import java.util.ArrayList;
import java.util.List;
import model.CartDetail;
import dao.CartDao;
import dao.CartDetailDao;
import dao.ProductDao;
import dao.ProductDetailDao;
import dao.UserDao;
import jakarta.servlet.http.Cookie;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import model.ProductDetail;
import model.User;
import utility.StringHelper;

/**
 *
 * @author Mido
 */
@WebServlet(name = "OrderConfirm", urlPatterns = {"/orderconfirm"})
public class OrderConfirm extends HttpServlet {

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
        
        List<CartDetail> cartDetails = (ArrayList<CartDetail>) req.getAttribute("cartdetail_list");
        String[] valueArr = new String[cartDetails.size()];
        String[] imgArr = new String[cartDetails.size()];
        double[] priceArr = new double[cartDetails.size()];
        String[] priceArrString = new String[cartDetails.size()];
        String[] oldPriceArrString = new String[cartDetails.size()];
        double[] totalPriceArr = new double[cartDetails.size()];
        String[] totalPriceStringArr = new String[cartDetails.size()];
        int[] quantityArr = new int[cartDetails.size()];
        int[] maxQuantityArr = new int[cartDetails.size()];
        Product[] products = new Product[cartDetails.size()];
        int[] index1Arr = new int[cartDetails.size()];
        int[] index2Arr = new int[cartDetails.size()];
        double total = 0;
        String totalString = "";
        try {
            for (int i = 0; i < cartDetails.size(); i++) {
                CartDetail cartDetail = cartDetails.get(i);
                quantityArr[i] = cartDetail.getQuantity();
                int index1 = cartDetail.getIndex1();
                int index2 = cartDetail.getIndex2();
                index1Arr[i] = index1;
                index2Arr[i] = index2;
                int productID = cartDetail.getProductID();
                ProductDao productDao = new ProductDao();
                Product product = productDao.get(productID);
                products[i] = product;

                ProductDetailDao productDetailDao = new ProductDetailDao();
                ProductDetail productDetail = productDetailDao.getByProductID(productID);
                if (index1 != -1) {
                    String s = productDetail.getSubgroupValue1().split("\\|")[index1];
                    if (!s.equals("null")) {
                        valueArr[i] = s;
                    }
                }
                if (index2 != -1) {
                    String s = productDetail.getSubgroupValue2().split("\\|")[index2];
                    if (!s.equals("null")) {
                        valueArr[i] += ", " + s;
                    }
                }

                String[] images = productDetail.getSubgroupImage1().split("\\|");
                if (index1 == -1 || images[index1].equals("null")) {
                    imgArr[i] = product.getImage();
                } else {
                    imgArr[i] = images[index1];
                }
                int[] maxQuantities = StringHelper.getIntArr(productDetail.getQuantity(), "\\|");
                if (index1 == -1) {
                    maxQuantityArr[i] = product.getQuantity();
                } else if (index2 == -1) //se la index1 thay vi index1*4 neu add product chi nhap subgroup1
                {
                    maxQuantityArr[i] = maxQuantities[index1 * 4];
                } else {
                    maxQuantityArr[i] = maxQuantities[index1 * 4 + index2];
                }
                double[] prices = StringHelper.getDoubleArr(productDetail.getPrice(), "\\|");
                if (index1 == -1 && index2 == -1) {
                    priceArr[i] = product.getPrice();

                } else if (index2 == -1) {
                    //se la index1 thay vi index1*4 neu add product chi nhap subgroup1
                    priceArr[i] = prices[index1 * 4];
                } else {
                    priceArr[i] = prices[index1 * 4 + index2];
                }
                priceArrString[i] = StringHelper.getPriceString(priceArr[i]);
                oldPriceArrString[i] = StringHelper.getPriceString(priceArr[i] * 1.2);
                totalPriceArr[i] = priceArr[i] * quantityArr[i];
                totalPriceStringArr[i] = StringHelper.getPriceString(totalPriceArr[i]);
                total += totalPriceArr[i];
            }
        } catch (Exception e) {
        }
        totalString = StringHelper.getPriceString(total);

        req.setAttribute("cartDetails", cartDetails);
        req.setAttribute("total", total);
        req.setAttribute("totalString", totalString);
        req.setAttribute("priceArr", priceArr);
        req.setAttribute("priceStringArr", priceArrString);
        req.setAttribute("oldPriceStringArr", oldPriceArrString);
        req.setAttribute("totalPriceArr", totalPriceArr);
        req.setAttribute("totalPriceStringArr", totalPriceStringArr);
        req.setAttribute("imageArr", imgArr);
        req.setAttribute("quantityArr", quantityArr);
        req.setAttribute("maxQuantityArr", maxQuantityArr);
        req.setAttribute("valueArr", valueArr);
        req.setAttribute("productArr", products);
        req.setAttribute("index1Arr", index1Arr);
        req.setAttribute("index2Arr", index2Arr);
        
        req.getRequestDispatcher("orderconfirm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] cartDetailIdStringArr = req.getParameter("cartdetail_id").split("\\|");

        List<CartDetail> cartDetails = new ArrayList<>();
        CartDetailDao cartDetailDao = null;

        for (String s : cartDetailIdStringArr) {
            try {
                cartDetailDao = new CartDetailDao();
            } catch (Exception ex) {
                Logger.getLogger(OrderConfirm.class.getName()).log(Level.SEVERE, null, ex);
            }
            cartDetails.add(cartDetailDao.get(Integer.parseInt(s)));
        }
        req.setAttribute("cartdetail_list", cartDetails);
        doGet(req, resp);

    }

}
