package Controller;

import Dao.InvoiceDAO;
import Model.Invoice;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

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

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String invoice_id = request.getParameter("invoice_id");
        String users_id = request.getParameter("users_id");
        String room_id = request.getParameter("room_id");
        String createdDate = request.getParameter("createdDate");
        String description = request.getParameter("description");
        String paymentType = request.getParameter("paymentType");
        String paymentDate = request.getParameter("paymentDate");
        String status = request.getParameter("status");
        String paymentCode = request.getParameter("paymentCode");
        String modifiedDate = request.getParameter("modifiedDate");
        String totalPayment = request.getParameter("totalPayment");
        String paid = request.getParameter("paid");
        String remaining = request.getParameter("remaining");

        // Tạo đối tượng Invoice và thêm vào cơ sở dữ liệu
        Invoice invoice = new Invoice(invoice_id, room_id, users_id, createdDate, description, paymentType, paymentDate, status, paymentCode, modifiedDate, totalPayment, paid, remaining);
        InvoiceDAO invoiceDAO = new InvoiceDAO();
        invoiceDAO.addInvoice(invoice);

        // Đặt các thuộc tính để chuyển tiếp đến trang JSP
        request.setAttribute("invoice", invoice);

        // Chuyển tiếp đến trang JSP để hiển thị chi tiết hóa đơn
        request.getRequestDispatcher("addinvoice.jsp").forward(request, response);
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
