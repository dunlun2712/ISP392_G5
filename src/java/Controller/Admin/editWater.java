/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Admin;

import Dao.WaterDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import Model.water;

/**
 *
 * @author DELL
 */
@WebServlet(name="editWater", urlPatterns={"/editWater"})
public class editWater extends HttpServlet {
   
 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("water_id"));
        WaterDAO dao = new WaterDAO();
        water water = dao.getWaterById(id);
        request.setAttribute("water", water);
        request.getRequestDispatcher("update/ed.jsp").forward(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        water water = new water();
        water.setWater_id(Integer.parseInt(request.getParameter("water_id")));
        water.setRoom_id(request.getParameter("room_id"));
        water.setUsage_type(request.getParameter("usage_type"));
        water.setCreation_date(Date.valueOf(request.getParameter("creation_date")));
        water.setExpiration_date(Date.valueOf(request.getParameter("expiration_date")));
        water.setSemester(request.getParameter("semester"));
        water.setMeter_number(request.getParameter("meter_number"));
        water.setNew_reading(Double.valueOf(request.getParameter("new_reading")));
        water.setOld_reading(Double.valueOf(request.getParameter("old_reading")));
        water.setConsumption(Double.valueOf(request.getParameter("consumption")));

        WaterDAO dao = new WaterDAO();
        dao.updateWater(water);
        response.sendRedirect("readWater");
    }


}
