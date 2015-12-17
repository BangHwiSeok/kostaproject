package com.shinseokki.puzzle.dto;

import java.util.Collection;

public class HistoryInfo {
	private History history;
	private Collection<Profile> profiles;
	private int unReadNum;
	private int receivedNum;
	private int sendedNum;
	public History getHistory() {
		return history;
	}
	public void setHistory(History history) {
		this.history = history;
	}
	public Collection<Profile> getProfiles() {
		return profiles;
	}
	public void setProfiles(Collection<Profile> profiles) {
		this.profiles = profiles;
	}
	public int getUnReadNum() {
		return unReadNum;
	}
	public void setUnReadNum(int unReadNum) {
		this.unReadNum = unReadNum;
	}
	public int getReceivedNum() {
		return receivedNum;
	}
	public void setReceivedNum(int receivedNum) {
		this.receivedNum = receivedNum;
	}
	public int getSendedNum() {
		return sendedNum;
	}
	public void setSendedNum(int sendedNum) {
		this.sendedNum = sendedNum;
	}
	@Override
	public String toString() {
		return "HistoryInfo [history=" + history + ", profiles=" + profiles + ", unReadNum=" + unReadNum
				+ ", receivedNum=" + receivedNum + ", sendedNum=" + sendedNum + "]";
	}
	
	
	
}
