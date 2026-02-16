package com.prince.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.prince.model.Note;
import com.prince.util.DBConnection;

public class NoteDAO {

    // ADD NOTE
    public void addNote(Note note) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO notes(title,content,user_id) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, note.getTitle());
            ps.setString(2, note.getContent());
            ps.setInt(3, note.getUserId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
 // UPDATE NOTE ⭐
    public void updateNote(Note note) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE notes SET title=?, content=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, note.getTitle());
            ps.setString(2, note.getContent());
            ps.setInt(3, note.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // GET SINGLE NOTE BY ID (For Edit Page) ⭐
    public Note getNoteById(int id) {
        Note n = null;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM notes WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                n = new Note();
                n.setId(rs.getInt("id"));
                n.setTitle(rs.getString("title"));
                n.setContent(rs.getString("content"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return n;
    }

    // GET ALL NOTES OF LOGGED USER
    public List<Note> getNotesByUser(int userId) {

        List<Note> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM notes WHERE user_id=? ORDER BY id DESC";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Note n = new Note();
                n.setId(rs.getInt("id"));
                n.setTitle(rs.getString("title"));
                n.setContent(rs.getString("content"));
                n.setUserId(rs.getInt("user_id"));

                list.add(n);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // DELETE NOTE
    public void deleteNote(int id) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM notes WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
