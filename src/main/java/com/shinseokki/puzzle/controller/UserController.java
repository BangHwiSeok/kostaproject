package com.shinseokki.puzzle.controller;

import java.text.DateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.shinseokki.puzzle.dto.User;
import com.shinseokki.puzzle.service.UserService;

@RestController
@RequestMapping("/members")
public class UserController {
	private final static Logger logger = LoggerFactory.getLogger(UserController.class);
	private UserService userService;

	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}

	/*
	 * @param Model model - 기본적인 User 정보를 보여주기 위한 곳
	 * 
	 * @return String - 결과를 보여 주는 view
	 */
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		ModelAndView mav = new ModelAndView("members/adminUserView");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		
		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return mav;
	}

	// MyPage 보기 현재 자기의 정보를 볼 수 있다.
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)  
	public ModelAndView showMyPage(@PathVariable("id")String id){
		ModelAndView mav = new ModelAndView();
		
		
		
		return mav;
	}

	@RequestMapping(value = "/{id}/approval", method = RequestMethod.GET)
	public String approveUser(@PathVariable String id, Model model) {
		logger.info("User Approval Method : {}", id);
		return "";
	}

	/*
	 * @param int pageNo - Paging 처리를 위해 필요한 page number
	 * 
	 * @param Model model - Paging 결과를 보내기 위한 객체
	 * 
	 * @return String - Paging 결과를 보여 주는 view
	 */
	@RequestMapping("/list")
	public Collection<User> showUsers(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			Model model) {
		logger.info("User List Methd  Page Number : {}", pageNo);
		
		return userService.getUsers(pageNo);
	}

}
