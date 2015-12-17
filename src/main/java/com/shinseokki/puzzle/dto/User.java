package com.shinseokki.puzzle.dto;

import java.io.Serializable;
import java.sql.Date;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1598508292332127400L;
	
	private String u_id;
	private String u_pwd;
	private String u_pnum;
	private String u_gender;
	private Date u_birth;
	private int u_num;
	private Date u_regdate;
	private Role u_role;
	private int u_point;
	private int u_msgnum;
	private int u_sernum;
	private int u_msgitem;
	private int u_keyitem;
	private int u_seritem;
	private int u_msgactive;
	private int u_active;

	

	

	
	
	
	
	
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
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public Date getU_regdate() {
		return u_regdate;
	}
	public void setU_regdate(Date u_regdate) {
		this.u_regdate = u_regdate;
	}
	public Role getU_role() {
		return u_role;
	}
	public void setU_role(Role u_role) {
		this.u_role = u_role;
	}
	public int getU_point() {
		return u_point;
	}
	public void setU_point(int u_point) {
		this.u_point = u_point;
	}
	public int getU_msgnum() {
		return u_msgnum;
	}
	public void setU_msgnum(int u_msgnum) {
		this.u_msgnum = u_msgnum;
	}
	public int getU_sernum() {
		return u_sernum;
	}
	public void setU_sernum(int u_sernum) {
		this.u_sernum = u_sernum;
	}
	public int getU_msgitem() {
		return u_msgitem;
	}
	public void setU_msgitem(int u_msgitem) {
		this.u_msgitem = u_msgitem;
	}
	public int getU_keyitem() {
		return u_keyitem;
	}
	public void setU_keyitem(int u_keyitem) {
		this.u_keyitem = u_keyitem;
	}
	public int getU_seritem() {
		return u_seritem;
	}
	public void setU_seritem(int u_seritem) {
		this.u_seritem = u_seritem;
	}
	public int getU_msgactive() {
		return u_msgactive;
	}
	public void setU_msgactive(int u_msgactive) {
		this.u_msgactive = u_msgactive;
	}
	public int getU_active() {
		return u_active;
	}
	public void setU_active(int u_active) {
		this.u_active = u_active;
	}
	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", u_pwd=" + u_pwd + ", u_pnum=" + u_pnum + ", u_gender=" + u_gender
				+ ", u_birth=" + u_birth + ", u_num=" + u_num + ", u_regdate=" + u_regdate + ", u_role=" + u_role
				+ ", u_point=" + u_point + ", u_msgnum=" + u_msgnum + ", u_sernum=" + u_sernum + ", u_msgitem="
				+ u_msgitem + ", u_keyitem=" + u_keyitem + ", u_seritem=" + u_seritem + ", u_msgactive=" + u_msgactive
				+ ", u_active=" + u_active + "]";
	}
	
	
}
