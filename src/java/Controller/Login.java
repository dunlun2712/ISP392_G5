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

/**
 *
 * @author tranm
 */
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
        request.getRequestDispatcher("Login.jsp").forward(request, response);
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
        String acc = request.getParameter("account");
        String id = d.getIdByEmail(acc);
        AccDao accdao = new AccDao();
        Student student = d.getInfoStudent(id);
        Account account = accdao.getInforAcc(acc);
        HttpSession session = request.getSession();
        session.setAttribute("data", student);
        session.setAttribute("data2", account);
        String login = request.getParameter("login");
        switch (login) {
            case "Login":
                if (student != null && acc.equals(student.getEmail())) {                   
                    session.setAttribute("email", acc);
                    request.getRequestDispatcher("Profile.jsp").forward(request, response);
                } else {
//                    request.setAttribute("mess", "Wrong account or pass");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
//                    response.sendRedirect("Login.jsp");
                }
                break;
            case "signup":
                Account test = (Account)session.getAttribute("data2");
                String acc_name = request.getParameter("newEmail");
                String acc_pass = request.getParameter("acc_pass");
                String repass = request.getParameter("repass");
                if (acc_name.equals(test.getAcc())){
                    request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                } else if (repass.equals(acc_pass)) {
                    request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                } else {
                   accdao.insertAcc(acc_name, acc_pass);
                   request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
                break;
            case "signupPage":
                request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                break;
        }
    }
}


