package com.gmail.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gmail.model.User;
import com.gmail.service.EmailService;
@Controller
public class UserController {
	@Autowired
	private EmailService emailService;
	
@GetMapping("/")
public String showForm(Model model) {
	model.addAttribute("user", new User());
	return "User-form";
}
@PostMapping("/register")
public String registerUser(@ModelAttribute User user, @RequestParam("file") MultipartFile file) {
	emailService.sendEmail(user.getEmail(),user.getName());
	
	emailService.sendEmailWithAttachment(
            user.getEmail(),
            user.getName(),
            file
    );
	return "redirect:/";
}
}