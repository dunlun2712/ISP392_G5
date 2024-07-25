/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;
import java.sql.SQLException;
import Dao.ItemDAO;
import Model.Item;
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
@WebServlet(name="ReadServlet", urlPatterns={"/listItems"})
public class ReadItem extends HttpServlet {
   

    private ItemDAO itemDAO = new ItemDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            List<Item> items = itemDAO.getAllItems();
            request.setAttribute("items", items);
            request.getRequestDispatcher("items.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       
    }


}
