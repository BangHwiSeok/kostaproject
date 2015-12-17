package com.shinseokki.puzzle.dto;

import java.sql.Date;

public class History {
	private int h_seqnum;
	private int u_num;
	private int h_num;
	private Date h_regdate;
	
	public int getH_seqnum() {
		return h_seqnum;
	}
	public void setH_seqnum(int h_seqnum) {
		this.h_seqnum = h_seqnum;
	}
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public int getH_num() {
		return h_num;
	}
	public void setH_num(int h_num) {
		this.h_num = h_num;
	}
	public String getH_regdate() {
		long regTime = h_regdate.getTime() + 86400*1000*7;
		long time = regTime - System.currentTimeMillis();
		long hour = (time / 1000 / 60 / 60);
		long min = (time / 1000 / 60 ) % 60;
		String strTime = hour+":"+ min;
		Date date = null;
			date =  new Date(time);
			System.out.println(strTime);
			
		return strTime;
	}
	public void setH_regdate(Date h_regdate) {
		this.h_regdate = h_regdate;
	}
	
	@Override
	public String toString() {
		return "History [h_seqnum=" + h_seqnum + ", u_num=" + u_num + ", h_num=" + h_num + ", h_regdate=" + h_regdate
				+ "]";
	}
	
	
}
