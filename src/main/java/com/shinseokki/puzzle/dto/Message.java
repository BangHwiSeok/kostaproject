package com.shinseokki.puzzle.dto;

import oracle.sql.DATE;

public class Message {
	
	public int u_num;
	public int MessageId;
	public String receiver;
	public String sender;
	public String contents;
	public DATE regdate;
	
	
	public DATE getRegdate() {
		return regdate;
	}

	public void setRegdate(DATE regdate) {
		this.regdate = regdate;
	}
	
	public String getContents() {
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public int getU_num() {
		return u_num;
	}
	
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	
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
	
	
}
