package com.elearn.controller;

import com.elearn.dto.CourseCreateDto;
import com.elearn.model.*;
import com.elearn.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Controller
@RequestMapping("/teacher")
@PreAuthorize("hasRole('TEACHER')")
@RequiredArgsConstructor
public class TeacherController {

    private final UserService userService;
    private final CourseService courseService;
    private final ModuleService moduleService;
    private final LessonService lessonService;
    private final EnrollmentService enrollmentService;
    private final QuizService quizService;
    private final AssignmentService assignmentService;
    private final PaymentService paymentService;
    private final CategoryService categoryService;

    // ── Helper: Get Current Logged-in Teacher ──
    private User getCurrentUser(UserDetails ud) {
        return userService.getUserByEmail(ud.getUsername());
    }

    @GetMapping("/dashboard")
    public String dashboard(@AuthenticationPrincipal UserDetails ud, Model model) {
        User teacher = getCurrentUser(ud);
        List<Course> courses = courseService.getCoursesByTeacher(teacher);
        List<Course> activeCourses = courses.stream()
                .filter(Course::isApproved)
                .toList();
        long totalStudents = enrollmentService.getTotalStudentsForTeacher(teacher.getId());
        BigDecimal earnings = paymentService.getTeacherEarnings(teacher);

        model.addAttribute("teacher", teacher);
        model.addAttribute("courses", courses);
        model.addAttribute("activeCourses", activeCourses);
        model.addAttribute("totalCourses", activeCourses.size());
        model.addAttribute("totalStudents", totalStudents);
        model.addAttribute("earnings", (earnings != null) ? earnings : BigDecimal.ZERO);
        model.addAttribute("pageTitle", "Instructor Dashboard");
        
        return "teacher/dashboard";
    }

    // ── 2. Course Management ──
    @GetMapping("/courses")
    public String manageCourses(@AuthenticationPrincipal UserDetails ud, Model model) {
        User teacher = getCurrentUser(ud);
        model.addAttribute("courses", courseService.getCoursesByTeacher(teacher));
        model.addAttribute("pageTitle", "Manage Courses");
        return "teacher/manage-courses";
    }

    @GetMapping("/courses/add")
    public String addCoursePage(Model model) {
        model.addAttribute("courseDto", new CourseCreateDto());
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("pageTitle", "Create Course");
        return "teacher/add-course";
    }

    @PostMapping("/courses/save")
    public String saveOrUpdateCourse(@ModelAttribute CourseCreateDto dto, @AuthenticationPrincipal UserDetails ud, RedirectAttributes ra) {
        try {
            Course course = courseService.createCourse(dto, ud.getUsername());
            ra.addFlashAttribute("successMsg", "Course saved! Now build your curriculum.");
            return "redirect:/teacher/courses/" + course.getId() + "/modules";
        } catch (Exception e) {
            ra.addFlashAttribute("errorMsg", "Error: " + e.getMessage());
            return "redirect:/teacher/courses/add";
        }
    }

    @GetMapping("/courses/edit/{courseId}")
    public String editCoursePage(@PathVariable Long courseId, Model model) {
        model.addAttribute("course", courseService.getCourseById(courseId));
        model.addAttribute("categories", categoryService.getAllCategories());
        return "teacher/add-course";
    }
    
    // FUNCTIONAL DELETE COURSE
    @PostMapping("/courses/delete/{courseId}")
    public String deleteCourse(@PathVariable Long courseId, @AuthenticationPrincipal UserDetails ud, RedirectAttributes ra) {
        try {
            User teacher = getCurrentUser(ud);
            
            // This calls your CourseService
            courseService.deleteCourse(courseId, teacher);
            
            ra.addFlashAttribute("successMsg", "Course deleted successfully!");
        } catch (Exception e) {
            // Convert error to string to check for the Database Constraint
            String errorMessage = e.getMessage() != null ? e.getMessage() : "";
            
            // If the error involves foreign keys (like the payments error you received)
            if (errorMessage.contains("foreign key constraint fails") || errorMessage.contains("ConstraintViolationException")) {
                ra.addFlashAttribute("errorMsg", "You cannot delete this course as student is enrolled in this course");
            } 
            // Or if your Service throws the manual ownership error you wrote
            else if (errorMessage.contains("You do not have permission to delete this course")) {
                ra.addFlashAttribute("errorMsg", "You cannot delete this course as student is enrolled in this course");
            }
            else {
                ra.addFlashAttribute("errorMsg", "Delete Failed: You cannot delete this course as student is enrolled in this course");
            }
            
            e.printStackTrace(); 
        }
        return "redirect:/teacher/courses";
    }

