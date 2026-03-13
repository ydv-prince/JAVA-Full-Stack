package controller;

import dao.StudentDAO;
import model.Student;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Spring MVC Controller class that handles HTTP requests
 * for the StudentSpringMVC application.
 *
 * URL Mappings:
 *   GET  /form      -> Show the student registration form
 *   POST /saveStudent -> Save student to database
 *   GET  /students  -> Display all students from database
 */
@Controller
public class StudentController {

    // DAO instance for database operations
    private StudentDAO studentDAO = new StudentDAO();

    /**
     * Handles GET /form
     * Adds an empty Student object to the model so the JSP form can bind to it.
     */
    @RequestMapping(value = "/form", method = RequestMethod.GET)
    public String showForm(Model model) {
        model.addAttribute("student", new Student());
        return "studentForm"; // resolves to /WEB-INF/views/studentForm.jsp
    }

    /**
     * Handles POST /saveStudent
     * Receives form data via @ModelAttribute, calls DAO to insert, then redirects.
     */
    @RequestMapping(value = "/saveStudent", method = RequestMethod.POST)
    public String saveStudent(@ModelAttribute("student") Student student, Model model) {
        boolean result = studentDAO.insertStudent(student);
        if (result) {
            model.addAttribute("message", "Student Record Inserted Successfully!");
        } else {
            model.addAttribute("message", "Error: Could not insert record. Check if ID already exists.");
        }
        return "success"; // resolves to /WEB-INF/views/success.jsp
    }

    /**
     * Handles GET /students
     * Fetches all students via DAO and sends list to studentList.jsp.
     */
    @RequestMapping(value = "/students", method = RequestMethod.GET)
    public String listStudents(Model model) {
        List<Student> students = studentDAO.getAllStudents();
        model.addAttribute("studentList", students);
        return "studentList"; // resolves to /WEB-INF/views/studentList.jsp
    }
}
