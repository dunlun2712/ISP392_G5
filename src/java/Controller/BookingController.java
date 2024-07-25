/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;


import Dao.DAO;
import dal.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Model.*;
import Model.RoomByHoai;
import Dao.LDao;
import jakarta.servlet.http.HttpSession;


/**
 *
 * @author admin
 */
public class BookingController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = request.getParameter("pid");
        DAO dao = new DAO();
        Room r = dao.getRoomById(id);
        List<Room> p = dao.getRoomByStatus();
        List<Dorminatory> dorm = dao.getAllDorm();
        Student student = (Student) session.getAttribute("data");
       
        
        if (student == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } 
        String gender = student.getGender();
        if(gender!=null){
            if(gender.equals("Nam")){
                p = dao.getRoomByStatusFemale();
            }
            if(gender.equals("Nữ")){
                p = dao.getRoomByStatusMale();
            }
           
        }
        request.setAttribute("dorms", dorm);
        request.setAttribute("details", p);
        request.setAttribute("detail", r);
        request.getRequestDispatcher("booking.jsp").forward(request, response);
    }


}
