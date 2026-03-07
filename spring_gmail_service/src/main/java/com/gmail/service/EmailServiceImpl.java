package com.gmail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Override
    public void sendEmail(String to, String name) {

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject("Welcome");
        message.setText("Hello " + name + ",\n\nWelcome");
        message.setFrom("USER_MAIL");

        mailSender.send(message);
        System.out.println("Simple email sent successfully");
    }

    @Override
    public void sendEmailWithAttachment(String to, String name, MultipartFile file) {

    		if (file == null || file.isEmpty()) {
                throw new RuntimeException("Attachment file is empty or missing");
            }

            try {
                MimeMessage message = mailSender.createMimeMessage();

                MimeMessageHelper helper =
                        new MimeMessageHelper(message, true);

                helper.setTo(to);
                helper.setSubject("Hello " + name);
                helper.setText("Please find the attached document.");
                helper.setFrom("USER_MAIL");

                helper.addAttachment(
                        file.getOriginalFilename(),
                        file
                );

                mailSender.send(message);
                System.out.println("Email with attachment sent successfully");

            } catch (MessagingException e) {
                throw new RuntimeException(
                        "Failed to send email with attachment", e);
            }
    	}
    	
}