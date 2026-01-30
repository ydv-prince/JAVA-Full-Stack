package com.prince.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

public class LoginController {
	@GetMapping("/login")
	public String loginpage() {
		return "login";
	}
	
	//Handle login page code
	@PostMapping("/doLogin")
	public String doLogin(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session, Model model) {
		if(username.equals("admin") && password.equals("12345")) {
			session.setAttribute("User", username);
			return "redirect:/dashboard";
		}
		else {
			model.addAttribute("error", "inalid username or password");
			return "login";
		}
	}
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session) {
		if(session.getAttribute("user") == null) {
			return "redirect:/login";
		}
		return "dashboard";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
}
