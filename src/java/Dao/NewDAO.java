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
/**
 *
 * @author khanh
 */
public class NewDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public boolean addNews(int new_id, String title, String content, Date publish_date, String category, Connection connection, String query) {
        boolean status = false;
        String sql = "INSERT INTO news(news_id,title, content, publish_date, category) VALUES(?, ?, ?, ?)";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, new_id);
            ps.setString(2, title);
            ps.setString(3, content);
            ps.setDate(4, publish_date);
            ps.setString(5, category);
            //rs.setBytes(4, news.getImage());
           //rs.setString(5, news.getLink());
             rs = ps.executeQuery();
        int val = ps.executeUpdate();
            if (val > 0) {
                status = true;
            } else {
                status = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public void deleteNews(int id, Connection connection, String query) {
        String sql = "DELETE FROM news WHERE id = ?";
         try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate(); 
        } catch (Exception e) {
        }
    }

    public List<News> getAllNews(Connection connection, String query) {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT * FROM news";
        try {
            conn = connection; // Assuming connection is properly initialized elsewhere
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                News news = new News(
                        rs.getInt("new_id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getDate("publish_date"),
                        rs.getString("category")
                        //rs.getBytes("image"),
                        //rs.getString("link")
                );
                newsList.add(news);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return newsList;
    }

}
