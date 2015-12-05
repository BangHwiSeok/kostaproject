package com.shinseokki.puzzle.dto;

import org.springframework.web.multipart.MultipartFile;

public class ReportForm {
	
	private int rp_sendid;
	private int rp_id;
	private String rp_content;
	private MultipartFile photo;
	
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
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	
	
	
}
