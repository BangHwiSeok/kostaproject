package com.shinseokki.puzzle.advice;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ExceptionHandlerControllerAdvice {
	
	@ExceptionHandler
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handleExceptiond(NoHandlerFoundException ex) {
	    return "exception";
	}
}
