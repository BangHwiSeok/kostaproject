package com.shinseokki.puzzle.dao;

import java.util.Collection;

import com.shinseokki.puzzle.dto.Report;

public interface ReportDao {
	public int sendReport(Report report);
	public Collection<Report> getReports(int startIndex, int endIndex);
	public Collection<Report> getNoCheckReports(int startIndex, int endIndex);
	public Collection<Report> getCheckReports(int startIndex, int endIndex);
	public Report getReport(int rp_num);
	public int deleteReport(int rp_num);
	public int checkReport(int rp_num);
	public int getNoCheckCount();
	public int getReportCount();
	
}
