/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.RoomBookingDAO;
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

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentDao d = new StudentDao();
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("data");
        if (student == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            RoomBookingDAO booking = new RoomBookingDAO();
            if(booking.checkExist(student.getId())){
                 session.setAttribute("data", student);
            RoomDao rdao = new RoomDao();
            Booking bookInfo = rdao.getBookInfo(student.getId());
            session.setAttribute("book", bookInfo);

            request.getRequestDispatcher("request/Request.jsp").forward(request, response);
            }else{
                 request.getRequestDispatcher("/error.jsp").forward(request, response);
            }
           
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentDao d = new StudentDao();
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("data");
        String mess = request.getParameter("mess");
        String other = request.getParameter("other");
        session.setAttribute("data", student);
        RoomDao rdao = new RoomDao();
        String req_id = request.getParameter("req_id");
        if (other != null) {
            switch (other) {
                case "detail":

                    Booking bookInfo = rdao.getBookInfo(student.getId());
                    Booking book = (Booking) session.getAttribute("book");
                    session.setAttribute("book", bookInfo);
                    Req reqdata = rdao.getInfoReq(req_id);
                    
                    String user_id = request.getParameter("studentId");
                    String room_id = request.getParameter("roomId");
                    String note = request.getParameter("description");
                    String type = request.getParameter("requestType");

                    // Set the current date
                    LocalDate currentDate = LocalDate.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                    String formattedDate = currentDate.format(formatter);
                    currentDate = LocalDate.now();

                    request.setAttribute("Req", reqdata);
                    request.getRequestDispatcher("request/requestDetail.jsp").forward(request, response);
                    break;
                case "delete":
                    
                    rdao.deleteRequest(req_id);
                    ArrayList<Req> req = rdao.getAllRequestOfStudent(student.getId());
                    session.setAttribute("requests", req);
                    request.getRequestDispatcher("/request/listRequest.jsp").forward(request, response);
                    break;
                case "back":

                     bookInfo = rdao.getBookInfo(student.getId());
                     book = (Booking) session.getAttribute("book");
                    session.setAttribute("book", bookInfo);

                    user_id = request.getParameter("studentId");
                     room_id = request.getParameter("roomId");
                     note = request.getParameter("description");
                     type = request.getParameter("requestType");

                    // Set the current date
                     currentDate = LocalDate.now();
                     formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                     formattedDate = currentDate.format(formatter);
                    currentDate = LocalDate.now();

                    
                    request.getRequestDispatcher("request/Request.jsp").forward(request, response);
                    break;
            }

        }
        if (mess != null && mess.equals("request")) {

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
        if (mess != null && mess.equals("list")) {

            ArrayList<Req> req = rdao.getAllRequestOfStudent(student.getId());
            session.setAttribute("requests", req);
            request.getRequestDispatcher("request/listRequest.jsp").forward(request, response);
        }

    }

}
