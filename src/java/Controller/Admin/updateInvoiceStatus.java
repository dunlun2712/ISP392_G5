/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import Dao.InvoiceDAO;
import Dao.StudentDao;
import Model.Invoice;
import Model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tranm
 */
@WebServlet(name = "updateInvoiceStatus", urlPatterns = {"/updateInvoiceStatus"})
public class updateInvoiceStatus extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

        InvoiceDAO d = new InvoiceDAO();

        List<Invoice> invoices = d.selectAllInvoices();

        // Database connection parameters
        for (Invoice i : invoices) {
            String newStatus = request.getParameter("status_" + i.getInvoice_id());
            
                i.setStatus(newStatus);
                d.updateStatus(i.getInvoice_id(), newStatus);
            
        }
     
        response.sendRedirect("invoice");
    }

}
