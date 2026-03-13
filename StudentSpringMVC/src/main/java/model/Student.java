package model;

/**
 * Model class representing a Student entity.
 * Maps to the 'student' table in MySQL database.
 */
public class Student {

    private int id;
    private String name;
    private String email;
    private String course;

    // Default constructor
    public Student() {}

    // Parameterized constructor
    public Student(int id, String name, String email, String course) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.course = course;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getCourse() { return course; }
    public void setCourse(String course) { this.course = course; }

    @Override
    public String toString() {
        return "Student [id=" + id + ", name=" + name + ", email=" + email + ", course=" + course + "]";
    }
}
