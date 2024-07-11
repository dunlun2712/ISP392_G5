package Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

@WebServlet(name = "sendServlet", urlPatterns = {"/sendServlet"})
public class SendServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendMail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendMail at " + request.getContextPath() + "</h1>");
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
        emails = emails.stream().filter(this::isValidEmail).collect(Collectors.toList());

        if (emails.isEmpty()) {
            response.getWriter().println("Error: No valid email addresses to send.");
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
            response.getWriter().println("Email sent successfully.");
        } catch (MessagingException mex) {
            mex.printStackTrace();
            response.getWriter().println("Error: Unable to send email. " + mex.getMessage());
        }
    }

    private List<String> getAllStudentEmails() {
        // Placeholder method. Replace with actual logic to retrieve all student emails.
        return Arrays.asList("student1@example.com", "student2@example.com");
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        return email != null && email.matches(emailRegex);
    }
}
