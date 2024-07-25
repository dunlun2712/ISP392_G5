/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.ItemDAO;
import Dao.Room_itemDAO;
import Model.Item;
import Model.room_item;

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
 * @author DELL
 */
@WebServlet(name = "inItem", urlPatterns = {"/inItem"})
public class inItem extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String roomid = request.getParameter("roomId");
            Room_itemDAO rdao = new Room_itemDAO();
           
                List<room_item> items = rdao.getRoomById(roomid);
                request.setAttribute("items", items);
               System.out.println(roomid);
            request.setAttribute("room_id", roomid);
            request.getRequestDispatcher("inItem.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
