package com.shinseokki.puzzle.advice;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.shinseokki.puzzle.dto.CurrentUser;

@ControllerAdvice
public class CurrentControllerAdvice {
	@ModelAttribute("currentUser")
	public CurrentUser getCurrentUser(Authentication authentication) {
    	System.out.println("CurrentUserControllerAdvice");
        return (authentication == null) ? null : (CurrentUser) authentication.getPrincipal();
    }

}
