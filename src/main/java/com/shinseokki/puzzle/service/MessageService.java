package com.shinseokki.puzzle.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.shinseokki.puzzle.dao.MessageDao;
import com.shinseokki.puzzle.dto.Message;

import oracle.sql.DATE;

public class MessageService {
private MessageDao messageDao;
	
	@Autowired
	public MessageService(SqlSession sqlSession){
		messageDao = sqlSession.getMapper(MessageDao.class);
	}
	
	
	public int SendMessage(Message MessageId){
		return messageDao.SendMessage(MessageId);
	}
	
	public int receiver(String receiver){
		return messageDao.receiver(receiver);
	}
	
	public int sender(String sender){
		return messageDao.sender(sender);
	}
	
	public int contents(String contents){
		return messageDao.contents(contents);
	}
	
	public List<Message> getDate(int MessageId, DATE regdate){
		return messageDao.getDate(MessageId, regdate);
	}
	
}
