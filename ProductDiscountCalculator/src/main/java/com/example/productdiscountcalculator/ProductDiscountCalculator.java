package com.example.productdiscountcalculator;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "ProductDiscountCalculator", value = "/ProductDiscountCalculator")
public class ProductDiscountCalculator extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productDescription = req.getParameter("Product-Description");
        double listPrice = Double.parseDouble(req.getParameter("List-Price"));
        double discountPercent = Double.parseDouble(req.getParameter("Discount-Percent"));

        double discountAmount = listPrice * discountPercent * 0.01;
        req.setAttribute("DiscountAmount",discountAmount);
        req.setAttribute("productDescription",productDescription);


        req.getRequestDispatcher("/DiscountPrice.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}