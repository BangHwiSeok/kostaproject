package com.shinseokki.puzzle.dto;

import java.sql.Date;

public class MyKeyword {
	private int m_num;
	private int u_num;
	private String m_rkey;
	private String m_skey;
	private int m_count;
	private Date m_regdate;
	
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public String getM_rkey() {
		return m_rkey;
	}
	public void setM_rkey(String m_rkey) {
		this.m_rkey = m_rkey;
	}
	public String getM_skey() {
		return m_skey;
	}
	public void setM_skey(String m_skey) {
		this.m_skey = m_skey;
	}
	public int getM_count() {
		return m_count;
	}
	public void setM_count(int m_count) {
		this.m_count = m_count;
	}
	public Date getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}
	
	@Override
	public String toString() {
		return "MyKeyword [m_num=" + m_num + ", u_num=" + u_num + ", m_rkey=" + m_rkey + ", m_skey=" + m_skey
				+ ", m_count=" + m_count + ", m_regdate=" + m_regdate + "]";
	}
	
	
}
