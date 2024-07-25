/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.StudentMana;

import Controller.nuocSv;
import Dao.WaterDAO;
import Model.water;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tranm
 */
@WebServlet(name = "WaterImport", urlPatterns = {"/waterimport"})
public class WaterImport extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        if (roomId != null || usageType != null || semester != null || meterNumber != null) {
            request.setAttribute("data1", dataWater);
        }

        request.setAttribute("rooms", rooms);
        request.setAttribute("semesters", semesters);
        request.setAttribute("meters", meters);
        try {
            WaterDAO wat = new WaterDAO();
            List<water> ww = wat.getAll();
            request.setAttribute("data1", ww);
            request.getRequestDispatcher("studentMana/water.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(nuocSv.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
