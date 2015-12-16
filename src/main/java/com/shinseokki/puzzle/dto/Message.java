package com.shinseokki.puzzle.dto;

import java.sql.Date;

public class Message {
	private int msgNum;
	private int receiver;
	private int sender;
	private String contents;
	private int isRead;
	private Date regdate;
	
	public Message(){
		
	}
	
	public Message(int receiver, int sender,String contents){
		this.receiver = receiver;
		this.sender = sender;
		this.contents = contents;
	}
	
	public int getMsgNum() {
		return msgNum;
	}
	public void setMsgNum(int msgNum) {
		this.msgNum = msgNum;
	}
	public int getReceiver() {
		return receiver;
	}
	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getIsRead() {
		return isRead;
	}
	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Message [msgNum=" + msgNum + ", receiver=" + receiver + ", sender=" + sender + ", contents=" + contents
				+ ", isRead=" + isRead + ", regdate=" + regdate + "]";
	}
	
	
	
}
