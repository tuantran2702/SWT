/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CategoryDao;
import dao.ProductDao;
import dao.ProductDetailDao;
import java.io.IOException;
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
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Product;
import model.ProductDetail;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.*;

/**
 *
 * @author Mido
 */
@WebServlet(name="AddProduct", urlPatterns={"/admin/addproduct"})
@MultipartConfig
public class AddProduct extends HttpServlet {
    String getFile(String name, HttpServletRequest req) throws IOException, ServletException {
        String filePath = "C:\\Users\\Mido\\Documents\\NetBeansProjects\\MidoShop\\web\\img\\";
        Part filePart = req.getPart(name);
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        if(fileName == null || fileName.length()==0)
            return "";
        InputStream fileContent = filePart.getInputStream();
        
        File f = new File(filePath+fileName);
        OutputStream os = new   FileOutputStream(f);
        byte[] buf = new byte[1024];
        int len;
        while ((len = fileContent.read(buf)) > 0) {
            os.write(buf, 0, len);
        }
        os.close();
        fileContent.close();
        
        return "img/"+fileName;
    }
    
    String getGroupString(String name, HttpServletRequest req) {
        String[] s = req.getParameterValues(name);
        String groupString = "";
        for(String string: s) {
            if(string == null || string.equals(""))
                string = "null";
            groupString += string + "|";
        }
        groupString = groupString.substring(0, groupString.length()-1);
        return groupString;
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
        req.getRequestDispatcher("../addproduct.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName = req.getParameter("product_name");
        String productDesc = req.getParameter("product_desc");
        int categoryID =  Integer.parseInt(req.getParameter("category"));
        String brand = req.getParameter("brand");
        String country = req.getParameter("country");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        
        String subgroupName1 = req.getParameter("subgroup_name1");
        String subgroupName2 = req.getParameter("subgroup_name2");
        String subgroupValue1 = getGroupString("subgroup_value1", req);
        String subgroupValue2 = getGroupString("subgroup_value2", req);
        String subgroupPrice = getGroupString("subgroup_price", req);
        String subgroupQuantity = getGroupString("subgroup_quantity", req);
        String fileName1 = getFile("subgroup_image1", req);
        if(fileName1==null || fileName1.equals(""))
            fileName1="null";
        String fileName2 = getFile("subgroup_image2", req);
        if(fileName2==null || fileName2.equals(""))
            fileName2="null";
        String fileName3 = getFile("subgroup_image3", req);
        if(fileName3==null || fileName3.equals(""))
            fileName3="null";
        String fileName4 = getFile("subgroup_image4", req);
        if(fileName4==null || fileName4.equals(""))
            fileName4="null";
        String fileName = fileName1 + "|" + fileName2 + "|" + fileName3 + "|" + fileName4;
        
        try {
            ProductDao productDao = new ProductDao();
            productDao.insert(new Product(0, null, productName, price, 0, productDesc, getFile("image", req), categoryID, 1, 1, 1, 0, brand, country, quantity));
            int productID = productDao.getProductID();
            ProductDetailDao productDetailDao = new ProductDetailDao();
            productDetailDao.insert(new ProductDetail(0, productID, subgroupName1, subgroupName2, subgroupValue1, subgroupValue2, fileName, subgroupPrice, subgroupQuantity));
        } catch (Exception ex) {
            Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        doGet(req, resp);

    }
}
