/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Admin;


import Dao.RoomDAO1;
import Model.Room;
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
 * @author DELL
 */
@WebServlet(name="searchRoom", urlPatterns={"/searchRoom"})
public class searchRoom extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RoomDAO1 rd = new RoomDAO1();
        String searchItem = request.getParameter("search");
        List<Room> rooms = rd.searchItemsByName(searchItem);
        request.setAttribute("search", searchItem);
        request.setAttribute("roomList", rooms);
        request.getRequestDispatcher("room.jsp").forward(request, response);
    }

}
