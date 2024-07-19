/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controler;

import dal.WaterDAO;
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
import model.water;

/**
 *
 * @author DELL
 */
@WebServlet(name="readWater", urlPatterns={"/readWater"})
public class readWater extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            WaterDAO wa = new WaterDAO();
            List<water> wt = wa.getAll();
            request.setAttribute("data", wt);
            request.getRequestDispatcher("listWater.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(readWater.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

}
