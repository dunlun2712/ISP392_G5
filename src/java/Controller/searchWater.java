/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.WaterDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Model.water;

/**
 *
 * @author DELL
 */
@WebServlet(name = "searchWater", urlPatterns = {"/searchWater"})
public class searchWater extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        String roomId = request.getParameter("room_id");
        String usageType = request.getParameter("usage_type");
        String semester = request.getParameter("semester");
        String meterNumber = request.getParameter("meter_number");

        WaterDAO waterDAO = new WaterDAO();
        List<water> dataWater = waterDAO.searchByNameWater(roomId, usageType, semester, meterNumber);

        // Populate dropdown options
        List<String> rooms = waterDAO.getAllRooms();
        List<String> semesters = waterDAO.getAllSemesters();
        List<String> meters = waterDAO.getAllMeters();

        request.setAttribute("data1", dataWater);
        request.setAttribute("rooms", rooms);
        request.setAttribute("semesters", semesters);
        request.setAttribute("meters", meters);
       if(action!=null && action.equals("admin")){
            request.getRequestDispatcher("admin/water.jsp").forward(request, response);
       }
        request.getRequestDispatcher("studentMana/water.jsp").forward(request, response);
    }


}
