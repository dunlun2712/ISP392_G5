package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
<<<<<<< HEAD

=======
>>>>>>> 6d143ca (code merge)
/**
 *
 * @author FPT University - PRJ30X
 */
public class DBContext {
<<<<<<< HEAD
    protected Connection connection;
    public DBContext()
    {
=======

    public Connection connection;

    public DBContext() {
>>>>>>> 6d143ca (code merge)
        //@Students: You are allowed to edit user, pass, url variables to fit 
        //your system configuration
        //You can also add more methods for Database Interaction tasks. 
        //But we recommend you to do it in another class
        // For example : StudentDBContext extends DBContext , 
        //where StudentDBContext is located in dal package, 
        try {
            String user = "sa";
            String pass = "123";
            String url = "jdbc:sqlserver://DUNLUN2712:1433;databaseName=ISP392";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

<<<<<<< HEAD
   public Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:sqlserver://DESKTOP-5HNAFHV\\DOANHUNG:1433;databaseName=ISP392", "sa", "123");
=======
//    public Connection getConnection() throws SQLException {
//        return DriverManager.getConnection("jdbc:sqlserver://DESKTOP-5HNAFHV\\DOANHUNG:1433;databaseName=ISP392", "sa", "123");
//    }

    public Connection getConnection() {
        return connection;
    }

    public static void main(String[] args) {
        System.out.println(new DBContext().connection);
>>>>>>> 6d143ca (code merge)
    }
}
