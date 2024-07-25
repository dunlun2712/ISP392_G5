package Controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import Dao.NewDAO;
import Model.News;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.List;

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
        NewDAO newsDAO = new NewDAO();
        int idne = newsDAO.getID();
        // Set the current date
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String formattedDate = currentDate.format(formatter);
        currentDate = LocalDate.now();

        request.setAttribute("date", currentDate);
        request.setAttribute("id", idne);
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
        String update = request.getParameter("update");
        if ("List News".equals(update)) {
            List<News> newsList = newsDAO.getAllNews();
            request.setAttribute("newsList", newsList);
            request.getRequestDispatcher("newsList.jsp").forward(request, response);
        }

        if ("Add News".equals(update)) {
            String newId = request.getParameter("new_id");
            String category = request.getParameter("category");
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String link = request.getParameter("link");

            String publishDateStr = request.getParameter("publish_date");
            Date publishDate = null;

            if (publishDateStr != null && !publishDateStr.isEmpty()) {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate localDate = LocalDate.parse(publishDateStr, formatter);
                publishDate = Date.valueOf(localDate);
            }

            HttpSession session = request.getSession();
            // Set the current date
            LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            String formattedDate = currentDate.format(formatter);
            currentDate = LocalDate.now();

            request.setAttribute("date", currentDate);
          
            NewDAO newsDAO = new NewDAO();
            newsDAO.addNews(newId, title, content, publishDate, category, link);
            int id = newsDAO.getID();
            request.setAttribute("id", id);

            request.getRequestDispatcher("addnew.jsp").forward(request, response);
        }

    }


}
