package com.shinseokki.puzzle.dto;

import java.sql.Date;

public class Report {
	
	private int rp_num;
	private int rp_sendid;
	private int rp_id;
	private String rp_content;
	private Date rp_date;
	private String rp_file;
	private String rp_check;
	
	
	public int getRp_num() {
		return rp_num;
	}


	public void setRp_num(int rp_num) {
		this.rp_num = rp_num;
	}


	public int getRp_sendid() {
		return rp_sendid;
	}


	public void setRp_sendid(int rp_sendid) {
		this.rp_sendid = rp_sendid;
	}


	public int getRp_id() {
		return rp_id;
	}


	public void setRp_id(int rp_id) {
		this.rp_id = rp_id;
	}


	public String getRp_content() {
		return rp_content;
	}


	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}


	public Date getRp_date() {
		return rp_date;
	}


	public void setRp_date(Date rp_date) {
		this.rp_date = rp_date;
	}


	public String getRp_file() {
		return rp_file;
	}


	public void setRp_file(String rp_file) {
		this.rp_file = rp_file;
	}


	public String getRp_check() {
		return rp_check;
	}


	public void setRp_check(String rp_check) {
		this.rp_check = rp_check;
	}


	@Override
	public String toString() {
		return "Report [rp_num=" + rp_num + ", rp_sendid=" + rp_sendid + ", rp_id=" + rp_id + ", rp_content="
				+ rp_content + ", rp_date=" + rp_date + ", rp_file=" + rp_file + ", rp_check=" + rp_check + "]";
	}
	
	
	
	
	
	
}
