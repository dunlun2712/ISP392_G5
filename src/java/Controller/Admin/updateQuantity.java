/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;


import Dao.Room_itemDAO;
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
 * @author tranm
 */
@WebServlet(name = "updateQuantity", urlPatterns = {"/updatequantity"})
public class updateQuantity extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String itemid = request.getParameter("itemId");
        String roomid = request.getParameter("roomId");
        Room_itemDAO rdao = new Room_itemDAO();

        rdao.deleteRoomItem(roomid,itemid);

        List<room_item> items = null;
        try {
            items = rdao.getRoomById(roomid);
        } catch (SQLException ex) {
            Logger.getLogger(updateQuantity.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("items", items);
        System.out.println(roomid);
        request.setAttribute("room_id", roomid);
        request.getRequestDispatcher("inItem.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String quantity = request.getParameter("quantity");
        String itemid = request.getParameter("itemId");
        String roomid = request.getParameter("roomid");

        Room_itemDAO rdao = new Room_itemDAO();

        rdao.updateQuantity(roomid, itemid, quantity);

        List<room_item> items = null;
        try {
            items = rdao.getRoomById(roomid);
        } catch (SQLException ex) {
            Logger.getLogger(updateQuantity.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("items", items);
        System.out.println(roomid);
        request.setAttribute("room_id", roomid);
        request.getRequestDispatcher("inItem.jsp").forward(request, response);
    }

}
