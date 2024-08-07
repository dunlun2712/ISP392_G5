/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.DormMana;

import Dao.AccDao;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author tranm
 */
@WebServlet(name = "AccPass", urlPatterns = {"/accpass"})
public class AccPass extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();

       
        request.getRequestDispatcher("studentMana/pass.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String email = (String) session.getAttribute("email");
        Account acc = (Account) session.getAttribute("user");
        request.setAttribute("acc", acc);
        System.out.println(email);
        String oldPassword = request.getParameter("oldPassword");
        request.setAttribute("oldPassword", oldPassword);
        String passnewtrim = request.getParameter("newPassword");
        String repasstrim = request.getParameter("confirmPassword");
        String newPassword = null;
        String confirmPassword = null;
        if (passnewtrim != null && repasstrim != null) {
            newPassword = passnewtrim.trim();
            confirmPassword = repasstrim.trim();
            if (newPassword.length() < 8 || confirmPassword.length() < 8) {
                request.setAttribute("oldPassword", oldPassword);
                request.setAttribute("message", "Password is not accepted");
                request.getRequestDispatcher("studentMana/pass.jsp").forward(request, response);
            }
        }

        if (newPassword != null && newPassword.equals(confirmPassword)) {
            acc.setPass(newPassword);
            AccDao d = new AccDao();
            d.updatePassAcc(newPassword, acc.getEmail());
            request.setAttribute("message", "Password updated successfully");
            request.getRequestDispatcher("studentMana/pass.jsp").forward(request, response);
        } else if (newPassword != null && !newPassword.equals(confirmPassword)) {
            request.setAttribute("message", "New passwords do not match");
            request.getRequestDispatcher("studentMana/pass.jsp").forward(request, response);
        }

        if (oldPassword != null && oldPassword.equals(acc.getPass())) {
            request.setAttribute("message", "Old password is correct");
        } else if (oldPassword != null) {
            request.setAttribute("message", "Old password is incorrect");
            request.getRequestDispatcher("studentMana/pass.jsp").forward(request, response);
        }

        request.getRequestDispatcher("studentMana/pass.jsp").forward(request, response);
    }

}
