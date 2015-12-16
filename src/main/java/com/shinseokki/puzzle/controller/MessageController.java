package com.shinseokki.puzzle.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shinseokki.puzzle.dao.MessageDao;
import com.shinseokki.puzzle.dto.Message;
import com.shinseokki.puzzle.dto.User;

@Controller
public class MessageController {
	
	private MessageDao messageDao; 
	
	@Autowired
	public MessageController(SqlSession sqlSession) {
		messageDao = sqlSession.getMapper(MessageDao.class);
	}
	
	@RequestMapping(value="/message", method=RequestMethod.POST)
	public String sendMsg(Integer sender, Integer receiver, String contents, Model model){
		
		Message message = new Message();
		message.setSender(sender);
		message.setReceiver(receiver);
		message.setContents(contents);
		
		
		/*System.out.println(sender);
		System.out.println(receiver);
		System.out.println(contents);*/
		messageDao.sendMsg(sender, receiver, contents);
		
		Message select = new Message();
		select.setSender(sender);
		select.setReceiver(receiver);
		
		model.addAttribute("message", messageDao.selectMsg(sender, receiver));
		
		return "members/MessageForm";
	}
	
	@RequestMapping(value="/messageform", method=RequestMethod.GET)
	public String viewMsg(){
		
		return "members/Message";
	}
}
