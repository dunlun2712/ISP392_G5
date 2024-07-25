/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Invoice;
import Dao.InvoiceDAO;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author khanh
 */
public class InvoiceController extends HttpServlet {

    private InvoiceDAO invoiceDAO;

    @Override
    public void init() throws ServletException {
        invoiceDAO = new InvoiceDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        if (acc == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }

        List<Invoice> invoices = invoiceDAO.selectAllInvoices();
        request.setAttribute("invoices", invoices);
        request.getRequestDispatcher("admin/invoice.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userId = request.getParameter("user_id");
        String roomId = request.getParameter("room_id");
        String fromDate = request.getParameter("from_date");
        List<Invoice> invoices = invoiceDAO.searchInvoices(userId, roomId, fromDate);
        request.setAttribute("invoices", invoices);
        request.getRequestDispatcher("admin/invoice.jsp").forward(request, response);
    }

}
