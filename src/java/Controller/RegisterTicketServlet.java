/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.TicketDAO;
import Model.Ticket;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 *
 * @author ADMIN
 */
@WebServlet(name = "RegisterTicketServlet", urlPatterns = {"/registerTicket"})
public class RegisterTicketServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterTicketServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterTicketServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String vehicleNumber = request.getParameter("vehicleNumber");
        String issueDateStr = request.getParameter("issueDate");
        String expiryDateStr = request.getParameter("expiryDate");
        String price = request.getParameter("price");
        String status = request.getParameter("status");

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        java.sql.Date issueDate = null;
        java.sql.Date expiryDate = null;
        try {
            Date parsedIssueDate = format.parse(issueDateStr);
            Date parsedExpiryDate = format.parse(expiryDateStr);
            issueDate = new java.sql.Date(parsedIssueDate.getTime());
            expiryDate = new java.sql.Date(parsedExpiryDate.getTime());
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Logout.jsp"); // Redirect to an error page if date parsing fails
            return;
        }

        TicketDAO dao = new TicketDAO();
        try {
            if (dao.isVehicleNumberExists(vehicleNumber)) {
                // If vehicle number already registered, redirect to an error page
                request.setAttribute("errorMessage", "Vehicle number already registered. Please enter a different vehicle number.");
                request.getRequestDispatcher("RegisterTicket.jsp").forward(request, response);
            } else {
                Ticket ticket = new Ticket();
                ticket.setUsersId(userId);
                ticket.setVehicleNumber(vehicleNumber);
                ticket.setIssueDate(issueDate);
                ticket.setExpiryDate(expiryDate);
                ticket.setPrice(price);
                ticket.setStatus(status);

                boolean success = dao.registerTicket(ticket);
                if (success) {
                    response.sendRedirect("index.jsp");
                } else {
                    response.sendRedirect("error.jsp"); // Redirect to an error page if registration fails
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page if any other exception occurs
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
