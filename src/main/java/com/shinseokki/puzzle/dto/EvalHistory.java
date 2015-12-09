package com.shinseokki.puzzle.dto;

import java.sql.Date;

public class EvalHistory {
	private int u_num;	// 평가 당하는 사람
	private int e_num;		// 평가한 사람
	private Date regdate;
	
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public int getE_num() {
		return e_num;
	}
	public void setE_num(int e_num) {
		this.e_num = e_num;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "EvalHistory [u_num=" + u_num + ", e_num=" + e_num + ", regdate=" + regdate + "]";
	}
}
