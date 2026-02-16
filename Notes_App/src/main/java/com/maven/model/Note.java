package com.maven.model;

public class Note {
    private int id;
    private String title;
    private String content;
    private int userId;

    public Note() {}

    public Note(String title, String content, int userId) {
        this.title = title;
        this.content = content;
        this.userId = userId;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
}