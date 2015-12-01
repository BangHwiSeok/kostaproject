package com.shinseokki.puzzle.service;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.shinseokki.puzzle.dao.ProfileDao;
import com.shinseokki.puzzle.dao.UserDao;
import com.shinseokki.puzzle.dto.Profile;
import com.shinseokki.puzzle.dto.User;
import com.shinseokki.puzzle.dto.UserCreateForm;

//@Service
public class UserService {
	private final static Logger logger = LoggerFactory.getLogger(UserService.class);
	private final static int MAXPAGE = 10;
	private UserDao userDao;
	private ProfileDao profileDao;

	@Autowired
	public UserService(SqlSession sqlSession) {
		logger.info("Constructed");
		userDao = sqlSession.getMapper(UserDao.class);
		profileDao = sqlSession.getMapper(ProfileDao.class);
	}

	public Optional<User> getUser(String u_id) {
		logger.info("getUser");
		return Optional.ofNullable(userDao.getUser(u_id));
	}
	
	public Collection<User> getUsers(int pageNo){
		return userDao.getUsers((pageNo-1)*MAXPAGE+1, (pageNo-1)*MAXPAGE+MAXPAGE );
	}
	
	

	@Transactional
	public boolean addUser(UserCreateForm form, String path) {
		logger.info("addUser");
		User user = new User();

		user.setU_id(form.getU_id());

		// Password 암호화
		user.setU_pwd(new BCryptPasswordEncoder().encode(form.getU_pwd()));
		user.setU_num(new BCryptPasswordEncoder().encode(form.getU_id()));
		user.setU_birth(form.getU_birth());
		user.setU_gender(form.getU_gender());
		user.setU_role(form.getU_role());
		userDao.addUser(user);

		boolean isSave = false;
		
		// IMAGE 저장
		try {
			isSave = saveProfileImage(form, path, user.getU_id());
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (!isSave) {
			userDao.deleteUser(user.getU_id());
		}

		return isSave;
	}

	private boolean saveProfileImage(UserCreateForm form, String path, String u_id) throws IllegalStateException, IOException {
		int i = 0;
		Profile profile = new Profile();
		String filepath = path + File.separatorChar + u_id;
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
			profile.setU_id(u_id);
			
			
			
			
			for (List<MultipartFile> files = form.getPhotoes(); j < i; j++) {
				MultipartFile file = files.get(j);
				String extendType = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
				
				file.transferTo(new File(filepath+File.separatorChar+u_id+j+extendType));
				System.out.println("FILE TYPE : " + extendType);
				profile.setP_extendtype(extendType);
				profile.setP_photonum(j);
				profileDao.addProfile(profile);
			}
			

		}

		return true;
	}

}
