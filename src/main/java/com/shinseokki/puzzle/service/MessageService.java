package com.shinseokki.puzzle.service;


import java.util.Collection;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinseokki.puzzle.dao.MessageDao;
import com.shinseokki.puzzle.dto.Message;

@Service
public class MessageService {
	private MessageDao messageDao;
	
	@Autowired
	public MessageService(SqlSession sqlSession){
		messageDao = sqlSession.getMapper(MessageDao.class);
	}
	
	public int save(Message msg){
		
		int result = messageDao.save(msg);
		System.out.println(msg);
		return result;
	}
	public Message findByMsgID(int msgNum){
		return messageDao.findByMsgID(msgNum);
	}
	public Collection<Message> find(int receiverNum, int senderNum){
		return messageDao.find(receiverNum, senderNum);
	}
	
	public int updateMessage(int receiverNum, int senderNum){
		return messageDao.updateMessage(receiverNum, senderNum);
	}
	
	public Map<String, Integer> countMessagInfo(int receiverNum, int senderNum){
		return messageDao.countMessagInfo(receiverNum, senderNum);
	}
	
	
}
