/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.AccDao;
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
 * @author Admin
 */
@WebServlet(name = "OTPVerificationServlet", urlPatterns = {"/otpVerification"})
public class OTPVerificationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String enteredOTP = request.getParameter("otp");
        String sessionOTP = (String) session.getAttribute("otp");

        if (enteredOTP.equals(sessionOTP)) {
            // Retrieve account information from session
            String acc_name = (String) session.getAttribute("acc_name");
            String acc_email = (String) session.getAttribute("acc_email");
            String acc_pass = (String) session.getAttribute("acc_pass");

            // Create account
            AccDao accdao = new AccDao();
            accdao.insertAcc(acc_name, acc_email, acc_pass);

            // Clear session attributes
            session.removeAttribute("otp");
            session.removeAttribute("acc_name");
            session.removeAttribute("acc_email");
            session.removeAttribute("acc_pass");

            response.sendRedirect("homeservlet");
        } else {
            request.setAttribute("mess", "Invalid OTP. Please try again.");
            request.getRequestDispatcher("OTPVerification.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
