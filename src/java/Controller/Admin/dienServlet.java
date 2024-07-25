package Controller.Admin;

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
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.electric;

/**
 *
 * @author DELL
 */
@WebServlet(urlPatterns = {"/dienServlet"})
public class dienServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String roomId = request.getParameter("room_id");
        String usageType = request.getParameter("usage_type");
        String semester = request.getParameter("semester");
        String meterNumber = request.getParameter("meter_number");

        ElectricDAO electricDAO = new ElectricDAO();
        List<electric> data1 = electricDAO.searchByNameElec(roomId, usageType, semester, meterNumber);
        if (roomId != null || usageType != null || semester != null || meterNumber != null) {
            request.setAttribute("data", data1);
        }
        // Populate dropdown options
        List<String> rooms = electricDAO.getAllRooms();
        List<String> semesters = electricDAO.getAllSemesters();
        List<String> meters = electricDAO.getAllMeters();

        request.setAttribute("rooms", rooms);
        request.setAttribute("semesters", semesters);
        request.setAttribute("meters", meters);
        try {
            ElectricDAO data = new ElectricDAO();
            List<electric> el = data.getAll();
            request.setAttribute("data", el);
            request.getRequestDispatcher("admin/electric.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(dienServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
