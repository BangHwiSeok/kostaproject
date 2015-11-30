package com.shinseokki.puzzle.service;

import java.util.Optional;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.shinseokki.puzzle.dao.UserDao;
import com.shinseokki.puzzle.dto.Role;
import com.shinseokki.puzzle.dto.User;
import com.shinseokki.puzzle.dto.UserCreateForm;

@Service
public class UserService{
	private final static Logger logger = LoggerFactory.getLogger(UserService.class);
	private UserDao userDao;
	
	@Autowired
	public UserService(SqlSession sqlSession) {
		userDao = sqlSession.getMapper(UserDao.class);
	}

	public Optional<User> getUser(String u_id) {
		logger.info("getUser");
		return userDao.getUser(u_id);
	}
	
	public int addUser(UserCreateForm form) {
		logger.info("addUser");
		User user = new User();
		
		user.setU_id(form.getU_id());
		
		// Password 암호화
		user.setU_pwd(new BCryptPasswordEncoder().encode(form.getU_pwd()));
		user.setU_birth(form.getU_birth());
		user.setU_gender(form.getU_gender());
		user.setU_role(form.getU_role());
		
		
		return userDao.addUser(user);
	}
	

}
