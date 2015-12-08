package com.shinseokki.puzzle.dto;

import java.sql.Date;

public class MyKeyword {
	private int u_num;
	private String keyword;
	private KeywordSelected status;
	private int m_count;
	private Date m_regdate;
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public KeywordSelected getStatus() {
		return status;
	}
	public void setStatus(KeywordSelected status) {
		this.status = status;
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
		return "MyKeyword [u_num=" + u_num + ", keyword=" + keyword + ", status=" + status + ", m_count=" + m_count
				+ ", m_regdate=" + m_regdate + "]";
	}
	
	
}
