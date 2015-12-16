package com.shinseokki.puzzle.dao;

import java.util.Collection;
import java.util.Map;

import com.shinseokki.puzzle.dto.Message;

public interface MessageDao {
	public int save(Message msg);
	public Message findByMsgID(int msgNum);
	public Collection<Message> find(int receiverNum, int senderNum);
	public int updateMessage(int receiverNum, int senderNum);
	public Map<String, Integer> countMessagInfo(int receiverNum, int senderNum);
	
	
	
	
}
