package Controller;

import Dao.NewDAO;
import Model.News;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class AddNew
 */
public class AddNew extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private NewDAO newsDAO;

    @Override
    public void init() throws ServletException {
        newsDAO = new NewDAO();
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
        // Hiển thị trang thêm tin tức
        request.getRequestDispatcher("addnew.jsp").forward(request, response);
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
        // Xử lý dữ liệu từ biểu mẫu
        int newId = Integer.parseInt(request.getParameter("new_id"));
        String category = request.getParameter("category");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String link = request.getParameter("link");
        Part filePart = request.getPart("image");
        String publishDateStr = request.getParameter("publish_date");
        byte[] image = null;
        if (filePart != null) {
            InputStream inputStream = filePart.getInputStream();
            image = inputStream.readAllBytes();
        }
        
        Date publishDate = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            publishDate = sdf.parse(publishDateStr);
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp"); // Redirect to an error page if date parsing fails
            return;
        }

        News news = new News(newId, title, content, publishDate, category, image, link);
        NewDAO newsDAO = new NewDAO();

        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet for adding news";
    }
}
