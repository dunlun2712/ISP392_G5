/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.RoomBookingDAO;
import Dao.RoomDao;
import Dao.StudentDao;
import Dao.TicketDAO;
import Model.Booking;
import Model.Student;
import Model.Ticket;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "RegisterTicketServlet", urlPatterns = {"/registerTicket"})
public class RegisterTicketServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StudentDao d = new StudentDao();
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("data");
        if (student == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            String formattedDate = currentDate.format(formatter);
            currentDate = LocalDate.now();

             LocalDate hethan = currentDate.plusMonths(1);
        
        // Định dạng ngày hết hạn thành chuỗi
        
            
            request.setAttribute("date", currentDate);
            request.setAttribute("date1", hethan);
            session.setAttribute("data", student);
            request.getRequestDispatcher("profile/RegisterTicket.jsp").forward(request, response);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String vehicleNumber = request.getParameter("vehicleNumber");
        String cccd = request.getParameter("cccd");
    
        String price = request.getParameter("price");
     
        
        
/////date
        String publishDateStr = request.getParameter("issueDate");
        java.sql.Date issueDate = null;
        String hethandate = request.getParameter("expiryDate");
        java.sql.Date expiryDate = null;
        if (publishDateStr != null && !publishDateStr.isEmpty()) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate = LocalDate.parse(publishDateStr, formatter);
            issueDate = java.sql.Date.valueOf(localDate);
        }
        if (hethandate != null && !hethandate.isEmpty()) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate = LocalDate.parse(hethandate, formatter);
            expiryDate = java.sql.Date.valueOf(localDate);
        }
        
        
        
        HttpSession session = request.getSession();
        // Set the current date
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String formattedDate = currentDate.format(formatter);
        currentDate = LocalDate.now();
        request.setAttribute("date", currentDate);
         LocalDate hethan = currentDate.plusMonths(1);
         request.setAttribute("date1", hethan);
   
        
        TicketDAO dao = new TicketDAO();
        try {
           if (!dao.isValidVehicleNumber(vehicleNumber)) {
                request.setAttribute("errorMessage", "Invalid vehicle number format. Please follow the format: 00-A\"A\"000.00");
                request.getRequestDispatcher("profile/RegisterTicket.jsp").forward(request, response);
            } else if (dao.isVehicleNumberExists(vehicleNumber)) {
                // If vehicle number already registered, redirect to an error page
                request.setAttribute("errorMessage", "Vehicle number already registered");
                request.getRequestDispatcher("profile/RegisterTicket.jsp").forward(request, response);
            } 
            else {
                 Date currentDateAsDate = Date.from(currentDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
                Ticket ticket = new Ticket();
                ticket.setUsersId(userId);
                ticket.setCccd(cccd);
                ticket.setVehicleNumber(vehicleNumber);
                ticket.setIssueDate(issueDate);
                ticket.setExpiryDate(expiryDate);
                ticket.setPrice(price);
                if(ticket.getExpiryDate().after(currentDateAsDate)){
                   request.setAttribute("errorMessage", "Vehicle number already registered in the time given.");
                request.getRequestDispatcher("profile/RegisterTicket.jsp").forward(request, response);
                }

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

}
