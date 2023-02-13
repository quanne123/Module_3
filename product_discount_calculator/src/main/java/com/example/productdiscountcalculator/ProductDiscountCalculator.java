package com.example.productdiscountcalculator;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "ProductDiscountCalculator", value = "/product-discount-calculator")
public class ProductDiscountCalculator extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productDescription = req.getParameter("product_description");
        double listPrice = Double.parseDouble(req.getParameter("list_price"));
        double discountPercent = Double.parseDouble(req.getParameter("discount_percent"));

        double discountAmount = listPrice * discountPercent * 0.01;
        req.setAttribute("discountAmount",discountAmount);
        req.setAttribute("productDescription",productDescription);


        req.getRequestDispatcher("/discount_price.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}