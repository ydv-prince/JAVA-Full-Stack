package com.elearn.controller;

import com.elearn.model.Certificate;
import com.elearn.service.CertificateService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Optional;

@Controller
@RequestMapping("/certificate")
@RequiredArgsConstructor
public class PublicController {

    private final CertificateService certificateService;

    @GetMapping("/verify/{certNumber}")
    public String verifyCertificate(@PathVariable String certNumber, Model model) {
        Optional<Certificate> certOpt = certificateService.verifyCertificate(certNumber);
        
        if (certOpt.isPresent()) {
            model.addAttribute("valid", true);
            model.addAttribute("certificate", certOpt.get());
        } else {
            model.addAttribute("valid", false);
            model.addAttribute("certNumber", certNumber);
        }
        
        // Ye aapki student/certificate-verify.jsp file ko load karega
        return "student/certificate-verify";
    }
}