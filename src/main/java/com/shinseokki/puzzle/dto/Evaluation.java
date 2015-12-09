package com.shinseokki.puzzle.dto;

import java.sql.Date;

public class Evaluation {
	private int u_num;
	private int e_eval;
	private Date e_regdate;
	
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public int getE_eval() {
		return e_eval;
	}
	public void setE_eval(int e_eval) {
		this.e_eval = e_eval;
	}
	public Date getE_regdate() {
		return e_regdate;
	}
	public void setE_regdate(Date e_regdate) {
		this.e_regdate = e_regdate;
	}
	
	@Override
	public String toString() {
		return "Evaluation [u_num=" + u_num + ", e_eval=" + e_eval + ", e_regdate=" + e_regdate + "]";
	}
}
