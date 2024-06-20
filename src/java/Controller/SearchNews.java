package Controller;

import Dao.NewDAO;
import Model.News;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 * Servlet implementation class SearchNews
 * This servlet handles the search requests for news articles by title.
 */
@WebServlet("/searchNews")
public class SearchNews extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private NewDAO newsDAO;

   

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet SearchNews</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchNews at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String title = request.getParameter("title");
        NewDAO newsDAO = new NewDAO();
        List<News> newsList = newsDAO.getAllNews();
        List<News> filteredNewsList = new ArrayList<>();

        if (title != null && !title.trim().isEmpty()) {
            for (News news : newsList) {
                if (news.getTitle().toLowerCase().contains(title.toLowerCase())) {
                    filteredNewsList.add(news);
                }
            }
        } else {
            request.setAttribute("error", "Title parameter is missing or empty");
        }

        request.setAttribute("newsList", filteredNewsList);
        request.setAttribute("title", title);
        request.getRequestDispatcher("newsList.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet for searching news by title";
    }// </editor-fold>
}
