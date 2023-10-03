/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDao;
import dao.ProductDetailDao;
import dao.CategoryDao;
import dao.OrderDetailDao;
import dao.UserDao;
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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.OrderDetail;
import model.Product;
import model.ProductDetail;

/**
 *
 * @author Mido
 */
@WebServlet(name = "UpdateProduct", urlPatterns = {"/admin/updateproduct"})
@MultipartConfig
public class UpdateProduct extends HttpServlet {

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

    String getGroupString(String name, HttpServletRequest req) {
        String[] s = req.getParameterValues(name);
        String groupString = "";
        for (String string : s) {
            if (string == null || string.equals("")) {
                string = "null";
            }
            groupString += string + "|";
        }
        groupString = groupString.substring(0, groupString.length() - 1);
        return groupString;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        if (type.equals("1")) {
            String id = req.getParameter("id");
            if (id == null) {
                req.getRequestDispatcher("../updateproduct1.jsp").forward(req, resp);
            } else {
                req.setAttribute("id", id);
                try {
                    ProductDao productDao = new ProductDao();
                    Product product = productDao.get(Integer.parseInt(id));
                    if (product == null) {
                        req.getRequestDispatcher("../updateproduct1.jsp").forward(req, resp);
                        return;
                    }
                    ProductDetailDao productDetailDao = new ProductDetailDao();
                    ProductDetail productDetail = productDetailDao.getByProductID(product.getProductId());
                    String[] value1 = productDetail.getSubgroupValue1().split("\\|");
                    for (int i = 0; i < value1.length; i++) {
                        if (value1[i].equals("null")) {
                            value1[i] = "";
                        }
                    }
                    String[] value2 = productDetail.getSubgroupValue2().split("\\|");
                    for (int i = 0; i < value2.length; i++) {
                        if (value2[i].equals("null")) {
                            value2[i] = "";
                        }
                    }
                    String[] subPrice = productDetail.getPrice().split("\\|");
                    for (int i = 0; i < subPrice.length; i++) {
                        if (subPrice[i].equals("null")) {
                            subPrice[i] = "";
                        }
                    }
                    String[] subQuantity = productDetail.getQuantity().split("\\|");
                    for (int i = 0; i < subPrice.length; i++) {
                        if (subPrice[i].equals("null")) {
                            subPrice[i] = "0";
                        }
                    }
                    CategoryDao categoryDao = new CategoryDao();
                    List<Category> categoryList = categoryDao.getAll();
                    int quantity = productDetailDao.getQuantity(productDetail.getId());
                    int price = (int) product.getPrice();
                    req.setAttribute("quantity", quantity);
                    req.setAttribute("price", price);
                    req.setAttribute("categoryList", categoryList);
                    req.setAttribute("value1", value1);
                    req.setAttribute("value2", value2);
                    req.setAttribute("subPrice", subPrice);
                    req.setAttribute("subQuantity", subQuantity);
                    req.setAttribute("product", product);
                    req.setAttribute("productDetail", productDetail);

                } catch (Exception ex) {
                    Logger.getLogger(UpdateProduct.class.getName()).log(Level.SEVERE, null, ex);
                }
                req.getRequestDispatcher("../updateproduct2.jsp").forward(req, resp);
            }
        } else {

            req.getRequestDispatcher("../updateproduct1.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int type = Integer.parseInt(req.getParameter("type"));
        if (type == 1) {
            int id = Integer.parseInt(req.getParameter("productid"));
            String productName = req.getParameter("product_name");
            String productDesc = req.getParameter("product_desc");
            int categoryID = Integer.parseInt(req.getParameter("category"));
            String brand = req.getParameter("brand");
            String country = req.getParameter("country");
            double price = Double.parseDouble(req.getParameter("price"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            try {
                ProductDao productDao = new ProductDao();
                Product product = productDao.get(id);
                ProductDetailDao productDetailDao = new ProductDetailDao();
                ProductDetail productDetail = productDetailDao.getByProductID(id);

                String subgroupName1 = req.getParameter("subgroup_name1");
                String subgroupName2 = req.getParameter("subgroup_name2");
                String subgroupValue1 = getGroupString("subgroup_value1", req);
                String subgroupValue2 = getGroupString("subgroup_value2", req);
                String subgroupPrice = getGroupString("subgroup_price", req);
                String subgroupQuantity = getGroupString("subgroup_quantity", req);
                String fileName1 = getFile("subgroup_image1", req);
                if (fileName1.equals("")) {
                    fileName1 = productDetail.getSubgroupImage1().split("\\|")[0];
                }
                String fileName2 = getFile("subgroup_image2", req);
                if (fileName2.equals("")) {
                    fileName2 = productDetail.getSubgroupImage1().split("\\|")[1];
                }
                String fileName3 = getFile("subgroup_image3", req);
                if (fileName3.equals("")) {
                    fileName3 = productDetail.getSubgroupImage1().split("\\|")[2];
                }
                String fileName4 = getFile("subgroup_image4", req);
                if (fileName4.equals("")) {
                    fileName4 = productDetail.getSubgroupImage1().split("\\|")[3];
                }
                String fileName = fileName1 + "|" + fileName2 + "|" + fileName3 + "|" + fileName4;

                String image = getFile("image", req);

                product.setProductName(productName);
                product.setDesc(productDesc);
                product.setBrand(brand);
                product.setCategoryID(categoryID);
                product.setCountry(country);
                if (!image.equals("")) {
                    product.setImage(image);
                }
                product.setPrice(price);
                product.setQuantity(quantity);
                productDao.update(product);

                productDetail.setPrice(subgroupPrice);
                productDetail.setQuantity(subgroupQuantity);
                productDetail.setSubgroupImage1(fileName);
                productDetail.setSubgroupName1(subgroupName1);
                productDetail.setSubgroupName2(subgroupName2);
                productDetail.setSubgroupValue1(subgroupValue1);
                productDetail.setSubgroupValue2(subgroupValue2);
                productDetailDao.update(productDetail);

                resp.sendRedirect("/mido/admin/updateproduct?type=1&id=" + product.getProductId());

            } catch (Exception ex) {
                Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            try {
                String id = req.getParameter("id");

                ProductDao productDao = new ProductDao();
                Product product = productDao.get(Integer.parseInt(id));
                if (product == null) {
                    req.setAttribute("id", id);
                    req.getRequestDispatcher("../updateproduct1.jsp").forward(req, resp);
                    return;
                }
                OrderDetailDao orderDetailDao = new OrderDetailDao();
                List<OrderDetail> orderDetails = orderDetailDao.getAllByProductId(Integer.parseInt(id));
                if(!orderDetails.isEmpty()) {
                    req.setAttribute("productid", id);
                    req.getRequestDispatcher("../updateproduct1.jsp").forward(req, resp);
                    return;
                }
                
                ProductDetailDao productDetailDao = new ProductDetailDao();
                ProductDetail productDetail = productDetailDao.getByProductID(Integer.parseInt(id));
                
                productDetailDao.delete(productDetail.getId());
                productDao.delete(Integer.parseInt(id));
                req.getRequestDispatcher("../updateproduct1.jsp").forward(req, resp);

            } catch (Exception e) {
            }

        }

    }

}
