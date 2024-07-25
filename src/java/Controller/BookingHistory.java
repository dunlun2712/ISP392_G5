/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.DAO;
import Dao.StudentDao;
import Dao.TicketDAO;
import Model.HistoryBillAdmin;
import Model.HistoryBooking;
import Model.ParkingH;
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
import java.time.LocalDateTime;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "BookingHistory", urlPatterns = {"/bookinghistory"})
public class BookingHistory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StudentDao d = new StudentDao();
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("data");
        if (student == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }

        DAO dao = new DAO();
        TicketDAO ticket = new TicketDAO();
        List<HistoryBooking> listbill = dao.getHistoryBookingById(student.getId());
        List<Ticket> xe = ticket.getTicketsById(student.getId());
        request.setAttribute("listcomment", listbill);
        request.setAttribute("xe", xe);
        request.getRequestDispatcher("historybooking.jsp").forward(request, response);

    }

}
