
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.AccDao;
import Dao.StudentDao;
import Model.Account;
import Model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.regex.Pattern;

@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StudentDao d = new StudentDao();
        String email = request.getParameter("account");
        String pass = request.getParameter("password");
        String id = d.getIdByEmail(email);
        AccDao accdao = new AccDao();
        Student student = d.getInfoStudent(id);
        Account account = accdao.getInforAcc(email);
        HttpSession session = request.getSession();
        session.setAttribute("data", student);
        String login = request.getParameter("login");
        switch (login) {
            case "Login":
                boolean isAuthenticated = false;
                boolean isEmailValid = email.endsWith("@fpt.edu.vn");

                if (isEmailValid) {
                    if (account != null && email.equals(account.getEmail())) {
                        if (pass.equals(account.getPass())) {
                            isAuthenticated = true;
                            session.setAttribute("email", email);
                            session.setAttribute("user", account);
                            if ("1".equalsIgnoreCase(account.getRole())) {
                                response.sendRedirect("admin/admin.jsp");
                            } else if("2".equalsIgnoreCase(account.getRole())){
                                response.sendRedirect("managerDashboard.jsp");
                            }
                            return;
                        }
                    }
                    if (student != null && email.equals(student.getEmail())) {
                        if (pass.equals(student.getPass())) {
                            isAuthenticated = true;
                            session.setAttribute("email", email);
                            session.setAttribute("user", student);
                            response.sendRedirect("studentDashboard.jsp");
                            return;
                        }
                    }
                }
                if (!isAuthenticated) {
                    if (!isEmailValid) {
                        request.setAttribute("mess", "Email must be fpt.edu.vn");
                    } else {
                        request.setAttribute("mess", "Wrong Email or Password");
                    }
                    request.setAttribute("email", email);
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
                break;
            case "signup":
                String acc_name = request.getParameter("name");
                String acc_email = request.getParameter("email");
                String acc_pass = request.getParameter("password");
                String repass = request.getParameter("repass");
                boolean isSignupEmailValid = acc_email.endsWith("@fpt.edu.vn");
                String passwordPattern = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%^&+=]).*$";
                boolean isPasswordValid = Pattern.matches(passwordPattern, acc_pass);
                if (!isSignupEmailValid) {
                    request.setAttribute("mess", "Email must be fpt.edu.vn");
                    request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                } else {
                    Account existingAccount = accdao.getInforAcc(acc_email);
                    if (existingAccount != null && acc_email.equals(existingAccount.getEmail())) {
                        request.setAttribute("mess", "This email has already been registered");
                        request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                    } else if (!repass.equals(acc_pass)) {
                        request.setAttribute("mess", "Your passwords do not match");
                        request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                    } else {
                        // Generate OTP
                        String otp = OTPUtil.generateOTP();
                        // Send OTP to user's email
                        OTPUtil.sendEmail(acc_email, otp);
                        // Save account information and OTP in session
                        session.setAttribute("otp", otp);
                        session.setAttribute("acc_name", acc_name);
                        session.setAttribute("acc_email", acc_email);
                        session.setAttribute("acc_pass", acc_pass);
                        session.setAttribute("account", existingAccount);
                        request.getRequestDispatcher("OTPVerification.jsp").forward(request, response);
                    }
                }
                break;
                
            case "signupPage":
                request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                break;
        }
          Account a = accdao.getInforAcc(email);
          session.setAttribute("account", a);
    }
}
