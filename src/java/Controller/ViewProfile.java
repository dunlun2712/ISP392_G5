/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.StudentDao;
import Model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author tranm
 */
@WebServlet(name = "ViewProfile", urlPatterns = {"/viewprofile"})
public class ViewProfile extends HttpServlet {

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
            out.println("<title>Servlet ViewProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentDao d = new StudentDao();
        String email = request.getParameter("email");
        String id = d.getIdByEmail(email);
        Student student = d.getInfoStudent(id);  // getInfoStudent trả về một đối tượng Student

        // Lưu đối tượng Student vào session
        HttpSession session = request.getSession();
        session.setAttribute("data", student);
        request.getRequestDispatcher("Profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");

        // Lấy dữ liệu từ session bằng cách sử dụng phương thức getAttribute()
        // Ví dụ: Lấy giá trị của trường "data"
        Student student = (Student) session.getAttribute("data");
        String update = request.getParameter("update");
        session.setAttribute("data", student);
        switch (update) {

            case "pass_update":
                
                request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
                break;
            case "update":
                student.setName(request.getParameter("name"));
                student.setGender(request.getParameter("gender"));
                student.setDob(request.getParameter("dob"));
                student.setEthnicity(request.getParameter("ethnicity"));
                student.setNation(request.getParameter("nation"));
                student.setPhone_num(request.getParameter("phone_num"));
                student.setCccd(request.getParameter("cccd"));
                student.setAddress(request.getParameter("address"));
                StudentDao d = new StudentDao();
                d.updateStudentInfo(student);
                request.getRequestDispatcher("Profile.jsp?mess=Update success").forward(request, response);
                break;

            case "back":
                request.getRequestDispatcher("Profile.jsp").forward(request, response);
                break;
            case "profile_update":

                request.getRequestDispatcher("UpdateProfile.jsp").forward(request, response);
                break;
        }
    }

}
