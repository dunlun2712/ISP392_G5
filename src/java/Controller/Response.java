/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.RoomDao;
import Model.Booking;
import Model.Req;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 *
 * @author tranm
 */
@WebServlet(name = "Response", urlPatterns = {"/response"})
public class Response extends HttpServlet {

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
            out.println("<title>Servlet Response</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Response at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        RoomDao rdao = new RoomDao();
        ArrayList<Req> req_data = null;
        req_data = rdao.getAllRequest();
        String check = request.getParameter("list");
        if (check != null) {
            session.setAttribute("req_data", req_data);
        }

        request.getRequestDispatcher("studentMana/response.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Req> req_data = (ArrayList<Req>) session.getAttribute("req_data");
        String other = request.getParameter("other");
        String rep = request.getParameter("response");
        RoomDao rdao = new RoomDao();
        String req_id = request.getParameter("req_id");
        request.setAttribute("reqid", req_id);
        if (rep != null) {
            switch (rep) {

                case "back":

                    req_data = rdao.getAllRequest();
                    String check = request.getParameter("list");
                    if (check != null && !check.equals("0")) {
                        session.setAttribute("req_data", req_data);
                    }

                    request.getRequestDispatcher("studentMana/response.jsp").forward(request, response);
                    break;
                case "save":
                    String req_status = request.getParameter("res_status");
                    String resp = request.getParameter("resp");
                    LocalDate currentDate = LocalDate.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                    String formattedDate = currentDate.format(formatter);
                    currentDate = LocalDate.now();
                    rdao.updateResponse(req_status, resp, currentDate, req_id);
                    req_data = rdao.getAllRequest();
                    session.setAttribute("req_data", req_data);
                    request.getRequestDispatcher("studentMana/response.jsp").forward(request, response);
                    break;
            }

        }
        if (other != null) {
            switch (other) {
                case "detail":

                    Req req_detail = rdao.getInfoReq(req_id);
                    request.setAttribute("Req", req_detail);
                    request.getRequestDispatcher("studentMana/responseDetail.jsp").forward(request, response);

                    break;
                case "reply":
                    request.getRequestDispatcher("studentMana/response.jsp").forward(request, response);
                    break;
                case "back":

                    break;

            }

        }

    }

}
