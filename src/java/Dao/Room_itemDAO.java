/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Model.Item;
import Model.room_item;
import dal.DBContext;
import java.sql.Connection;

/**
 *
 * @author DELL
 */
public class Room_itemDAO extends DBContext {

    private DBContext dbContext;

    public Room_itemDAO() {
        connectDB();
        dbContext = new DBContext();
    }
    Connection cnn; //ket noi db
    PreparedStatement stm; // thuc hien cac cau lenh sql
    ResultSet rs;//luu tru va xu ly du lieu

    private void connectDB() {
        cnn = connection;
        if (cnn != null) {
            System.out.println("connect succes");
        } else {
            System.out.println("connect fail");
        }
    }

    public room_item getItemByItem_id(int itemId, int roomId) throws SQLException {
        room_item item = null;
        String query = "SELECT * FROM Room_Item WHERE item_id = ? and room_id = ?";
        try (PreparedStatement statement = dbContext.connection.prepareStatement(query)) {
            statement.setInt(1, itemId);
            statement.setInt(2, roomId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    item = new room_item();
                    item.setId(resultSet.getString("id"));
                    item.setItem_id(resultSet.getString("item_id"));
                    item.setItem_name(resultSet.getString("item_name"));
                    item.setCategory(resultSet.getString("category"));
                    item.setPrice(resultSet.getString("price"));
                    item.setRoom_id(resultSet.getString("room_id"));

                }
            }
        }
        return item;
    }

    public boolean insertRoomItemIfNotExists(int itemId, int roomId) throws SQLException {
        String checkQuery = "SELECT COUNT(*) FROM room_item WHERE item_id = ? AND room_id = ?";
        String insertQuery = "INSERT INTO room_item (item_id, room_id) VALUES (?, ?)";

        try (Connection conn = dbContext.getConnection(); PreparedStatement checkStmt = conn.prepareStatement(checkQuery); PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {

            checkStmt.setInt(1, itemId);
            checkStmt.setInt(2, roomId);

            ResultSet rs = checkStmt.executeQuery();
            if (rs.next() && rs.getInt(1) == 0) {
                insertStmt.setInt(1, itemId);
                insertStmt.setInt(2, roomId);
                insertStmt.executeUpdate();
                return true;
            }
        }
        return false;
    }

    public List<room_item> getItemsByRoomId(int roomId) throws SQLException {
        List<room_item> roomItems = new ArrayList<>();
        String query = "SELECT * FROM room_item WHERE room_id = ?";

        try (Connection conn = dbContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, roomId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                room_item ri = new room_item();
                ri.setRoom_id(rs.getString("room_id"));
                roomItems.add(ri);
            }
        }
        return roomItems;
    }

    public void addItemRoom(String room_id, String item_id, String itemName, String category, String price, String quantity) throws SQLException {
        String query = "INSERT INTO Room_item ([item_id]\n"
                + "           ,[item_name]\n"
                + "           ,[category]\n"
                + "           ,[price]\n"
                + "           ,[room_id]\n"
                + "           ,[quantity]) VALUES (?, ?, ?, ?,?,?)";

        try (PreparedStatement statement = dbContext.connection.prepareStatement(query)) {

            statement.setString(1, item_id);
            statement.setString(2, itemName);
            statement.setString(3, category);
            statement.setString(4, price);
            statement.setString(5, room_id);
            statement.setString(6, quantity);

            statement.executeUpdate();
        }
    }

    public List<room_item> getAllRoom_Item() throws SQLException {
        List<room_item> itemRom = new ArrayList<>();
        String query = "SELECT * FROM Room_Item ";
        try (Statement statement = dbContext.connection.createStatement(); ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                room_item item = new room_item();
                item.setId(resultSet.getString("id"));
                item.setItem_id(resultSet.getString("item_id"));
                item.setItem_name(resultSet.getString("item_name"));
                item.setCategory(resultSet.getString("category"));
                item.setPrice(resultSet.getString("price"));
                item.setRoom_id(resultSet.getString("room_id"));
                item.setQuantity(resultSet.getString("quantity"));
                itemRom.add(item);
            }
        }
        return itemRom;
    }

    public List<room_item> getRoomById(String roomid) throws SQLException {
        List<room_item> itemRom = new ArrayList<>();

        try {
            String strSQL = "SELECT * FROM Room_Item where room_id =? ";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, roomid);
            rs = stm.executeQuery();
            while (rs.next()) {
                room_item item = new room_item();
                item.setId(rs.getString("id"));
                item.setItem_id(rs.getString("item_id"));
                item.setItem_name(rs.getString("item_name"));
                item.setCategory(rs.getString("category"));
                item.setPrice(rs.getString("price"));
                item.setRoom_id(rs.getString("room_id"));
                item.setQuantity(rs.getString("quantity"));
                itemRom.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return itemRom;
    }

    public room_item getDataById(String itemid, String roomid) {
        room_item item = null;

        try {
            String strSQL = "SELECT * FROM Room_Item where item_id =? and room_id = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, itemid);
            stm.setString(2, roomid);
            rs = stm.executeQuery();
            if (rs.next()) {
                item = new room_item();
                item.setId(rs.getString("id"));
                item.setItem_id(rs.getString("item_id"));
                item.setItem_name(rs.getString("item_name"));
                item.setCategory(rs.getString("category"));
                item.setPrice(rs.getString("price"));
                item.setRoom_id(rs.getString("room_id"));
                item.setQuantity(rs.getString("quantity"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return item;
    }

    public void updateQuantity(String roomid, String itemid, String quantity) {
        try {
            String strSQL = "Update room_item set quantity = ? where room_id = ? and item_id = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, quantity);
            stm.setString(3, itemid);
            stm.setString(2, roomid);
            rs = stm.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteRoomItem(String roomid, String itemid) {
        try {
            String strSQL = "delete from room_item  where room_id = ? and item_id = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, roomid);
            stm.setString(2, itemid);

            rs = stm.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
