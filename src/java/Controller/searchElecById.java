/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Dao.ElecDAO;
import Dao.WaterDAO;
import Model.electric;
import Model.water;
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
 * @author tranm
 */
@WebServlet(name="searchElecById", urlPatterns={"/searchelecbyid"})
public class searchElecById extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("search").trim();
        ElecDAO ws = new ElecDAO();
        List<electric> w = ws.searchById(search);
        request.setAttribute("data", w);
        request.setAttribute("search", search);
        request.getRequestDispatcher("update/readElec.jsp").forward(request, response);
    }

}
