/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Item;

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
        String query = "INSERT INTO Items (item_name, category, price) VALUES (?, ?, ?)";
        try (PreparedStatement statement = dbContext.connection.prepareStatement(query)) {
            statement.setString(1, item.getItem_name());
            statement.setString(2, item.getCategory());
            statement.setString(3, item.getPrice());
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
                items.add(item);
            }
        }
        return items;
    }

    // Update
    public void updateItem(Item item) throws SQLException {
        String query = "UPDATE Items SET item_name = ?, category = ?, price = ? WHERE item_id = ?";
        try (PreparedStatement statement = dbContext.connection.prepareStatement(query)) {
            statement.setString(1, item.getItem_name());
            statement.setString(2, item.getCategory());
            statement.setString(3, item.getPrice());
            statement.setString(4, item.getItem_id());
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
                }
            }
        }
        return item;
    }
//    public static void main(String[] args) {
//        try {
//            ItemDAO s = new ItemDAO();
//            List<Item> list = s.getAllItems();
//            System.out.println(list.get(0).getItem_name());
//        } catch (SQLException ex) {
//            Logger.getLogger(ItemDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}
