package com.example.tudiendongian;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

//@WebServlet(name = "TranslateServlet", value = "/translate")
//public class TranslateServlet extends HttpServlet {

//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        Map<String, String> dictionary = new HashMap<>();
//        dictionary.put("Hello", "Xin chào");
//        dictionary.put("How", "Thế nào");
//        dictionary.put("book", "Quyển vở");
//        dictionary.put("computer", "Máy tính");
//
//        String search = req.getParameter("txtSearch");
//        PrintWriter writer = resp.getWriter();
//        writer.println("<html>");
//
//        String result = dictionary.get(search);
//        if (result != null) {
//            writer.println("Word: " + search);
//            writer.println("Result: " + result);
//        } else {
//            writer.println("Not found");
//        }
//        writer.println("</html>");
//    }
//
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//    }
//}