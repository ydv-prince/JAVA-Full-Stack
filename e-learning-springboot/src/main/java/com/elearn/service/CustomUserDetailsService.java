package com.elearn.service;

import com.elearn.model.User;
import com.elearn.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

        User user = userRepository.findByEmail(email)
                .orElseThrow(() ->
                    new UsernameNotFoundException("User not found: " + email));

        // Role ke saath "ROLE_" prefix lagana zaroori hai Spring Security mein
        SimpleGrantedAuthority authority =
                new SimpleGrantedAuthority("ROLE_" + user.getRole().name());

        return new org.springframework.security.core.userdetails.User(
                user.getEmail(),
                user.getPassword(),
                user.isEnabled(),        // enabled
                true,                    // accountNonExpired
                true,                    // credentialsNonExpired
                true,                    // accountNonLocked
                List.of(authority)
        );
    }
}