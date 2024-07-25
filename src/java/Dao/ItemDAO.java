/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Item;
import dal.DBContext;

/**
 *
 * @author DELL
 */
public class ItemDAO {

    private DBContext dbContext;

    public ItemDAO() {
        dbContext = new DBContext();
    }

    // Create
    public void insertItem(Item item) throws SQLException {
        String query = "INSERT INTO Items (item_name, category, price, quantity) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = dbContext.connection.prepareStatement(query)) {
            statement.setString(1, item.getItem_name());
            statement.setString(2, item.getCategory());
            statement.setString(3, item.getPrice());
            statement.setString(4, item.getQuantity());

            statement.executeUpdate();
        }
    }

    // Read
    public List<Item> getAllItems() throws SQLException {
        List<Item> items = new ArrayList<>();
        String query = "SELECT * FROM Items";
        try (Statement statement = dbContext.connection.createStatement(); ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                Item item = new Item();
                item.setItem_id(resultSet.getString("item_id"));
                item.setItem_name(resultSet.getString("item_name"));
                item.setCategory(resultSet.getString("category"));
                item.setPrice(resultSet.getString("price"));
                item.setQuantity(resultSet.getString("quantity"));

                items.add(item);
            }
        }
        return items;
    }

    // Update
    public void updateItem(Item item) throws SQLException {
        String query = "UPDATE Items SET item_name = ?, category = ?, price = ?, quantity = ? WHERE item_id = ?";
        try (PreparedStatement statement = dbContext.connection.prepareStatement(query)) {
            statement.setString(1, item.getItem_name());
            statement.setString(2, item.getCategory());
            statement.setString(3, item.getPrice());
            statement.setString(4, item.getQuantity());
            statement.setString(5, item.getItem_id());
            statement.executeUpdate();
        }
    }

    // Delete
    public void deleteItem(int itemId) throws SQLException {
        String query = "DELETE FROM Items WHERE item_id = ?";
        try (PreparedStatement statement = dbContext.connection.prepareStatement(query)) {
            statement.setInt(1, itemId);
            statement.executeUpdate();
        }
    }

    // Get item by ID
    public Item getItemById(int itemId) throws SQLException {
        Item item = null;
        String query = "SELECT * FROM Items WHERE item_id = ?";
        try (PreparedStatement statement = dbContext.connection.prepareStatement(query)) {
            statement.setInt(1, itemId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    item = new Item();
                    item.setItem_id(resultSet.getString("item_id"));
                    item.setItem_name(resultSet.getString("item_name"));
                    item.setCategory(resultSet.getString("category"));
                    item.setPrice(resultSet.getString("price"));
                    item.setQuantity(resultSet.getString("quantity"));

                }
            }
        }
        return item;
    }

    //search items
    public List<Item> searchItemsByName(String keyword) {
        List<Item> items = new ArrayList<>();
        String sql = "SELECT * FROM Items WHERE item_name LIKE ? OR category LIKE ? OR price LIKE ? OR quantity LIKE ?";
        try (PreparedStatement stmt = dbContext.connection.prepareStatement(sql)) {
            String likeKeyword = "%" + keyword + "%";
            stmt.setString(1, likeKeyword);
            stmt.setString(2, likeKeyword);
            stmt.setString(3, likeKeyword);
            stmt.setString(4, likeKeyword);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Item item = new Item();
                    item.setItem_id(rs.getString("item_id"));
                    item.setItem_name(rs.getString("item_name"));
                    item.setCategory(rs.getString("category"));
                    item.setPrice(rs.getString("price"));
                    item.setQuantity(rs.getString("quantity"));
                    items.add(item);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
}
    


    public List<Item> getItemByRoom(String roomid) throws SQLException {
        List<Item> items = new ArrayList<>();
        String query = "SELECT * FROM Items where room_id= ?";
        try (PreparedStatement stmt = dbContext.connection.prepareStatement(query); ResultSet resultSet = stmt.executeQuery(query)) {
            stmt.setString(1,roomid);
            while (resultSet.next()) {
                Item item = new Item();
                item.setItem_id(resultSet.getString("item_id"));
                item.setItem_name(resultSet.getString("item_name"));
                item.setCategory(resultSet.getString("category"));
                item.setPrice(resultSet.getString("price"));
                item.setQuantity(resultSet.getString("quantity"));

                items.add(item);
            }
        }
        return items;
    }
}
