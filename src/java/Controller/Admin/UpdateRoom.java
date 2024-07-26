/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import dal.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Model.*;
import Dao.LDao;


/**
 *
 * @author admin
 */
public class UpdateRoom extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        String id = request.getParameter("pid");
        LDao dao = new LDao();
        Room r = dao.getRoomById(id);
        request.setAttribute("details", r);
        System.out.println("hello" + r.getRoom_id());
        request.setAttribute("id", id);
        request.getRequestDispatcher("Ly/EditRoom.jsp").forward(request, response);

    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String back = request.getParameter("back");
        String room_id = request.getParameter("room_id");
        int dorm_id = Integer.parseInt(request.getParameter("dorm_id"));
        int floor = Integer.parseInt(request.getParameter("floor"));
        String room_type = request.getParameter("room_type");
        String usage =request.getParameter("usage");
        int price = Integer.parseInt(request.getParameter("price"));
        String room_status = request.getParameter("room_status");

        LDao dao = new LDao();

        dao.updateRoom(room_id, dorm_id, floor, room_type, price, room_status,usage);
        response.sendRedirect("managementdorm");
    }


}
