package com.maven.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/notes_app",
                "root",
                "12345"   
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}