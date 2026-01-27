package com.prince.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

public class HomeController {
	
	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("msg", "Spring MVC maven demo");
		return "home";
	}

}
