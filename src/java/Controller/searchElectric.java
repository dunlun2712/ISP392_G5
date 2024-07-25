package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import Dao.ElectricDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Model.electric;

/**
 *
 * @author DELL
 */
@WebServlet(urlPatterns={"/searchServlet"})
public class searchElectric extends HttpServlet {
  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String action = request.getParameter("action");
        String roomId = request.getParameter("room_id");
        String usageType = request.getParameter("usage_type");
        String semester = request.getParameter("semester");
        String meterNumber = request.getParameter("meter_number");

        ElectricDAO electricDAO = new ElectricDAO();
        List<electric> data = electricDAO.searchByNameElec(roomId, usageType, semester, meterNumber);

        // Populate dropdown options
        List<String> rooms = electricDAO.getAllRooms();
        List<String> semesters = electricDAO.getAllSemesters();
        List<String> meters = electricDAO.getAllMeters();

        request.setAttribute("data", data);
        request.setAttribute("rooms", rooms);
        request.setAttribute("semesters", semesters);
        request.setAttribute("meters", meters);
       
        if(action!=null && action.equals("admin")){
            request.getRequestDispatcher("admin/electric.jsp").forward(request, response);
       }
       
        request.getRequestDispatcher("studentMana/elec.jsp").forward(request, response);
    } 


}
