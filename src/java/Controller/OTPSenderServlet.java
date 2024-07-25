package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.mail.MessagingException;

/**
 *
 * @author DELL
 */
@WebServlet(name = "OTPSenderServlets", urlPatterns = {"/sendOTP"})
public class OTPSenderServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        // Tạo OTP
        String otp = OTPGenerator.generateOTP(6); // Độ dài OTP là 6

        // Gửi OTP qua email
        try {
            EmailSender.sendEmail(email, "Your OTP Code", "Your OTP code is: " + otp);

            // Lưu OTP vào session
            HttpSession session = request.getSession();
            session.setAttribute("otp", otp);
            session.setAttribute("email", email);

            response.sendRedirect("verify_otp.jsp");
        } catch (MessagingException e) {
            e.printStackTrace();
            response.getWriter().write("Failed to send OTP.");
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
