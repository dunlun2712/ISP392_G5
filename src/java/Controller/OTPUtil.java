/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import java.util.Random;
/**
 *
 * @author Admin
 */
public class OTPUtil {
    // Generate a random OTP
    public static String generateOTP() {
        int otp = 100000 + new Random().nextInt(900000);
        return String.valueOf(otp);
    }
    
    // Send OTP to the user's email
    public static void sendEmail(String toEmail, String otp) {
        final String username = "doan57861@gmail.com"; // use your email
        final String password = "wnebviqvqscwxsec";   // use your email password

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
            new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(toEmail));
            message.setSubject("Your OTP Code");
            message.setText("Your OTP code is: " + otp);

            Transport.send(message);

            System.out.println("OTP Email Sent");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
