package com.gmail.service;

import org.springframework.web.multipart.MultipartFile;

public interface EmailService {

    void sendEmail(String to, String name);

    void sendEmailWithAttachment(String to, String name, MultipartFile file);

}