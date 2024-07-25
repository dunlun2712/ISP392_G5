/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ResetPasswordS", urlPatterns = {"/reset_password"})
public class ResetPasswordS extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String newPassword = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        System.out.println(email);
  
       
        
        
        
        if (email == null || newPassword == null || newPassword.isEmpty() || confirmPassword == null || confirmPassword.isEmpty()) {
            request.setAttribute("mess", "Invalid request. Please try again!");
            request.getRequestDispatcher("reset_password.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("mess", "Password do not match.Please try again!");
            request.getRequestDispatcher("reset_password.jsp").forward(request, response);

        }
        else{

        Connection connection = null;
        PreparedStatement statement = null;
        DBContext dBContext = new DBContext();

        try {

            connection = dBContext.getConnection();

            String updatePassword = "UPDATE Users SET pass = ? WHERE email = ?";
            statement = connection.prepareStatement(updatePassword);
            statement.setString(1, newPassword);
            statement.setString(2, email);

            int rowsUpdate = statement.executeUpdate();
            if (rowsUpdate > 0) {
                session.removeAttribute("otp");
                session.removeAttribute("enmail");
                

//                response.getWriter().write("Password has been reset successfully.");
                request.setAttribute("mess", "Password has been reset successfully.");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
//                response.getWriter().write("Email not found. Please try again!");
                request.setAttribute("mess", "Email not found. Please try again!");
                request.getRequestDispatcher("reset_password.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
//            response.getWriter().write("Database error occurred. Please try again!");
            request.setAttribute("mess", "Database error occurred. Please try again!");
            request.getRequestDispatcher("reset_password.jsp").forward(request, response);
        } finally {
            // Close resources
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }}
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