    // ── 3. Curriculum (Modules & Lessons) ──
    @GetMapping("/courses/{courseId}/modules")
    public String modulesPage(@PathVariable Long courseId, Model model) {
        model.addAttribute("course", courseService.getCourseById(courseId));
        model.addAttribute("modules", moduleService.getModulesByCourse(courseId));
        return "teacher/add-module-lesson";
    }

    @PostMapping("/courses/{courseId}/modules/add")
    public String addModule(@PathVariable Long courseId, @RequestParam String title, RedirectAttributes ra) {
        try {
            moduleService.createModule(courseId, title);
            ra.addFlashAttribute("successMsg", "Module added!");
        } catch (Exception e) {
            ra.addFlashAttribute("errorMsg", e.getMessage());
        }
        return "redirect:/teacher/courses/" + courseId + "/modules";
    }

    @PostMapping("/modules/{moduleId}/lessons/add")
    public String addLesson(@PathVariable Long moduleId, @RequestParam String title, @RequestParam int durationMinutes,
                            @RequestParam(required = false) String videoUrl, @RequestParam(required = false) String content,
                            @RequestParam(required = false) MultipartFile videoFile, @RequestParam(required = false) MultipartFile pdfFile,
                            RedirectAttributes ra) {
        try {
            CourseModule module = moduleService.getModuleById(moduleId);
            lessonService.createLessonWithFiles(moduleId, title, durationMinutes, videoUrl, content, videoFile, pdfFile);
            ra.addFlashAttribute("successMsg", "Lesson added successfully!");
            return "redirect:/teacher/courses/" + module.getCourse().getId() + "/modules";
        } catch (Exception e) {
            ra.addFlashAttribute("errorMsg", "Upload Error: " + e.getMessage());
            return "redirect:/teacher/courses/" + moduleId + "/modules";
        }
    }

    @PostMapping("/modules/delete/{moduleId}")
    public String deleteModule(@PathVariable Long moduleId, @RequestParam Long courseId, RedirectAttributes ra) {
        try {
            moduleService.deleteModule(moduleId);
            ra.addFlashAttribute("successMsg", "Module removed successfully.");
        } catch (Exception e) {
            ra.addFlashAttribute("errorMsg", "Delete failed: " + e.getMessage());
        }
        return "redirect:/teacher/courses/" + courseId + "/modules";
    }

    @PostMapping("/modules/update/{moduleId}")
    public String updateModule(@PathVariable Long moduleId, @RequestParam Long courseId, @RequestParam String title, RedirectAttributes ra) {
        try {
            moduleService.updateModule(moduleId, title);
            ra.addFlashAttribute("successMsg", "Module updated successfully.");
        } catch (Exception e) {
            ra.addFlashAttribute("errorMsg", "Update failed: " + e.getMessage());
        }
        return "redirect:/teacher/courses/" + courseId + "/modules";
    }

    @PostMapping("/lessons/update/{lessonId}")
    public String updateLesson(@PathVariable Long lessonId, @RequestParam Long courseId, @RequestParam String title, 
                               @RequestParam Integer durationMinutes, @RequestParam(required = false) String content,
                               @RequestParam(required = false) String videoUrl, RedirectAttributes ra) {
        try {
            lessonService.updateLesson(lessonId, title, durationMinutes, content, videoUrl);
            ra.addFlashAttribute("successMsg", "Lesson updated successfully.");
        } catch (Exception e) {
            ra.addFlashAttribute("errorMsg", "Lesson update failed: " + e.getMessage());
        }
        return "redirect:/teacher/courses/" + courseId + "/modules";
    }

    @PostMapping("/lessons/delete/{lessonId}")
    public String deleteLesson(@PathVariable Long lessonId, @RequestParam Long courseId, RedirectAttributes ra) {
        try {
            lessonService.deleteLesson(lessonId);
            ra.addFlashAttribute("successMsg", "Lesson deleted successfully!");
        } catch (Exception e) {
            ra.addFlashAttribute("errorMsg", "Failed to delete lesson: " + e.getMessage());
        }
        return "redirect:/teacher/courses/" + courseId + "/modules";
    }

    @GetMapping("/assignments")
    public String showAssignmentsCenter(@AuthenticationPrincipal UserDetails ud, Model model) {
        User teacher = getCurrentUser(ud);
        List<Assignment> assignments = assignmentService.getAssignmentsByTeacher(teacher);
        model.addAttribute("activeAssignments", assignments);
        model.addAttribute("submissions", assignmentService.getSubmissionsByTeacher(teacher));
        model.addAttribute("pageTitle", "Assessments");
        return "teacher/assignments"; 
    }

