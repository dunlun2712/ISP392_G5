/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Dao.ElecDAO;
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
@WebServlet(name="Electric", urlPatterns={"/elec"})
public class Electric extends HttpServlet {
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            ElecDAO ec = new ElecDAO();
            List<electric> data = ec.getAll();
            request.setAttribute("data", data);
            request.getRequestDispatcher("update/readElec.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Electric.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    } 


}
