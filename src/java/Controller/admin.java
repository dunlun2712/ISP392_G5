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
import java.util.stream.Collectors;
import org.apache.catalina.ha.ClusterSession;

/**
 *
 * @author tranm
 */
@WebServlet(name = "admin", urlPatterns = {"/admin"})
public class admin extends HttpServlet {

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
            out.println("<title>Servlet admin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet admin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String searchQuery = request.getParameter("search");
        String searchColumn = request.getParameter("column");
        HttpSession session = request.getSession();

        StudentDao d = new StudentDao();
        ArrayList<Student> student = d.getAllStudent();

        if (searchQuery != null && !searchQuery.isEmpty() && searchColumn != null && !searchColumn.isEmpty()) {
            student = (ArrayList<Student>) student.stream()
                    .filter(s -> {
                        switch (searchColumn) {
                            case "name":
                                return s.getName().toLowerCase().contains(searchQuery.toLowerCase());
                            case "id":
                                return s.getId().toLowerCase().contains(searchQuery.toLowerCase());
                            case "gender":
                                return s.getGender().toLowerCase().contains(searchQuery.toLowerCase());
                            case "email":
                                return s.getEmail().toLowerCase().contains(searchQuery.toLowerCase());
                            case "dob":
                                return s.getDob().toLowerCase().contains(searchQuery.toLowerCase());
                            case "cccd":
                                return s.getCccd().toLowerCase().contains(searchQuery.toLowerCase());
                            case "major":
                                return s.getMajor().toLowerCase().contains(searchQuery.toLowerCase());
                            case "course":
                                return s.getCourse().toLowerCase().contains(searchQuery.toLowerCase());
                            case "address":
                                return s.getAddress().toLowerCase().contains(searchQuery.toLowerCase());
                            case "ethnicity":
                                return s.getEthnicity().toLowerCase().contains(searchQuery.toLowerCase());
                            case "nation":
                                return s.getNation().toLowerCase().contains(searchQuery.toLowerCase());
                            case "phone_num":
                                return s.getPhone_num().toLowerCase().contains(searchQuery.toLowerCase());
                            case "relative_name":
                                return s.getRelative_name().toLowerCase().contains(searchQuery.toLowerCase());
                            case "relative_contact":
                                return s.getRelative_contact().toLowerCase().contains(searchQuery.toLowerCase());
                            case "create_date":
                                return s.getCreate_date().toLowerCase().contains(searchQuery.toLowerCase());
                            case "update_date":
                                return s.getUpdate_date().toLowerCase().contains(searchQuery.toLowerCase());
                            case "status":
                                return s.getStatus().toLowerCase().contains(searchQuery.toLowerCase());
                            default:
                                return false;
                        }
                    })
                    .collect(Collectors.toList());
        }

        session.setAttribute("data", student);
        request.setAttribute("searchQuery", searchQuery); // Pass searchQuery to JSP
        request.setAttribute("searchColumn", searchColumn); // Pass searchColumn to JSP

        switch (type) {
            case "viewstudent":
                request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
                break;
            case "changepass":
                request.getRequestDispatcher("profile/Profile.jsp").forward(request, response);
                break;
           
       
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentDao dao = new StudentDao();
        ArrayList<Student> students = dao.getAllStudent();

        for (Student i : students) {
            String newStatus = request.getParameter("status_" + i.getId());
            if (newStatus != null && !newStatus.equals(i.getStatus())) {
                i.setStatus(newStatus);
                dao.updateStudentStatus(i.getId(), newStatus);
            }
        }
        request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
    }

}
