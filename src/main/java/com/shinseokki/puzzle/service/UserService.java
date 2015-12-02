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

import com.shinseokki.puzzle.dao.UserDao;
import com.shinseokki.puzzle.dto.Profile;
import com.shinseokki.puzzle.dto.User;
import com.shinseokki.puzzle.dto.UserCreateForm;

@Service
public class UserService {
	private final static Logger logger = LoggerFactory.getLogger(UserService.class);
	private final static int MAXPAGE = 10;
	private UserDao userDao;
	private ProfileService profileService;

	@Autowired
	public UserService(SqlSession sqlSession, ProfileService profileService) {
		logger.info("Constructed");
		userDao = sqlSession.getMapper(UserDao.class);
		this.profileService = profileService;
	}
	
	public Optional<User> findByID(String u_id){
		logger.info("findByID");
		return Optional.ofNullable(userDao.findByID(u_id));
	}

	public Optional<User> getUser(int u_num) {
		logger.info("getUser");
		return Optional.ofNullable(userDao.getUser(u_num));
	}
	public int getTotalPage(){
		return (int) Math.ceil(userDao.getCount()/((float)MAXPAGE));
	}
	
	// 비밀번호 변경 및 암호화
	public int changePwd(int u_num, String pwd){
		String password = new BCryptPasswordEncoder().encode(pwd);
		
		return userDao.changePWD(u_num, password);
	}
	
	
	@Transactional
	public int deleteUser(int u_num, String path){
		removeDIR(path+File.separatorChar+u_num);
		
		profileService.deleteProfile(u_num);
		
		return userDao.deleteUser(u_num);
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
		return userDao.approvalUser(u_num);
	}

	public Collection<User> getUnApprovalUsers(int pageNo){
		return userDao.getUnApprovalUsers( (pageNo-1)*MAXPAGE+1, (pageNo-1)*MAXPAGE+MAXPAGE );
	}
	public int countByUnActiveType(){
		return userDao.countByActiveType();
	}
	// ACTIVE Type에 따라 유저 정보를 확인한다.
	public int countByActiveType(){
		return userDao.countByActiveType();
	}
	
	public Collection<User> getUsers(int pageNo){
		return userDao.getUsers( (pageNo-1)*MAXPAGE+1, (pageNo-1)*MAXPAGE+MAXPAGE );
	}
	
	

	@Transactional
	public boolean addUser(UserCreateForm form, String path) {
		logger.info("addUser");
		User user = new User();

		user.setU_id(form.getU_id());

		// Password 암호화
		user.setU_pwd(new BCryptPasswordEncoder().encode(form.getU_pwd()));
		user.setU_birth(form.getU_birth());
		user.setU_gender(form.getU_gender());
		userDao.addUser(user);

		boolean isSave = false;
		
		// 저장된 User의 회원번호를 받기 위해 저장된 정보 받기
		user = userDao.findByID(user.getU_id());
		
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
			userDao.deleteUser(user.getU_num());
		}

		return isSave;
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
	}

}
