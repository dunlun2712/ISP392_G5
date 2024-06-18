/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.RoomDao;
import Dao.StudentDao;
import Model.Booking;
import Model.Student;
import Model.Req;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import org.apache.tomcat.jni.SSLContext;

/**
 *
 * @author tranm
 */
@WebServlet(name = "Request", urlPatterns = {"/request"})
public class Request extends HttpServlet {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentDao d = new StudentDao();
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("data");
        if (student == null) {
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } else {
            session.setAttribute("data", student);
            RoomDao rdao = new RoomDao();
            Booking bookInfo = rdao.getBookInfo(student.getId());
            session.setAttribute("book", bookInfo);

            request.getRequestDispatcher("request/Request.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentDao d = new StudentDao();
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("data");
        String mess = request.getParameter("mess");
        session.setAttribute("data", student);
        if (mess.equals("detail")) {
            RoomDao rdao = new RoomDao();
            ArrayList<Req> req = rdao.getAllRequestOfStudent(student.getId());
            session.setAttribute("requests", req);
            request.getRequestDispatcher("request/listRequest.jsp").forward(request, response);
        }
        if (mess.equals("delete")) {
            RoomDao rdao = new RoomDao();
            ArrayList<Req> req = rdao.getAllRequestOfStudent(student.getId());
            session.setAttribute("requests", req);
            request.getRequestDispatcher("request/listRequest.jsp").forward(request, response);
        }
        if (mess.equals("request")) {

            RoomDao rdao = new RoomDao();
            Booking bookInfo = rdao.getBookInfo(student.getId());
            Booking book = (Booking) session.getAttribute("book");
            session.setAttribute("book", bookInfo);

            String user_id = request.getParameter("studentId");
            String room_id = request.getParameter("roomId");
            String req = request.getParameter("description");
            String type = request.getParameter("requestType");

            // Set the current date
            LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            String formattedDate = currentDate.format(formatter);
            currentDate = LocalDate.now();

            rdao.addNewRequest(room_id, user_id, type, req, currentDate);
            request.getRequestDispatcher("request/Request.jsp").forward(request, response);
        }
        if (mess.equals("list")) {
            RoomDao rdao = new RoomDao();
            ArrayList<Req> req = rdao.getAllRequestOfStudent(student.getId());
            session.setAttribute("requests", req);
            request.getRequestDispatcher("request/listRequest.jsp").forward(request, response);
        }

    }

}
