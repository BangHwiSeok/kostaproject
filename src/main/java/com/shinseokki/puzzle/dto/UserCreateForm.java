package com.shinseokki.puzzle.dto;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

public class UserCreateForm {
	
	public Role getU_role() {
		return u_role;
	}
	public void setU_role(Role u_role) {
		this.u_role = u_role;
	}
	@NotNull
	private String u_id;
	private String u_pwd;
	private String u_repwd;
	private Date u_birth;
	private String u_pnum;
	private String u_gender;
	private Role u_role = Role.ROLE_USER;
	private List<MultipartFile> photoes;
	
	public List<MultipartFile> getPhotoes() {
		return photoes;
	}
	public void setPhotoes(List<MultipartFile> photoes) {
		this.photoes = photoes;
	}
	@Override
	public String toString() {
		return "UserCreateForm [u_id=" + u_id + ", u_pwd=" + u_pwd + ", u_rePwd=" + u_repwd + ", u_birth=" + u_birth
				+ ", u_pnum=" + u_pnum + ", u_gender=" + u_gender + "]";
	}
	public String getU_pnum() {
		return u_pnum;
	}
	public void setU_pnum(String u_pnum) {
		this.u_pnum = u_pnum;
	}
	public String getU_gender() {
		return u_gender;
	}
	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}
	public Date getU_birth() {
		return u_birth;
	}
	public void setU_birth(Date u_birth) {
		this.u_birth = u_birth;
	}
	public String getU_repwd() {
		return u_repwd;
	}
	public void setU_repwd(String u_repwd) {
		this.u_repwd = u_repwd;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}

}
