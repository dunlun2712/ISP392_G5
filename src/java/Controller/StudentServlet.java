package Controller;

import Model.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "StudentServlet", urlPatterns = {"/studentDashboard"})
public class StudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            Student student = (Student) session.getAttribute("user");
            if ("student".equalsIgnoreCase(student.getRole())) {
                request.getRequestDispatcher("studentDashboard.jsp").forward(request, response);
                return;
            }
        }
        response.sendRedirect("login.jsp");
    }
}
