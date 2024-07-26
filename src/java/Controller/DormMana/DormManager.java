/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.DormMana;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author tranm
 *
 *
 * href : dormmanger
 */
public class DormManager extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String function = request.getParameter("function");

        if (function != null) {
            switch (function) {
                case "dorm":
                    
                    response.sendRedirect("managerbooking");
                    break;
                case "item":
                    response.sendRedirect("listItems");
                    break;
                case "request":
                    response.sendRedirect("accresponse");
                    break;
                case "elec":
                    response.sendRedirect("elecimport");
                    break;
                case "water":
                    response.sendRedirect("waterimport");
                    break;
                case "pass":
                    response.sendRedirect("accpass");
                    break;
            }
        } else {
            request.getRequestDispatcher("studentMana/managerview.jsp").forward(request, response);
        }
        // 

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String function = request.getParameter("function");

    }

}
