package com.shinseokki.puzzle.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.WebRequestDataBinder;
import org.springframework.web.servlet.ModelAndView;

import com.shinseokki.puzzle.dto.UserCreateForm;
import com.shinseokki.puzzle.service.UserService;
import com.shinseokki.puzzle.validator.UserValidator;

@Controller
public class LoginController {
	private final static Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	// 회원 관련된 서비스를 제공하는 class
	private UserService userService;
	
	// 회원가입 폼의 Validate를 확인하는 class
	private UserValidator userValidator;
	
	@Autowired
	public LoginController(UserService userService, UserValidator userValidator) {
		logger.info("Created");
		this.userService = userService;
		this.userValidator = userValidator;
	}
	
	@InitBinder("userForm")
	public void bind(WebRequestDataBinder binder){
		binder.addValidators(userValidator);
		
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm(){
		return "logfinForm";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public ModelAndView joinForm(){
		logger.info("/join Get");
		ModelAndView mav = new ModelAndView("joinForm","userForm",new UserCreateForm());
		return mav;
	}
	
	/*
	 * @param UserCreateForm 회원가입 폼
	 * @return String 회원 가입한 후 연결되는 View
	 * @descirption
	 *    회원가입을 위한 Method로써 UserCreateForm를 폼으로 받으며 유효성 검사를 한다.
	 */
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinForm(@Valid @ModelAttribute("userForm") UserCreateForm userCreateForm,
			BindingResult bindingResult){
		logger.info("/join Post");
		
		// 입력한 form에 error가 있을 경우 다시 join form으로 돌아간다.
		if(bindingResult.hasErrors()){
			return "/join";
		}
		
		userService.addUser(userCreateForm);
		
		return "joinForm";
	}
	
}
