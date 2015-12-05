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
	
	// 토탈페이지 받아오기 (int 값)
	public int getTotalPage(){
		return (int) Math.ceil(reportDao.getReportCount()/((float)MAXPAGE));
	}
	
	// 모든 신고건수 가져오기
	public Collection<Report> getReports(int pageNo){
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
	
	/*@Transactional
	public boolean sendReport(String path) {
		logger.info("sendReport");
		Report report = new Report();

		report.setRp_num(form.getU_id());

		// Password 암호화
		user.setU_pwd(new BCryptPasswordEncoder().encode(form.getU_pwd()));
		user.setU_birth(form.getU_birth());
		user.setU_gender(form.getU_gender());
		reportDao.addUser(user);

		boolean isSave = false;
		
		// 저장된 User의 회원번호를 받기 위해 저장된 정보 받기
		user = reportDao.findByID(user.getU_id());
		
		// IMAGE 저장
			// IMAGE는 회원의 회원번호를 폴더이름으로 하고 IMAGE는 image+숫자로 저장된다.
		try {
			isSave = saveProfileImage(form, path, user.getU_num());
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (!isSave) {
			reportDao.deleteUser(user.getU_num());
		}

		return isSave;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Transactional
	public int deleteReport(String rp_num, String path){
		
		return reportDao.deleteUser(u_num);
	}
	// User의 사진을 모두 지운다.
	public void removeDIR(String path){
		File[] listFile = new File(path).listFiles(); 
		try{
			if(listFile.length > 0){
				for(int i = 0 ; i < listFile.length ; i++){
					if(listFile[i].isFile()){
						listFile[i].delete(); 
					}else{
						removeDIR(listFile[i].getPath());
					}
					listFile[i].delete();
				}
			}
		}catch(Exception e){
			System.err.println(System.err);
		}
			
	}
	public int approvalUser(int u_num){
		return reportDao.approvalUser(u_num);
	}

	public Collection<User> getUnApprovalUsers(int pageNo){
		return reportDao.getUnApprovalUsers( (pageNo-1)*MAXPAGE+1, (pageNo-1)*MAXPAGE+MAXPAGE );
	}
	public int countByUnActiveType(){
		return reportDao.countByActiveType();
	}
	// ACTIVE Type에 따라 유저 정보를 확인한다.
	public int countByActiveType(){
		return reportDao.countByActiveType();
	}
	
	public Collection<User> getUsers(int pageNo){
		return reportDao.getUsers( (pageNo-1)*MAXPAGE+1, (pageNo-1)*MAXPAGE+MAXPAGE );
	}
	
	



	private boolean saveProfileImage(UserCreateForm form, String path, int u_num) throws IllegalStateException, IOException {
		int i = 0;
		Profile profile = new Profile();
		String filepath = path + File.separatorChar + u_num;
		File directory = new File(filepath);
		if (!directory.exists()) {
			directory.mkdirs();
		}
		for (MultipartFile file : form.getPhotoes()) {
			if (file.getOriginalFilename() == "") {
				System.out.println("NULL " + i);
			} else {
				i++;
				System.out.println(file.getOriginalFilename());
			}
		}
		if (i < 2) {
			return false;
		} else {
			
			
			int j = 0;
			profile.setU_num(u_num);
			
			for (List<MultipartFile> files = form.getPhotoes(); j < i; j++) {
				MultipartFile file = files.get(j);
				String extendType = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
				
				file.transferTo(new File(filepath+File.separatorChar+u_num+j+extendType));
				System.out.println("FILE TYPE : " + extendType);
				profile.setP_extendtype(extendType);
				profile.setP_photonum(j);
				profileService.addProfile(profile);
			}
		}

		return true;
	}*/

}