    @PostMapping("/assignments/save")
    public String saveAssignment(@RequestParam String title, @RequestParam String type, @RequestParam Long moduleId,
                                 @RequestParam Integer maxMarks, @RequestParam String dueDate,
                                 @RequestParam(required = false) String description, RedirectAttributes ra) {
        try {
            Assignment savedAsm = assignmentService.createAssignment(title, description, java.time.LocalDate.parse(dueDate), maxMarks, moduleId, type);
            if ("QUIZ".equalsIgnoreCase(type.trim())) {
                ra.addFlashAttribute("successMsg", "Quiz details saved. Now add your questions!");
                return "redirect:/teacher/assignments/" + savedAsm.getId() + "/questions";
            } else {
                ra.addFlashAttribute("successMsg", "Writing Task published successfully.");
                return "redirect:/teacher/courses/" + savedAsm.getModule().getCourse().getId() + "/modules";
            }
        } catch (Exception e) {
            ra.addFlashAttribute("errorMsg", "Failed to create assessment: " + e.getMessage());
            return "redirect:/teacher/dashboard"; 
        }
    }

    @GetMapping("/assignments/{assignmentId}/questions")
    public String showQuizBuilder(@PathVariable Long assignmentId, Model model) {
        Assignment assignment = assignmentService.getAssignmentById(assignmentId);
        model.addAttribute("assignment", assignment);
        model.addAttribute("questions", quizService.getQuestionsByAssignment(assignmentId));
        return "teacher/quiz-builder"; 
    }

    @GetMapping("/assignments/{assignmentId}/view")
    public String viewAssignment(@PathVariable Long assignmentId, @AuthenticationPrincipal UserDetails ud, Model model) {
        Assignment assignment = assignmentService.getAssignmentById(assignmentId);
        model.addAttribute("teacher", getCurrentUser(ud));
        model.addAttribute("assignment", assignment);
        model.addAttribute("questions", quizService.getQuestionsByAssignment(assignmentId));
        model.addAttribute("submissions", assignmentService.getSubmissionsByAssignment(assignmentId));
        return "teacher/assignment-view";
    }

    @GetMapping("/assignments/{assignmentId}/review")
    public String reviewAssignment(@PathVariable Long assignmentId, @AuthenticationPrincipal UserDetails ud, Model model) {
        Assignment assignment = assignmentService.getAssignmentById(assignmentId);
        model.addAttribute("teacher", getCurrentUser(ud));
        model.addAttribute("assignment", assignment);
        model.addAttribute("submissions", assignmentService.getSubmissionsByAssignment(assignmentId));
        return "teacher/review-assignments";
    }

    @PostMapping("/assignments/{assignmentId}/questions/add")
    public String addQuizQuestion(@PathVariable Long assignmentId, @RequestParam String questionText,
                                  @RequestParam String optionA, @RequestParam String optionB, @RequestParam String optionC,
                                  @RequestParam String optionD, @RequestParam String correctOption,
                                  @RequestParam Integer marks, RedirectAttributes ra) {
        try {
            quizService.addQuestion(assignmentId, questionText, optionA, optionB, optionC, optionD, correctOption, marks);
            ra.addFlashAttribute("successMsg", "Question Added!");
        } catch (Exception e) {
            ra.addFlashAttribute("errorMsg", "Error: " + e.getMessage());
        }
        return "redirect:/teacher/assignments/" + assignmentId + "/questions";
    }

    @PostMapping("/assignments/{assignmentId}/questions/update/{questionId}")
    public String updateQuizQuestion(@PathVariable Long assignmentId, @PathVariable Long questionId,
                                     @RequestParam String questionText, @RequestParam String optionA,
                                     @RequestParam String optionB, @RequestParam String optionC,
                                     @RequestParam String optionD, @RequestParam String correctOption,
                                     @RequestParam Integer marks, RedirectAttributes ra) {
        try {
            quizService.updateQuestion(questionId, questionText, optionA, optionB, optionC, optionD, correctOption, marks);
            ra.addFlashAttribute("successMsg", "Question updated successfully.");
        } catch (Exception e) {
            ra.addFlashAttribute("errorMsg", "Question update failed: " + e.getMessage());
        }
        return "redirect:/teacher/assignments/" + assignmentId + "/questions";
    }

    @PostMapping("/assignments/update/{assignmentId}")
    public String updateAssignment(@PathVariable Long assignmentId, @RequestParam String title,
                                   @RequestParam(required = false) String description, @RequestParam String dueDate,
                                   @RequestParam Integer maxMarks, RedirectAttributes ra) {
        try {
            Assignment assignment = assignmentService.getAssignmentById(assignmentId);
            assignmentService.updateAssignment(assignmentId, title, description, java.time.LocalDate.parse(dueDate), maxMarks);
            ra.addFlashAttribute("successMsg", "Assessment updated successfully.");
            return "redirect:/teacher/courses/" + assignment.getModule().getCourse().getId() + "/modules";
        } catch (Exception e) {
            ra.addFlashAttribute("errorMsg", "Assessment update failed: " + e.getMessage());
            return "redirect:/teacher/assignments/" + assignmentId + "/view";
        }
    }

