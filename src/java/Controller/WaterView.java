/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.RoomDao;
import Dao.StudentDao;
import Model.Booking;
import Model.Student;
import Model.electric;
import Model.water;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "WaterView", urlPatterns = {"/waterView"})
public class WaterView extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StudentDao dao = new StudentDao();
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("data");
        if (student == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        RoomDao rdao = new RoomDao();
        Booking bookInfo = rdao.getBookInfo(student.getId());
        if (bookInfo != null) {
            String roomID = bookInfo.getRoom_id();

            List<water> wa = dao.getStudentForWater(roomID);
            request.setAttribute("data", wa);
            request.getRequestDispatcher("profile/ViewWater.jsp").forward(request, response);
        }
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
