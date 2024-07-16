package Controller;

import Dao.InvoiceDAO;
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

/**
 * Servlet implementation class AddInvoice
 */
public class AddInvoice extends HttpServlet {

    private static final long serialVersionUID = 1L;
private InvoiceDAO invoiceDAO = new InvoiceDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddInvoice() {
        super();
    }

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
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

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
        InvoiceDAO invoiceDAO = new InvoiceDAO();
        int id = invoiceDAO.getID();
        // Set the current date
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String formattedDate = currentDate.format(formatter);
        currentDate = LocalDate.now();

        request.setAttribute("date", currentDate);
        request.setAttribute("id", id);
        request.getRequestDispatcher("addinvoice.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

       
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
                request.getRequestDispatcher("addinvoice.jsp").forward(request, response);
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
        Invoice invoice = new Invoice("", room_id, users_id, createdDate, description, paymentType, "", status, totalPayment);
        InvoiceDAO invoiceDAO = new InvoiceDAO();
        invoiceDAO.addInvoice(invoice);

        request.setAttribute("date", currentDate);
        // Đặt các thuộc tính để chuyển tiếp đến trang JSP
        request.setAttribute("invoice", invoice);

        // Chuyển tiếp đến trang JSP để hiển thị chi tiết hóa đơn
        request.getRequestDispatcher("addinvoice.jsp").forward(request, response);
    }catch (SQLException e) {
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
