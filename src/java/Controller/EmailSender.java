/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

/**
 *
 * @author DELL
 */
public class EmailSender {

    public static void sendEmail(String to, String subject, String body) throws MessagingException {
        String host = "smtp.gmail.com";
        final String user = "ispp392@gmail.com"; // Thay thế bằng email của bạn
        final String password = "mopwizpsvhnehvem"; // Thay thế bằng mật khẩu của bạn

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(body);

            Transport.send(message);
            System.out.println("Email Sent Successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    } 
}
