/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;


import Dao.ItemDAO;
import Dao.RoomDAO1;
import Dao.Room_itemDAO;
import Model.Item;
import Model.Room;
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
@WebServlet(name = "updateItemRoom", urlPatterns = {"/updateItemRoom"})
public class updateItemRoom extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ItemDAO itemDAO = new ItemDAO();
        RoomDAO1 roomDAO = new RoomDAO1();
        String room_id = request.getParameter("room_id");
        System.out.println(room_id);
        try {
            List<Item> items = itemDAO.getAllItems();
            request.setAttribute("items", items);

            Room room = null;
            room = roomDAO.getRoomById(room_id);
            request.setAttribute("room", room);
            request.getRequestDispatcher("updateRoomItem.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RoomDAO1 roomDAO = new RoomDAO1();
        String room_id = request.getParameter("room_id");
        String item_id = request.getParameter("itemId");
        String itemName = request.getParameter("itemName");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");

        Room_itemDAO rItem = new Room_itemDAO();

        
        try {
            rItem.addItemRoom(room_id,item_id,itemName, category, price, quantity);
        } catch (SQLException ex) {
            Logger.getLogger(updateItemRoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        Room room = null;
        room = roomDAO.getRoomById(room_id);
        request.setAttribute("room", room);

        request.setAttribute("roomId", room_id);
        response.sendRedirect("inItem?roomId=" + room_id);
    }

}
