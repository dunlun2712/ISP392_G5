/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import Dao.ElecDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import Model.electric;

/**
 *
 * @author DELL
 */
@WebServlet(name = "editElectric", urlPatterns = {"/editElectric"})
public class editElectric extends HttpServlet {


    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("electricity_id"));
        ElecDAO dao = new ElecDAO();
        electric electric = dao.getElectricById(id);
        request.setAttribute("electric", electric);
        request.getRequestDispatcher("update/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        electric electric = new electric();
        electric.setElectricity_id(Integer.parseInt(request.getParameter("electricity_id")));
        electric.setRoom_id(request.getParameter("room_id"));
        electric.setUsage_type(request.getParameter("usage_type"));
        electric.setCreation_date(Date.valueOf(request.getParameter("creation_date")));
        electric.setExpiration_date(Date.valueOf(request.getParameter("expiration_date")));
        electric.setSemester(request.getParameter("semester"));
        electric.setMeter_number(request.getParameter("meter_number"));
        electric.setConsumption(Double.valueOf(request.getParameter("consumption")));
        electric.setOld_number(Double.valueOf(request.getParameter("old_number")));
        electric.setNew_number(Double.valueOf(request.getParameter("new_number")));

        ElecDAO dao = new ElecDAO();
        dao.updateElectric(electric);
        response.sendRedirect("elec");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
