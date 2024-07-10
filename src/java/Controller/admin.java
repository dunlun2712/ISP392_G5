/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.AccDao;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@WebServlet(name = "admin", urlPatterns = {"/admin"})
public class admin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
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
        String searchStatus = request.getParameter("status");
        switch (type) {
            case "viewstudent":
                String tim = request.getParameter("search");
                if (tim != null) {
                    request.setAttribute("tim", tim);
                }
                request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
                break;

            case "viewmanager":
                AccDao accDao = new AccDao();
                ArrayList<Account> account;
                if ((searchQuery != null && !searchQuery.isEmpty()) || (searchStatus != null && !searchStatus.isEmpty())) {
                    account = accDao.searchAccounts(searchQuery != null ? searchQuery : "", searchStatus != null ? searchStatus : "");
                } else {
                    account = accDao.getAllAcc();
                }
                request.setAttribute("data", account);
                request.getRequestDispatcher("admin/viewmanager.jsp").forward(request, response);
                break;
            default:
                // Handle other cases if needed
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccDao accDao = new AccDao();

        ArrayList<Account> accounts = accDao.getAllAcc();

        for (Account account : accounts) {
            String email = account.getEmail();
            int newRole = '0';
            String newStatus = request.getParameter("status_" + email);
            if (request.getParameter("role_" + email) != null) {
                newRole = Integer.parseInt(request.getParameter("role_" + email));
            }
            if (newStatus != null && (!newStatus.equals(account.getStatus()) || newRole != Integer.parseInt(account.getRole()))) {
                accDao.updateAcc(email, newRole, newStatus);
            }
        }

        // After updating, redirect back to the view manager page
        response.sendRedirect(request.getContextPath() + "/admin?type=viewmanager");
    }
}