    @PostMapping("/assignments/{assignmentId}/questions/delete/{questionId}")
    public String deleteQuizQuestion(@PathVariable Long assignmentId, @PathVariable Long questionId, RedirectAttributes ra) {
        try {
            quizService.deleteQuestion(questionId);
            ra.addFlashAttribute("successMsg", "Question deleted successfully.");
        } catch (Exception e) {
            ra.addFlashAttribute("errorMsg", "Question delete failed: " + e.getMessage());
        }
        return "redirect:/teacher/assignments/" + assignmentId + "/questions";
    }

    @GetMapping("/submissions/{submissionId}/download")
    public ResponseEntity<byte[]> downloadSubmission(@PathVariable Long submissionId) {
        AssignmentSubmission submission = assignmentService.findById(submissionId);
        if (submission.getFileData() == null || submission.getFileData().length == 0) {
            throw new RuntimeException("No file attached to this submission.");
        }
        String fileName = submission.getFileName() != null ? submission.getFileName() : "submission.bin";
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + new String(fileName.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1) + "\"")
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(submission.getFileData());
    }

    @GetMapping({"/earnings", "/revenue"})   
    public String detailedEarnings(@AuthenticationPrincipal UserDetails ud, Model model) {
        User teacher = getCurrentUser(ud);
        BigDecimal totalEarnings = paymentService.getTeacherEarnings(teacher);
        model.addAttribute("transactions", paymentService.getTeacherPayments(teacher));
        model.addAttribute("totalEarnings", (totalEarnings != null) ? totalEarnings : BigDecimal.ZERO);
        model.addAttribute("pageTitle", "Revenue"); 
        return "teacher/revenue"; 
    }

    @GetMapping("/courses/students")
    public String viewAllStudents(@AuthenticationPrincipal UserDetails ud, Model model) {
        User teacher = getCurrentUser(ud);
        List<Enrollment> enrollments = enrollmentService.getEnrollmentsByTeacher(teacher);
        model.addAttribute("enrollments", enrollments);
        model.addAttribute("totalStudents", enrollments.size());
        model.addAttribute("pageTitle", "Manage Students"); 
        return "teacher/enrolled-students";
    }
    
    @PostMapping("/assignments/delete/{assignmentId}")
    public String deleteAssignment(@PathVariable Long assignmentId, RedirectAttributes ra) {
        try {
            Assignment assignment = assignmentService.getAssignmentById(assignmentId);
            Long courseId = assignment.getModule().getCourse().getId();
            assignmentService.deleteAssignment(assignmentId);
            ra.addFlashAttribute("successMsg", "Assessment deleted successfully.");
            return "redirect:/teacher/courses/" + courseId + "/modules";
        } catch (Exception e) {
            ra.addFlashAttribute("errorMsg", "Failed to delete: " + e.getMessage());
            return "redirect:/teacher/assignments";
        }
    }

    @PostMapping("/assignments/grade/{submissionId}")
    public String gradeAssignment(@PathVariable Long submissionId, @RequestParam int marks, @RequestParam String feedback, RedirectAttributes ra) {
        AssignmentSubmission submission = assignmentService.findById(submissionId);
        assignmentService.gradeSubmission(submissionId, marks, feedback);
        ra.addFlashAttribute("successMsg", "Student graded successfully!");
        return "redirect:/teacher/assignments/" + submission.getAssignment().getId() + "/review";
    }

    @GetMapping("/profile")
    public String profilePage(@AuthenticationPrincipal UserDetails ud, Model model) {
        model.addAttribute("teacher", getCurrentUser(ud));
        model.addAttribute("pageTitle", "Teacher Profile");
        return "teacher/profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@AuthenticationPrincipal UserDetails ud, @RequestParam String fullName,
                                @RequestParam(required = false) String bio, @RequestParam(required = false) String phone,
                                @RequestParam(required = false) MultipartFile profileImage, RedirectAttributes ra) {
        try {
            User teacher = getCurrentUser(ud);
            userService.updateProfile(teacher.getId(), fullName, bio, phone, profileImage);
            ra.addFlashAttribute("successMsg", "Profile Updated Successfully!");
        } catch (Exception e) {
            ra.addFlashAttribute("errorMsg", "Failed to update profile: " + e.getMessage());
        }
        return "redirect:/teacher/profile";
    }
}