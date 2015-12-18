package com.shinseokki.puzzle.controller;


import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

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

import com.shinseokki.puzzle.dto.CurrentUser;
import com.shinseokki.puzzle.dto.Message;
import com.shinseokki.puzzle.service.MessageService;
import com.shinseokki.puzzle.service.ProfileService;

/**
 * Handles requests for the application home page.
 */
@RestController
@RequestMapping("/messages")
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	private MessageService messageService;
	private ProfileService profileService;
	@Autowired
	public MessageController(MessageService messageService, ProfileService profileService) {
		this.messageService = messageService;
		this.profileService = profileService;
	
	}
	// 받는 곳
	@RequestMapping(value="/{id}", method=RequestMethod.GET)
	public ModelAndView messageHome(@PathVariable Integer id, CurrentUser user, Model model){
		logger.info("Come in User {}",user.getId());
		// messages 이름으로 model에 저장
		ModelAndView mav = new ModelAndView("messages/message");
		
		mav.addObject("messages",messageService.find(id, user.getUserNum()));
		System.out.println(messageService.find(id, user.getUserNum()));
		// 상대방이 보낸 쪽지는 모두 읽음 표시 한다. 현재 접속한 사람이 receiver로 한다.
		messageService.updateMessage(user.getUserNum(), id);
		
		mav.addObject("my",user.getUserNum());
		mav.addObject("profiles",profileService.find(id));
		mav.addObject("you",id);
		
		return mav;
	}
	
	// 보내는 곳
	@RequestMapping(value="/{id}", method=RequestMethod.POST)
	public Map<String, Object> sendMessage(@PathVariable Integer id, @RequestParam String contents, CurrentUser user, Model model){
		logger.info("Come in User {}",user.getId());
		
		// enter를 입력한 부분을 기준으로 <p></p>로 감싸준다.
			// -> jsp에 출력될 때, '\n'가 사라지기 때문.
		StringBuilder sb = new StringBuilder("");
		Arrays.asList(contents.split("\n")).forEach( (content) ->{
			sb.append("<p>"+content+"</p>");
		});
		
		
		// messages 이름으로 model에 저장
		Message msg = new Message (id,user.getUserNum(),sb.toString());
		boolean saved = messageService.save(msg) > 0 ? true : false;
		Map<String, Object> returnValue = new HashMap<>();
		logger.info(msg.toString());
		msg = messageService.findByMsgID(msg.getMsgNum());
		returnValue.put("callback",saved);
		returnValue.put("msg", msg);
		
		return returnValue;
	}
	
		
	
	
	
}
