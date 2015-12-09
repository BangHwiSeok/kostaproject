package com.shinseokki.puzzle.dto;

import oracle.sql.DATE;

public class Message {
	
	public int MessageId;
	public String receiver;
	public String sender;
	public String contents;
	public DATE regdate;
	
	public int getMessageId() {
		return MessageId;
	}
	public void setMessageId(int messageId) {
		MessageId = messageId;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getComtents() {
		return contents;
	}
	public void setComtents(String comtents) {
		this.contents = comtents;
	}
	public DATE getRegdate() {
		return regdate;
	}
	public void setRegdate(DATE regdate) {
		this.regdate = regdate;
	}
	
	
}
