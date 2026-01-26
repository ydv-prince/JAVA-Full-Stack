package com.socialmedia.dashboard;

public class Post {

    private int id;
    private String author;
    private String content;
    private String time;

    public Post(int id, String author, String content, String time) {
        this.id = id;
        this.author = author;
        this.content = content;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public String getAuthor() {
        return author;
    }

    public String getContent() {
        return content;
    }

    public String getTime() {
        return time;
    }
}