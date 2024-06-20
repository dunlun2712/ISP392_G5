/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.*;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import java.util.*;
import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author khanh
 */
public class NewDAO extends DBContext {

    public NewDAO() {
        connectDB();
    }
    Connection cnn; //ket noi db
    PreparedStatement stm; // thuc hien cac cau lenh sql
    ResultSet rs;//luu tru va xu ly du lieu

//khai bao thanh phan xu ly database
    private void connectDB() {
        cnn = connection;
        if (cnn != null) {
            System.out.println("connect succes");
        } else {
            System.out.println("connect fail");
        }
    }
    Connection conn = null;
    PreparedStatement ps = null;

    public int getID() {
        int newId = 0;
        String sql = "SELECT news_id FROM news\n"
                + "ORDER BY news_id DESC";
        try {
            conn = connection; // Assuming connection is properly initialized elsewhere
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                newId = rs.getInt("news_id") + 1;
            } else {
                // If there are no rows in the ResultSet, start with ID 1
                newId = 1;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return newId;
    }

    public void addNews(String new_id, String title, String content, Date publish_date, String category, String link) {

        String sql = "INSERT INTO news(title, content, publish_date, category,link) VALUES(?,?,  ?,?, ?)";
        try {

            stm = connection.prepareStatement(sql);

            stm.setString(1, title);
            stm.setString(2, content);
            stm.setDate(3, publish_date);
            stm.setString(4, category);
            stm.setString(5, link);
            stm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // Ghi nhật ký ngoại lệ
        }

    }

    public void deleteNews(int id) throws SQLException {
        String sql = "DELETE FROM news WHERE news_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error deleting news", e);
        }
    }

    public List<News> getAllNews() {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT * FROM news";
        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                News news = new News(
                        rs.getString("news_id"), // Assuming news_id is int in database
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getDate("publish_date"),
                        rs.getString("category"),
                        rs.getString("link")
                );
                newsList.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newsList;
    }
public News getNewsById(int id) {
        String sql = "SELECT * FROM news WHERE news_id = ?";
        try (Connection conn = connection;
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new News(
                            rs.getString("news_id"),
                            rs.getString("title"),
                            rs.getString("content"),
                            rs.getDate("publish_date"),
                            rs.getString("category"),
                            rs.getString("link")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<News> searchNewsByTitle(String title) {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT * FROM news WHERE title LIKE ?";
        try (Connection conn = connection;
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, "%" + title + "%");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                News news = new News();
                news.setNew_id(resultSet.getString("new_id"));
                news.setTitle(resultSet.getString("title"));
                news.setContent(resultSet.getString("content"));
                news.setPublish_date(resultSet.getDate("publish_date"));
                news.setCategory(resultSet.getString("category"));
                news.setLink(resultSet.getString("link"));
                newsList.add(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newsList;
    }
}


