/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Tranh
 */
public class DBContext {

    protected Connection connection;
    protected PreparedStatement ps;
    protected ResultSet rs;

    public Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=DB_GroceryStore";
            String username = "sa";
            String password = "123";
            connection = DriverManager.getConnection(url, username, password);
            return connection;
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage() + " at DBContext");
            return null;
        }
    }
}
