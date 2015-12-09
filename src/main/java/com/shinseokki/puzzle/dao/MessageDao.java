package com.shinseokki.puzzle.dao;

import java.util.List;

import com.shinseokki.puzzle.dto.Message;
import com.shinseokki.puzzle.dto.User;

import oracle.sql.DATE;

public interface MessageDao {
	public int SendMessage(Message MessageId);
	public int receiver(String receiver);
	public int sender(String sender);
	public int contents(String contents);
	public List<Message> getDate(int MessageId, DATE regdate);
	
	
	
}
