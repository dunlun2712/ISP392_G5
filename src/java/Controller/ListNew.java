/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.NewDAO;
import Model.News;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author khanh
 */
public class ListNew extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        NewDAO newsDAO = new NewDAO();
        String category = request.getParameter("category");
        String date = request.getParameter("date");
        String title = request.getParameter("title");

        List<News> newsList;

        if (category != null && !category.isEmpty()) {
            newsList = newsDAO.getNewsByCategory(category);
        } else if (date != null && !date.isEmpty()) {
            LocalDate datepara = LocalDate.parse(date);
            String formattedDate = datepara.toString(); // Or us
            newsList = newsDAO.getNewsByDate(formattedDate);
        } else if (title != null && !title.isEmpty()) {
            newsList = newsDAO.getNewsByTitle(title);
        } else {
            newsList = newsDAO.getAllNews();
        }
//        if (request.getParameter("search")!=null) {
//            request.setAttribute("date", date);request.getRequestDispatcher("test.jsp").forward(request, response);
//        }

        request.setAttribute("newsList", newsList);
        request.getRequestDispatcher("newsList.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int newId = Integer.parseInt(request.getParameter("new_id"));
        NewDAO newsDAO = new NewDAO();
        String search = request.getParameter("search");
        if (search != null) {
            String category = request.getParameter("category");
        }
        try {

            newsDAO.deleteNews(newId);
            List<News> newsList = newsDAO.getAllNews();
            request.setAttribute("newsList", newsList);
            request.getRequestDispatcher("newsList.jsp").forward(request, response); // Redirect to the Servlet to refresh the news list
        } catch (Exception e) {
            e.printStackTrace();

        }

    }

}
