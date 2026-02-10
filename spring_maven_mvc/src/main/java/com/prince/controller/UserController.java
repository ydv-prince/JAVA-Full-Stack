package com.prince.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.prince.dao.UserDao;
import com.prince.model.User;
import org.springframework.stereotype.Controller;

@Controller
public class UserController {
	private final UserDao dao;
	public UserController(UserDao dao) {
		this.dao = dao;
	}
@GetMapping("/")
public String home(Model m) {
	m.addAttribute("list", dao.getAll());
	return "home";
}

@PostMapping("/save")
public String save(@ModelAttribute User u) {
	dao.save(u);
	return "redirect:/";
}
}
