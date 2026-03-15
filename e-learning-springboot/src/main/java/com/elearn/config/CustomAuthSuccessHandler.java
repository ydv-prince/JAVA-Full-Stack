package com.elearn.config;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Collection;

@Component
public class CustomAuthSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(
            HttpServletRequest request,
            HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {

        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        String redirectUrl = null;

        // Role check logic
        for (GrantedAuthority authority : authorities) {
            String role = authority.getAuthority();

            if (role.equals("ROLE_ADMIN")) {
                redirectUrl = "/admin/dashboard";
                break;
            } else if (role.equals("ROLE_TEACHER")) {
                redirectUrl = "/teacher/dashboard";
                break;
            } else if (role.equals("ROLE_STUDENT")) {
                redirectUrl = "/student/dashboard";
                break;
            }
        }

        // Agar koi valid role nahi mila toh default home par bhej do
        if (redirectUrl == null) {
            redirectUrl = "/home";
        }

        // Redirection execute karo
        response.sendRedirect(request.getContextPath() + redirectUrl);
    }
}