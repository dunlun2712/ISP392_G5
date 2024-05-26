package Controller;

import Dao.StudentDao;
import Model.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;

@WebServlet(name = "ChangePass", urlPatterns = {"/changepass"})
public class ChangePass extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePass</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePass at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("data");
        String update = request.getParameter("update");
        session.setAttribute("data", student);

        String pass = request.getParameter("pass");
        student.setPass(request.getParameter("pass"));

        if ("back".equals(update)) {
            request.getRequestDispatcher("Profile/Profile.jsp").forward(request, response);
            return;
        }

        if ("pass_update".equals(update)) {
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            request.setAttribute("oldPassword", oldPassword);
            if (newPassword != null && newPassword.equals(confirmPassword)) {
                student.setPass(newPassword);
                StudentDao d = new StudentDao();
                d.updatePass(newPassword, student.getId());
                request.setAttribute("message", "Password updated successfully");
                request.getRequestDispatcher("profile/ChangePass.jsp").forward(request, response);
            } else if (newPassword != null && !newPassword.equals(confirmPassword)) {
                request.setAttribute("message", "New passwords do not match");
                request.getRequestDispatcher("profile/ChangePass.jsp").forward(request, response);
            }

            if (oldPassword != null && oldPassword.equals(student.getPass())) {
                request.setAttribute("message", "Old password is correct");
            } else if (oldPassword != null) {
                request.setAttribute("message", "Old password is incorrect");
                request.getRequestDispatcher("profile/ChangePass.jsp").forward(request, response);
            }
        }

        request.getRequestDispatcher("profile/ChangePass.jsp").forward(request, response);
    }
}
