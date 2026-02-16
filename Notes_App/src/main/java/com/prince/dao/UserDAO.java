package com.prince.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.prince.model.User;
import com.prince.util.DBConnection;

public class UserDAO {

    // REGISTER METHOD 
    public boolean register(User user) {
        boolean status = false;
        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO users(username,password) VALUES(?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());

            ps.executeUpdate();
            status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // LOGIN METHOD ⭐
    public User login(String username, String password) {
        User user = null;
        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
