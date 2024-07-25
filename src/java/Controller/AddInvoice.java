package Controller;

import Dao.InvoiceDAO;
import Model.Account;
import Model.Invoice;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class AddInvoice
 */
public class AddInvoice extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddInvoice() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        InvoiceDAO invoiceDAO = new InvoiceDAO();
        int id = invoiceDAO.getID();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        if (acc == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }

        // Set the current date
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String formattedDate = currentDate.format(formatter);
        currentDate = LocalDate.now();

        request.setAttribute("date", currentDate);
        request.setAttribute("id", id);
        request.getRequestDispatcher("admin/addinvoice.jsp").forward(request, response);
    }

    private InvoiceDAO invoiceDAO = new InvoiceDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String users_id = request.getParameter("users_id");
        String room_id = request.getParameter("room_id");
        String createdDate = request.getParameter("createdDate");
        String description = request.getParameter("description");
        String paymentType = request.getParameter("paymentType");
        String status = request.getParameter("status");
        String totalPayment = request.getParameter("totalPayment");
        Date publishDate = null;

        if (createdDate != null && !createdDate.isEmpty()) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate = LocalDate.parse(createdDate, formatter);
            publishDate = Date.valueOf(localDate);
        }
        try {
            boolean hasError = false;

            if (!invoiceDAO.isUserExist(users_id)) {
                request.setAttribute("userIdError", "User ID does not exist.");
                hasError = true;
            }

            if (!invoiceDAO.isRoomExist(room_id)) {
                request.setAttribute("roomIdError", "Room ID does not exist.");
                hasError = true;
            }

            if (hasError) {
//                LocalDate currentDate = LocalDate.now();
//                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
//                String formattedDate = currentDate.format(formatter);
//                currentDate = LocalDate.now();
                int id = invoiceDAO.getID();
//                request.setAttribute("date", currentDate);
                request.setAttribute("id", id);
                HttpSession session = request.getSession();
                // Set the current date
                LocalDate currentDate = LocalDate.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                String formattedDate = currentDate.format(formatter);
                currentDate = LocalDate.now();

                request.setAttribute("date", currentDate);
                request.getRequestDispatcher("admin/addinvoice.jsp").forward(request, response);
                return;
            }
            HttpSession session = request.getSession();
            // Set the current date
            LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            String formattedDate = currentDate.format(formatter);
            currentDate = LocalDate.now();

            request.setAttribute("date", currentDate);
            // Tạo đối tượng Invoice và thêm vào cơ sở dữ liệu
            Invoice invoice = new Invoice("", room_id, users_id, createdDate, description, paymentType, "", "unpaid", totalPayment);
            InvoiceDAO invoiceDAO = new InvoiceDAO();
            invoiceDAO.addInvoice(invoice);
            int id = invoiceDAO.getID();

            request.setAttribute("id", id);
            request.setAttribute("date", currentDate);
            // Đặt các thuộc tính để chuyển tiếp đến trang JSP
            request.setAttribute("invoice", invoice);

            // Chuyển tiếp đến trang JSP để hiển thị chi tiết hóa đơn
            request.getRequestDispatcher("admin/addinvoice.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Database error while checking user or room existence.", e);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet to add an invoice";
    }
}
