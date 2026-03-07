package com.rahul.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class HomeController {

    // Home Page
    @GetMapping("/")
    public String home() {
        return "index";
    }
    
 // About page mapping
    @GetMapping("/about")
    public String about() {
        return "about";  // about.jsp
    }

    // Show Login Page
    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    // Handle Login
    @PostMapping("/login")
    public String loginUser(@RequestParam("role") String role,
                            @RequestParam("email") String email,
                            @RequestParam("password") String password,
                            Model model) {

        if(role == null || role.isEmpty()) {
            model.addAttribute("error", "Please select role!");
            return "login";
        }

        switch (role) {

            case "student":
                return "redirect:/student";

            case "teacher":
                return "redirect:/teacher";

            case "admin":
                return "redirect:/admin";

            default:
                model.addAttribute("error", "Invalid Login!");
                return "login";
        }
    }

    // Register Page
    @GetMapping("/register")
    public String showRegisterPage() {
        return "register";
    }
 // Forgot password page
    @GetMapping("/forget")
    public String forget() {
        return "forgot-password"; // returns the JSP page forgot-password.jsp
    }
    // courde-detaild
    @GetMapping("/course")
    public String courses() {
    	return "course-details";
    }
    @GetMapping("/courses")
    public String coursese() {
    	return "courses";
    }

    // Student Dashboard
    @GetMapping("/student")
    public String studentDashboard() {
        return "student-dashboard";
    }

    // Teacher Dashboard
    @GetMapping("/teacher")
    public String teacherDashboard() {
        return "teacher-dashboard";
    }

    // Admin Dashboard
    @GetMapping("/admin")
    public String adminDashboard() {
        return "admin-dashboard";
    }

    // =========================
    // ✅ NEW STUDENT PAGE LINKS
    // =========================

    @GetMapping("/student/courses")
    public String studentCourses() {
        return "student-courses";
    }

    @GetMapping("/student/assignments")
    public String studentAssignments() {
        return "student-assignments";
    }
    
    @GetMapping("/student/allcourses")
    public String studentallcourses() {
        return "student-allcourses";
    }

    @GetMapping("/student/quiz")
    public String studentQuiz() {
        return "student-quiz";
    }

    @GetMapping("/student/quiz-result")
    public String studentQuizResult() {
        return "student-quiz-result";
    }

    @GetMapping("/student/progress")
    public String studentProgress() {
        return "student-progress";
    }

    @GetMapping("/student/certificate")
    public String studentCertificate() {
        return "student-certificate";
    }

    @GetMapping("/student/profile")
    public String studentProfile() {
        return "student-profile";
    }

    @GetMapping("/student/course-details")
    public String courseDetails() {
        return "course-details";
    }
 // Static Payment Page for students
    @GetMapping("/student/payment")
    public String studentPayment() {
        return "student-payment";  // this should match the JSP file name
    }
 // ================= TEACHER PAGES =================

    @GetMapping("/teacher/add-course")
    public String addCourse() {
        return "teacher-add-course";
    }
    @GetMapping("/teacher/courses")
    public String myCourse() {
        return "teacher-courses";
    }

    @GetMapping("/teacher/students")
    public String teacherStudents() {
        return "teacher-students";
    }

    @GetMapping("/teacher/assignments")
    public String teacherAssignments() {
        return "teacher-assignments";
    }

    @GetMapping("/teacher/quizzes")
    public String teacherQuizzes() {
        return "teacher-quizzes";
    }

    @GetMapping("/teacher/profile")
    public String teacherProfile() {
        return "teacher-profile";
    }
    
 // ================= ADMIN PANEL PAGES =================

 // Manage Students
 @GetMapping("/admin-manage-students")
 public String adminManageStudents() {
     return "admin-manage-students";
 }

 // Add Student
 @GetMapping("/admin-add-student")
 public String adminAddStudent() {
     return "admin-add-student";
 }

 // Edit Student
 @GetMapping("/admin-edit-student")
 public String adminEditStudent() {
     return "admin-edit-student";
 }


 // ================= TEACHERS =================

 // Manage Teachers
 @GetMapping("/admin-manage-teachers")
 public String adminManageTeachers() {
     return "admin-manage-teachers";
 }

 // Add Teacher
 @GetMapping("/admin-add-teacher")
 public String adminAddTeacher() {
     return "admin-add-teacher";
 }

 // Edit Teacher
 @GetMapping("/admin-edit-teacher")
 public String adminEditTeacher() {
     return "admin-edit-teacher";
 }


 // ================= COURSES =================

 // Manage Courses
 @GetMapping("/admin-manage-courses")
 public String adminManageCourses() {
     return "admin-manage-courses";
 }

 // Add Course
 @GetMapping("/admin-add-course")
 public String adminAddCourse() {
     return "admin-add-course";
 }

 // Edit Course
 @GetMapping("/admin-edit-course")
 public String adminEditCourse() {
     return "admin-edit-course";
 }


 // ================= ASSIGNMENTS =================

 @GetMapping("/admin-manage-assignments")
 public String adminManageAssignments() {
     return "admin-manage-assignments";
 }

 @GetMapping("/admin-add-assignment")
 public String adminAddAssignment() {
     return "admin-add-assignment";
 }

 @GetMapping("/admin-edit-assignment")
 public String adminEditAssignment() {
     return "admin-edit-assignment";
 }


 // ================= QUIZZES =================

 @GetMapping("/admin-manage-quizzes")
 public String adminManageQuizzes() {
     return "admin-manage-quizzes";
 }

 @GetMapping("/admin-add-quiz")
 public String adminAddQuiz() {
     return "admin-add-quiz";
 }

 @GetMapping("/admin-edit-quiz")
 public String adminEditQuiz() {
     return "admin-edit-quiz";
 }


 // ================= PAYMENTS =================

 @GetMapping("/admin-manage-payments")
 public String adminManagePayments() {
     return "admin-manage-payments";
 }


 // ================= REPORTS =================

 @GetMapping("/admin-reports")
 public String adminReports() {
     return "admin-reports";
 }


 // ================= SETTINGS =================

 @GetMapping("/admin-settings")
 public String adminSettings() {
     return "admin-settings";
 }

}