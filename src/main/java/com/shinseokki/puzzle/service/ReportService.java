package com.shinseokki.puzzle.service;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import javax.inject.Qualifier;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.shinseokki.puzzle.dao.ReportDao;
import com.shinseokki.puzzle.dto.Profile;
import com.shinseokki.puzzle.dto.Report;
import com.shinseokki.puzzle.dto.ReportForm;
import com.shinseokki.puzzle.dto.User;
import com.shinseokki.puzzle.dto.UserCreateForm;

@Service
public class ReportService {
	private final static Logger logger = LoggerFactory.getLogger(ReportService.class);
	private final static int MAXPAGE = 10;
	private ReportDao reportDao;

	@Autowired
	public ReportService(SqlSession sqlSession) {
		logger.info("Constructed");
		reportDao = sqlSession.getMapper(ReportDao.class);
	}
	
	// 토탈 페이지 받아오기 (int 값)
	public int getTotalPage(){
		return (int) Math.ceil(reportDao.getReportCount()/((float)MAXPAGE));
	}
	
	// 체크안한 내역으로 페이징 받아오기 (int 값)
	public int getNoCheckTotalPage(){
		return (int) Math.ceil(reportDao.getNoCheckCount()/((float)MAXPAGE));
	}
	
	// 체크한 내역으로 페이징 받아오기 (int 값)
	public int getCheckTotalPage(){
		return (int) Math.ceil((reportDao.getReportCount()-reportDao.getNoCheckCount())/((float)MAXPAGE));
	}
	
	// 모든 신고건수 가져오기
	public Collection<Report> getReports(int pageNo){
		//pageNo = getTotalPage();
		return reportDao.getReports( (pageNo-1)*MAXPAGE+1, (pageNo-1)*MAXPAGE+MAXPAGE );
	}
	
	// 확인한 신고건수 가져오기
	public Collection<Report> getCheckReports(int pageNo){
		return reportDao.getCheckReports( (pageNo-1)*MAXPAGE+1, (pageNo-1)*MAXPAGE+MAXPAGE );
	}
	
	// 확인 못 한 신고건수 가져오기
	public Collection<Report> getNoCheckReports(int pageNo){
		return reportDao.getNoCheckReports( (pageNo-1)*MAXPAGE+1, (pageNo-1)*MAXPAGE+MAXPAGE );
	}
	
	// 신고 세부내역 가져오기
	public Report getReport(int rp_num){
		return reportDao.getReport(rp_num);
	}
	
	// 신고 전송
	public boolean sendReport(ReportForm form, String path, int u_num)
			throws IllegalStateException, IOException {
		
		int i = 0;
		Report report = new Report();
		String filepath = path + File.separatorChar;
		
		//report.setRp_num(rp_num);
		
		MultipartFile file = form.getPhoto();
		file.transferTo(new File(filepath+File.separatorChar+file.getOriginalFilename()));
		
		report.setRp_id(form.getRp_id());
		report.setRp_sendid(form.getRp_sendid());
		report.setRp_content(form.getRp_content());
		report.setRp_file(form.getPhoto().getOriginalFilename());
		
		reportDao.sendReport(report);

		return true;
	}
	
	// 신고 내역 확인
	public void checkReport(int rp_num){
		reportDao.checkReport(rp_num);
	}
	
	public void deleteReport(int rp_num, String path){
		String filepath = path + File.separatorChar;
		File file = new File(filepath+rp_num); 
		try{
			if(file.exists()){
				file.delete();
			}
		}catch(Exception e){
			System.err.println(System.err);
		}finally{
			reportDao.deleteReport(rp_num);
		}
	}
	
	// 미신고 내역 총 갯수
	public int getNoCheckCount(){
		return reportDao.getNoCheckCount();
	}
	
	// 총 신고 수
	public int getReportCount(){
		return reportDao.getReportCount();
	}
	
	
	
	
}
