/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import Dao.WaterDAO;
import Model.water;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author tranm
 */
@WebServlet(name = "searchWaterByRoomId", urlPatterns = {"/searchwaterbyid"})
public class searchWaterByRoomId extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("search").trim();
        WaterDAO ws = new WaterDAO();
        List<water> w = ws.searchById(search);
        request.setAttribute("data", w);
        request.setAttribute("search", search);
        request.getRequestDispatcher("update/listWater.jsp").forward(request, response);
    }

}
