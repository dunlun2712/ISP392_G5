package Controller;

import Model.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "ManagerServlet", urlPatterns = {"/managerDashboard"})
public class ManagerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            Account account = (Account) session.getAttribute("user");
            if (account.getRole().equals("2")) {
                request.getRequestDispatcher("managerDashboard.jsp").forward(request, response);
                return;
            }
        }
        response.sendRedirect("login.jsp");
    }
}
