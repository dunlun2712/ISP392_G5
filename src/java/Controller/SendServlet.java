package Controller;

import Dao.RoomBookingDAO;
import Dao.RoomDao;
import Dao.StudentDao;
import Model.Booking;
import Model.Student;
import dal.DBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "sendServlet", urlPatterns = {"/sendServlet"})
public class SendServlet extends HttpServlet {

    
    
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
            request.getRequestDispatcher("admin/SendMail.jsp").forward(request, response);
         
              

    }
    
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String subject = request.getParameter("title");
        String message = request.getParameter("message");
        String recipient = request.getParameter("recipient");
        String studentEmail = request.getParameter("studentEmail");

        List<String> emails = getAllStudentEmails();

        if ("specific".equals(recipient) && studentEmail != null && !studentEmail.isEmpty()) {
            emails = Arrays.asList(studentEmail);
        }

        // Validate emails before sending
        emails = emails.stream()
                .filter(this::isValidFptEmail)
                .filter(this::isEmailInDatabase)
                .collect(Collectors.toList());

        if (emails.isEmpty()) {
            request.setAttribute("errorMessage", "No valid email addresses to send.");
            request.getRequestDispatcher("admin/SendMail.jsp").forward(request, response);
            return;
        }

        String host = "smtp.gmail.com";
        String user = "doan57861@gmail.com";
        String pass = "wnebviqvqscwxsec"; // Consider using an environment variable or a more secure method for storing passwords
        String from = "doan57861@gmail.com";

        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(from));
            for (String email : emails) {
                mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            }
            mimeMessage.setSubject(subject);
            mimeMessage.setText(message);

            Transport.send(mimeMessage);
            request.setAttribute("successMessage", "Email sent successfully.");
            request.getRequestDispatcher("admin/SendMail.jsp").forward(request, response);
        } catch (MessagingException mex) {
            mex.printStackTrace();
            request.setAttribute("errorMessage", "Error: Unable to send email. " + mex.getMessage());
            request.getRequestDispatcher("admin/SendMail.jsp").forward(request, response);
        }
    }

    private List<String> getAllStudentEmails() {
        // Placeholder method. Replace with actual logic to retrieve all student emails.
        return Arrays.asList("student1@fpt.edu.vn", "student2@fpt.edu.vn");
    }

    private boolean isValidFptEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@fpt.edu.vn$";
        return email != null && email.matches(emailRegex);
    }

    private boolean isEmailInDatabase(String email) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        DBContext dBContext = new DBContext();

        try {
            conn = dBContext.getConnection();

            String query = "SELECT * FROM Users WHERE email = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();

            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
