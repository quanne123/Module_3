package com.example.calculatorsimple;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String operator = request.getParameter("operator");
        double S1 = Double.valueOf(request.getParameter("firstNumber"));
        double S2 = Double.valueOf(request.getParameter("secondNumber"));
        double result = 0;
        String mess = "";
        if (operator == "") {
        operator = null;
        }
        switch (operator){
            case "cong":

                if (S1 != 0 && S2 != 0){
                    result =  (S1 + S2);
                }else {
                    result = 0;
                }
                break;
            case "tru" :
                result = S1 - S2;
                break;
            case "nhan" :
                result = S1 * S2;
            case "chia" :
                if (S2 == 0) {
                    mess = "Error, Can't divide 0";
                }else {
                    result = S1 / S2;
                }
                break;

        }
        request.setAttribute("result",result);
        request.setAttribute("mess",mess);

        request.getRequestDispatcher("index.jsp").forward(request,response);


    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}